import 'package:freezed_annotation/freezed_annotation.dart';

part 'properties_dto.freezed.dart';
part 'properties_dto.g.dart';

@freezed
class PropertyDto with _$PropertyDto {
  const factory PropertyDto({
    int? id,
    @JsonKey(name: 'property_id') String? propertyId,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'nama_rumah') String? namaRumah,
    @JsonKey(name: 'harga') int? harga,
    @JsonKey(name: 'tipe_rumah') String? tipeRumah,
    String? deskripsi,

    // ✅ Lokasi detail
    String? provinsi,
    String? kabupaten,
    String? kecamatan,
    String? kelurahan,

    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _PropertyDto;

  factory PropertyDto.fromJson(Map<String, dynamic> json) =>
      _$PropertyDtoFromJson(json);
}

@freezed
class PropertyTypeResponseDto with _$PropertyTypeResponseDto {
  const factory PropertyTypeResponseDto({
    required List<String> types,
  }) = _PropertyTypeResponseDto;

  factory PropertyTypeResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PropertyTypeResponseDtoFromJson(json);
}

@freezed
class CreatePropertyResponseDto with _$CreatePropertyResponseDto {
  const factory CreatePropertyResponseDto({
    String? message,
    required PropertyDto data,
  }) = _CreatePropertyResponseDto;

  factory CreatePropertyResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CreatePropertyResponseDtoFromJson(json);
}
