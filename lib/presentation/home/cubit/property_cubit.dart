import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propedia/models/dtos/stores/properties_dto.dart';
import 'package:propedia/models/request/stores/property_request.dart';
import 'package:propedia/services/stores/properties_api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'property_state.dart';

class PropertyCubit extends Cubit<PropertyState> {
  final PropertiesApiService _api;
  List<PropertyDto> userPostedProperties = [];

  PropertyDto? editingProperty;

  PropertyCubit(this._api) : super(const PropertyState.initial()) {
    _loadFromPrefs();
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('userPostedProperties');
    if (jsonString != null) {
      try {
        final List<dynamic> decoded = json.decode(jsonString);
        userPostedProperties =
            decoded.map((e) => PropertyDto.fromJson(e)).toList();
        emit(PropertyState.success(userPostedProperties));
      } catch (e) {
        debugPrint('❌ Failed to load from prefs: $e');
      }
    }
  }

  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded =
        json.encode(userPostedProperties.map((e) => e.toJson()).toList());
    await prefs.setString('userPostedProperties', encoded);
  }

  Future<String> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    if (token == null) throw Exception("Token tidak ditemukan");
    return token;
  }

  Future<void> fetchAllProperties(String role) async {
    emit(const PropertyState.loading());
    try {
      final token = await _getToken();

      List<PropertyDto> result;
      if (role == 'pembeli') {
        result = await _api.getBuyerProperties('Bearer $token'); // ✅ pakai token
      } else {
        result = await _api.getMyProperties(role, 'Bearer $token');
      }

      userPostedProperties = result;
      await _saveToPrefs();
      emit(PropertyState.success(result));
    } catch (e) {
      debugPrint('❌ Error fetchAllProperties: $e');
      emit(PropertyState.error("Gagal ambil properti: ${e.toString()}"));
    }
  }

  Future<void> getDetail(String role, String propertyId) async {
    emit(const PropertyState.loading());
    try {
      final token = await _getToken();

      final property = (role == 'pembeli')
          ? await _api.getBuyerPropertyDetail(propertyId)
          : await _api.getPropertyDetail(role, propertyId, 'Bearer $token');
      emit(PropertyState.detail(property));
    } catch (e) {
      debugPrint('❌ Error getDetail: $e');
      emit(PropertyState.error("Gagal ambil detail: ${e.toString()}"));
    }
  }

  Future<void> create(String role, CreatePropertyRequest request) async {
    emit(const PropertyState.loading());
    try {
      final token = await _getToken();

      final response =
          await _api.createProperty(role, request, 'Bearer $token');
      final property = response.data;

      userPostedProperties.insert(0, property);
      await _saveToPrefs();

      debugPrint("✅ Property created:");
      debugPrint("📦 JSON: ${property.toJson()}");

      emit(PropertyState.created(property));
    } catch (e, stack) {
      debugPrint("❌ Gagal createProperty: $e");
      debugPrint("📌 Stacktrace: $stack");
      emit(PropertyState.error("Gagal buat properti: ${e.toString()}"));
    }
  }

Future<void> update(
  String role,
  String propertyId,
  UpdatePropertyRequest request,
) async {
  emit(const PropertyState.loading());
  try {
    final token = await _getToken();

    final updatedProperty =
        await _api.updateProperty(role, propertyId, request, 'Bearer $token');

    final index =
        userPostedProperties.indexWhere((e) => e.propertyId == propertyId);
    if (index != -1) {
      userPostedProperties[index] = updatedProperty;
      await _saveToPrefs();
    }

    emit(const PropertyState.updated());
    emit(PropertyState.success(userPostedProperties));
  } catch (e) {
    debugPrint('❌ Error updateProperty: $e');
    emit(PropertyState.error("Gagal update properti: ${e.toString()}"));
  }
}


  Future<void> delete(String role, String propertyId) async {
    emit(const PropertyState.loading());
    try {
      final token = await _getToken();
      await _api.deleteProperty(role, propertyId, 'Bearer $token');

      userPostedProperties.removeWhere((e) => e.propertyId == propertyId);
      await _saveToPrefs();

      debugPrint('✅ Properti $propertyId berhasil dihapus');
      emit(const PropertyState.deleted());
      emit(PropertyState.success(userPostedProperties));
    } catch (e, stack) {
      debugPrint('❌ Error deleteProperty: $e');
      debugPrint('📌 Stacktrace: $stack');
      emit(PropertyState.error("Gagal hapus properti: ${e.toString()}"));
    }
  }

  Future<List<String>> getPropertyTypes() async {
    try {
      final token = await _getToken();
      final result = await _api.getPropertyTypes('Bearer $token');
      debugPrint("📦 getPropertyTypes: ${result.types}");
      return result.types;
    } catch (e) {
      debugPrint('❌ Error getPropertyTypes: $e');
      throw Exception('Gagal ambil tipe properti: $e');
    }
  }

  void startEditing(PropertyDto property) {
    editingProperty = property;
    debugPrint("📝 Mulai edit properti: ${property.propertyId}");
  }

  void clearEditing() {
    editingProperty = null;
  }

  Future<void> fetchByLocation({
  String? provinsi,
  String? kabupaten,
  String? kecamatan,
  String? kelurahan,
}) async {
  emit(const PropertyState.loading());
  try {
    final token = await _getToken();

    final result = await _api.getPropertiesByLocation(
      provinsi: provinsi,
      kabupaten: kabupaten,
      kecamatan: kecamatan,
      kelurahan: kelurahan,
      token: 'Bearer $token',
    );

    emit(PropertyState.success(result));
  } catch (e) {
    debugPrint('❌ Error fetchByLocation: $e');
    emit(PropertyState.error("Gagal ambil properti berdasarkan lokasi: ${e.toString()}"));
  }
}

}
