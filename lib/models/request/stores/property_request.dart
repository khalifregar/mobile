import 'package:freezed_annotation/freezed_annotation.dart';

part 'property_request.freezed.dart';
part 'property_request.g.dart';

@freezed
class CreatePropertyRequest with _$CreatePropertyRequest {
  const factory CreatePropertyRequest({
    @JsonKey(name: 'namaRumah') required String namaRumah,
    @JsonKey(name: 'deskripsi') required String deskripsi,
    @JsonKey(name: 'tipeRumah') required String tipeRumah,
    @JsonKey(name: 'harga') int? harga,
    @JsonKey(name: 'lokasi') required String lokasi,
  }) = _CreatePropertyRequest;

  factory CreatePropertyRequest.fromJson(Map<String, dynamic> json) =>
      _$CreatePropertyRequestFromJson(json);
}


@freezed
class UpdatePropertyRequest with _$UpdatePropertyRequest {
  const factory UpdatePropertyRequest({
    @JsonKey(name: 'namaRumah') String? namaRumah,
    @JsonKey(name: 'deskripsi') String? deskripsi,
    @JsonKey(name: 'tipeRumah') String? tipeRumah,
    @JsonKey(name: 'harga') int? harga,
    @JsonKey(name: 'lokasi') String? lokasi,
    @JsonKey(name: 'isAvailable') bool? isAvailable,
  }) = _UpdatePropertyRequest;

  factory UpdatePropertyRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePropertyRequestFromJson(json);
}
