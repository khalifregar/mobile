// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreatePropertyRequestImpl _$$CreatePropertyRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreatePropertyRequestImpl(
      namaRumah: json['namaRumah'] as String,
      deskripsi: json['deskripsi'] as String,
      tipeRumah: json['tipeRumah'] as String,
      harga: (json['harga'] as num?)?.toInt(),
      lokasi: json['lokasi'] as String,
    );

Map<String, dynamic> _$$CreatePropertyRequestImplToJson(
        _$CreatePropertyRequestImpl instance) =>
    <String, dynamic>{
      'namaRumah': instance.namaRumah,
      'deskripsi': instance.deskripsi,
      'tipeRumah': instance.tipeRumah,
      'harga': instance.harga,
      'lokasi': instance.lokasi,
    };

_$UpdatePropertyRequestImpl _$$UpdatePropertyRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdatePropertyRequestImpl(
      namaRumah: json['namaRumah'] as String?,
      deskripsi: json['deskripsi'] as String?,
      tipeRumah: json['tipeRumah'] as String?,
      harga: (json['harga'] as num?)?.toInt(),
      lokasi: json['lokasi'] as String?,
      isAvailable: json['isAvailable'] as bool?,
    );

Map<String, dynamic> _$$UpdatePropertyRequestImplToJson(
        _$UpdatePropertyRequestImpl instance) =>
    <String, dynamic>{
      'namaRumah': instance.namaRumah,
      'deskripsi': instance.deskripsi,
      'tipeRumah': instance.tipeRumah,
      'harga': instance.harga,
      'lokasi': instance.lokasi,
      'isAvailable': instance.isAvailable,
    };
