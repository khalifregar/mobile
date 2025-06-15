// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'properties_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PropertyDtoImpl _$$PropertyDtoImplFromJson(Map<String, dynamic> json) =>
    _$PropertyDtoImpl(
      id: (json['id'] as num?)?.toInt(),
      propertyId: json['property_id'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      namaRumah: json['nama_rumah'] as String?,
      harga: (json['harga'] as num?)?.toInt(),
      tipeRumah: json['tipe_rumah'] as String?,
      deskripsi: json['deskripsi'] as String?,
      provinsi: json['provinsi'] as String?,
      kabupaten: json['kabupaten'] as String?,
      kecamatan: json['kecamatan'] as String?,
      kelurahan: json['kelurahan'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$PropertyDtoImplToJson(_$PropertyDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'property_id': instance.propertyId,
      'user_id': instance.userId,
      'nama_rumah': instance.namaRumah,
      'harga': instance.harga,
      'tipe_rumah': instance.tipeRumah,
      'deskripsi': instance.deskripsi,
      'provinsi': instance.provinsi,
      'kabupaten': instance.kabupaten,
      'kecamatan': instance.kecamatan,
      'kelurahan': instance.kelurahan,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_$PropertyTypeResponseDtoImpl _$$PropertyTypeResponseDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PropertyTypeResponseDtoImpl(
      types: (json['types'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$PropertyTypeResponseDtoImplToJson(
        _$PropertyTypeResponseDtoImpl instance) =>
    <String, dynamic>{
      'types': instance.types,
    };

_$CreatePropertyResponseDtoImpl _$$CreatePropertyResponseDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CreatePropertyResponseDtoImpl(
      message: json['message'] as String?,
      data: PropertyDto.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CreatePropertyResponseDtoImplToJson(
        _$CreatePropertyResponseDtoImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
