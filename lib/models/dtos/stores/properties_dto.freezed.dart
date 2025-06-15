// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'properties_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PropertyDto _$PropertyDtoFromJson(Map<String, dynamic> json) {
  return _PropertyDto.fromJson(json);
}

/// @nodoc
mixin _$PropertyDto {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'property_id')
  String? get propertyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'nama_rumah')
  String? get namaRumah => throw _privateConstructorUsedError;
  @JsonKey(name: 'harga')
  int? get harga => throw _privateConstructorUsedError;
  @JsonKey(name: 'tipe_rumah')
  String? get tipeRumah => throw _privateConstructorUsedError;
  String? get deskripsi =>
      throw _privateConstructorUsedError; // ✅ Lokasi detail
  String? get provinsi => throw _privateConstructorUsedError;
  String? get kabupaten => throw _privateConstructorUsedError;
  String? get kecamatan => throw _privateConstructorUsedError;
  String? get kelurahan => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PropertyDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PropertyDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PropertyDtoCopyWith<PropertyDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PropertyDtoCopyWith<$Res> {
  factory $PropertyDtoCopyWith(
          PropertyDto value, $Res Function(PropertyDto) then) =
      _$PropertyDtoCopyWithImpl<$Res, PropertyDto>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'property_id') String? propertyId,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'nama_rumah') String? namaRumah,
      @JsonKey(name: 'harga') int? harga,
      @JsonKey(name: 'tipe_rumah') String? tipeRumah,
      String? deskripsi,
      String? provinsi,
      String? kabupaten,
      String? kecamatan,
      String? kelurahan,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$PropertyDtoCopyWithImpl<$Res, $Val extends PropertyDto>
    implements $PropertyDtoCopyWith<$Res> {
  _$PropertyDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PropertyDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? propertyId = freezed,
    Object? userId = freezed,
    Object? namaRumah = freezed,
    Object? harga = freezed,
    Object? tipeRumah = freezed,
    Object? deskripsi = freezed,
    Object? provinsi = freezed,
    Object? kabupaten = freezed,
    Object? kecamatan = freezed,
    Object? kelurahan = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      propertyId: freezed == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      namaRumah: freezed == namaRumah
          ? _value.namaRumah
          : namaRumah // ignore: cast_nullable_to_non_nullable
              as String?,
      harga: freezed == harga
          ? _value.harga
          : harga // ignore: cast_nullable_to_non_nullable
              as int?,
      tipeRumah: freezed == tipeRumah
          ? _value.tipeRumah
          : tipeRumah // ignore: cast_nullable_to_non_nullable
              as String?,
      deskripsi: freezed == deskripsi
          ? _value.deskripsi
          : deskripsi // ignore: cast_nullable_to_non_nullable
              as String?,
      provinsi: freezed == provinsi
          ? _value.provinsi
          : provinsi // ignore: cast_nullable_to_non_nullable
              as String?,
      kabupaten: freezed == kabupaten
          ? _value.kabupaten
          : kabupaten // ignore: cast_nullable_to_non_nullable
              as String?,
      kecamatan: freezed == kecamatan
          ? _value.kecamatan
          : kecamatan // ignore: cast_nullable_to_non_nullable
              as String?,
      kelurahan: freezed == kelurahan
          ? _value.kelurahan
          : kelurahan // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PropertyDtoImplCopyWith<$Res>
    implements $PropertyDtoCopyWith<$Res> {
  factory _$$PropertyDtoImplCopyWith(
          _$PropertyDtoImpl value, $Res Function(_$PropertyDtoImpl) then) =
      __$$PropertyDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'property_id') String? propertyId,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'nama_rumah') String? namaRumah,
      @JsonKey(name: 'harga') int? harga,
      @JsonKey(name: 'tipe_rumah') String? tipeRumah,
      String? deskripsi,
      String? provinsi,
      String? kabupaten,
      String? kecamatan,
      String? kelurahan,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$PropertyDtoImplCopyWithImpl<$Res>
    extends _$PropertyDtoCopyWithImpl<$Res, _$PropertyDtoImpl>
    implements _$$PropertyDtoImplCopyWith<$Res> {
  __$$PropertyDtoImplCopyWithImpl(
      _$PropertyDtoImpl _value, $Res Function(_$PropertyDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PropertyDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? propertyId = freezed,
    Object? userId = freezed,
    Object? namaRumah = freezed,
    Object? harga = freezed,
    Object? tipeRumah = freezed,
    Object? deskripsi = freezed,
    Object? provinsi = freezed,
    Object? kabupaten = freezed,
    Object? kecamatan = freezed,
    Object? kelurahan = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PropertyDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      propertyId: freezed == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      namaRumah: freezed == namaRumah
          ? _value.namaRumah
          : namaRumah // ignore: cast_nullable_to_non_nullable
              as String?,
      harga: freezed == harga
          ? _value.harga
          : harga // ignore: cast_nullable_to_non_nullable
              as int?,
      tipeRumah: freezed == tipeRumah
          ? _value.tipeRumah
          : tipeRumah // ignore: cast_nullable_to_non_nullable
              as String?,
      deskripsi: freezed == deskripsi
          ? _value.deskripsi
          : deskripsi // ignore: cast_nullable_to_non_nullable
              as String?,
      provinsi: freezed == provinsi
          ? _value.provinsi
          : provinsi // ignore: cast_nullable_to_non_nullable
              as String?,
      kabupaten: freezed == kabupaten
          ? _value.kabupaten
          : kabupaten // ignore: cast_nullable_to_non_nullable
              as String?,
      kecamatan: freezed == kecamatan
          ? _value.kecamatan
          : kecamatan // ignore: cast_nullable_to_non_nullable
              as String?,
      kelurahan: freezed == kelurahan
          ? _value.kelurahan
          : kelurahan // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PropertyDtoImpl implements _PropertyDto {
  const _$PropertyDtoImpl(
      {this.id,
      @JsonKey(name: 'property_id') this.propertyId,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'nama_rumah') this.namaRumah,
      @JsonKey(name: 'harga') this.harga,
      @JsonKey(name: 'tipe_rumah') this.tipeRumah,
      this.deskripsi,
      this.provinsi,
      this.kabupaten,
      this.kecamatan,
      this.kelurahan,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$PropertyDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PropertyDtoImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'property_id')
  final String? propertyId;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @JsonKey(name: 'nama_rumah')
  final String? namaRumah;
  @override
  @JsonKey(name: 'harga')
  final int? harga;
  @override
  @JsonKey(name: 'tipe_rumah')
  final String? tipeRumah;
  @override
  final String? deskripsi;
// ✅ Lokasi detail
  @override
  final String? provinsi;
  @override
  final String? kabupaten;
  @override
  final String? kecamatan;
  @override
  final String? kelurahan;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'PropertyDto(id: $id, propertyId: $propertyId, userId: $userId, namaRumah: $namaRumah, harga: $harga, tipeRumah: $tipeRumah, deskripsi: $deskripsi, provinsi: $provinsi, kabupaten: $kabupaten, kecamatan: $kecamatan, kelurahan: $kelurahan, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PropertyDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.propertyId, propertyId) ||
                other.propertyId == propertyId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.namaRumah, namaRumah) ||
                other.namaRumah == namaRumah) &&
            (identical(other.harga, harga) || other.harga == harga) &&
            (identical(other.tipeRumah, tipeRumah) ||
                other.tipeRumah == tipeRumah) &&
            (identical(other.deskripsi, deskripsi) ||
                other.deskripsi == deskripsi) &&
            (identical(other.provinsi, provinsi) ||
                other.provinsi == provinsi) &&
            (identical(other.kabupaten, kabupaten) ||
                other.kabupaten == kabupaten) &&
            (identical(other.kecamatan, kecamatan) ||
                other.kecamatan == kecamatan) &&
            (identical(other.kelurahan, kelurahan) ||
                other.kelurahan == kelurahan) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      propertyId,
      userId,
      namaRumah,
      harga,
      tipeRumah,
      deskripsi,
      provinsi,
      kabupaten,
      kecamatan,
      kelurahan,
      createdAt,
      updatedAt);

  /// Create a copy of PropertyDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PropertyDtoImplCopyWith<_$PropertyDtoImpl> get copyWith =>
      __$$PropertyDtoImplCopyWithImpl<_$PropertyDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PropertyDtoImplToJson(
      this,
    );
  }
}

abstract class _PropertyDto implements PropertyDto {
  const factory _PropertyDto(
          {final int? id,
          @JsonKey(name: 'property_id') final String? propertyId,
          @JsonKey(name: 'user_id') final int? userId,
          @JsonKey(name: 'nama_rumah') final String? namaRumah,
          @JsonKey(name: 'harga') final int? harga,
          @JsonKey(name: 'tipe_rumah') final String? tipeRumah,
          final String? deskripsi,
          final String? provinsi,
          final String? kabupaten,
          final String? kecamatan,
          final String? kelurahan,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt}) =
      _$PropertyDtoImpl;

  factory _PropertyDto.fromJson(Map<String, dynamic> json) =
      _$PropertyDtoImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'property_id')
  String? get propertyId;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(name: 'nama_rumah')
  String? get namaRumah;
  @override
  @JsonKey(name: 'harga')
  int? get harga;
  @override
  @JsonKey(name: 'tipe_rumah')
  String? get tipeRumah;
  @override
  String? get deskripsi; // ✅ Lokasi detail
  @override
  String? get provinsi;
  @override
  String? get kabupaten;
  @override
  String? get kecamatan;
  @override
  String? get kelurahan;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of PropertyDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PropertyDtoImplCopyWith<_$PropertyDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PropertyTypeResponseDto _$PropertyTypeResponseDtoFromJson(
    Map<String, dynamic> json) {
  return _PropertyTypeResponseDto.fromJson(json);
}

/// @nodoc
mixin _$PropertyTypeResponseDto {
  List<String> get types => throw _privateConstructorUsedError;

  /// Serializes this PropertyTypeResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PropertyTypeResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PropertyTypeResponseDtoCopyWith<PropertyTypeResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PropertyTypeResponseDtoCopyWith<$Res> {
  factory $PropertyTypeResponseDtoCopyWith(PropertyTypeResponseDto value,
          $Res Function(PropertyTypeResponseDto) then) =
      _$PropertyTypeResponseDtoCopyWithImpl<$Res, PropertyTypeResponseDto>;
  @useResult
  $Res call({List<String> types});
}

/// @nodoc
class _$PropertyTypeResponseDtoCopyWithImpl<$Res,
        $Val extends PropertyTypeResponseDto>
    implements $PropertyTypeResponseDtoCopyWith<$Res> {
  _$PropertyTypeResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PropertyTypeResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? types = null,
  }) {
    return _then(_value.copyWith(
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PropertyTypeResponseDtoImplCopyWith<$Res>
    implements $PropertyTypeResponseDtoCopyWith<$Res> {
  factory _$$PropertyTypeResponseDtoImplCopyWith(
          _$PropertyTypeResponseDtoImpl value,
          $Res Function(_$PropertyTypeResponseDtoImpl) then) =
      __$$PropertyTypeResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> types});
}

/// @nodoc
class __$$PropertyTypeResponseDtoImplCopyWithImpl<$Res>
    extends _$PropertyTypeResponseDtoCopyWithImpl<$Res,
        _$PropertyTypeResponseDtoImpl>
    implements _$$PropertyTypeResponseDtoImplCopyWith<$Res> {
  __$$PropertyTypeResponseDtoImplCopyWithImpl(
      _$PropertyTypeResponseDtoImpl _value,
      $Res Function(_$PropertyTypeResponseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PropertyTypeResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? types = null,
  }) {
    return _then(_$PropertyTypeResponseDtoImpl(
      types: null == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PropertyTypeResponseDtoImpl implements _PropertyTypeResponseDto {
  const _$PropertyTypeResponseDtoImpl({required final List<String> types})
      : _types = types;

  factory _$PropertyTypeResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PropertyTypeResponseDtoImplFromJson(json);

  final List<String> _types;
  @override
  List<String> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  @override
  String toString() {
    return 'PropertyTypeResponseDto(types: $types)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PropertyTypeResponseDtoImpl &&
            const DeepCollectionEquality().equals(other._types, _types));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_types));

  /// Create a copy of PropertyTypeResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PropertyTypeResponseDtoImplCopyWith<_$PropertyTypeResponseDtoImpl>
      get copyWith => __$$PropertyTypeResponseDtoImplCopyWithImpl<
          _$PropertyTypeResponseDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PropertyTypeResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _PropertyTypeResponseDto implements PropertyTypeResponseDto {
  const factory _PropertyTypeResponseDto({required final List<String> types}) =
      _$PropertyTypeResponseDtoImpl;

  factory _PropertyTypeResponseDto.fromJson(Map<String, dynamic> json) =
      _$PropertyTypeResponseDtoImpl.fromJson;

  @override
  List<String> get types;

  /// Create a copy of PropertyTypeResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PropertyTypeResponseDtoImplCopyWith<_$PropertyTypeResponseDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CreatePropertyResponseDto _$CreatePropertyResponseDtoFromJson(
    Map<String, dynamic> json) {
  return _CreatePropertyResponseDto.fromJson(json);
}

/// @nodoc
mixin _$CreatePropertyResponseDto {
  String? get message => throw _privateConstructorUsedError;
  PropertyDto get data => throw _privateConstructorUsedError;

  /// Serializes this CreatePropertyResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreatePropertyResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreatePropertyResponseDtoCopyWith<CreatePropertyResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePropertyResponseDtoCopyWith<$Res> {
  factory $CreatePropertyResponseDtoCopyWith(CreatePropertyResponseDto value,
          $Res Function(CreatePropertyResponseDto) then) =
      _$CreatePropertyResponseDtoCopyWithImpl<$Res, CreatePropertyResponseDto>;
  @useResult
  $Res call({String? message, PropertyDto data});

  $PropertyDtoCopyWith<$Res> get data;
}

/// @nodoc
class _$CreatePropertyResponseDtoCopyWithImpl<$Res,
        $Val extends CreatePropertyResponseDto>
    implements $CreatePropertyResponseDtoCopyWith<$Res> {
  _$CreatePropertyResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreatePropertyResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PropertyDto,
    ) as $Val);
  }

  /// Create a copy of CreatePropertyResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PropertyDtoCopyWith<$Res> get data {
    return $PropertyDtoCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreatePropertyResponseDtoImplCopyWith<$Res>
    implements $CreatePropertyResponseDtoCopyWith<$Res> {
  factory _$$CreatePropertyResponseDtoImplCopyWith(
          _$CreatePropertyResponseDtoImpl value,
          $Res Function(_$CreatePropertyResponseDtoImpl) then) =
      __$$CreatePropertyResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, PropertyDto data});

  @override
  $PropertyDtoCopyWith<$Res> get data;
}

/// @nodoc
class __$$CreatePropertyResponseDtoImplCopyWithImpl<$Res>
    extends _$CreatePropertyResponseDtoCopyWithImpl<$Res,
        _$CreatePropertyResponseDtoImpl>
    implements _$$CreatePropertyResponseDtoImplCopyWith<$Res> {
  __$$CreatePropertyResponseDtoImplCopyWithImpl(
      _$CreatePropertyResponseDtoImpl _value,
      $Res Function(_$CreatePropertyResponseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreatePropertyResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? data = null,
  }) {
    return _then(_$CreatePropertyResponseDtoImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PropertyDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreatePropertyResponseDtoImpl implements _CreatePropertyResponseDto {
  const _$CreatePropertyResponseDtoImpl({this.message, required this.data});

  factory _$CreatePropertyResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatePropertyResponseDtoImplFromJson(json);

  @override
  final String? message;
  @override
  final PropertyDto data;

  @override
  String toString() {
    return 'CreatePropertyResponseDto(message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePropertyResponseDtoImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, data);

  /// Create a copy of CreatePropertyResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePropertyResponseDtoImplCopyWith<_$CreatePropertyResponseDtoImpl>
      get copyWith => __$$CreatePropertyResponseDtoImplCopyWithImpl<
          _$CreatePropertyResponseDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatePropertyResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _CreatePropertyResponseDto implements CreatePropertyResponseDto {
  const factory _CreatePropertyResponseDto(
      {final String? message,
      required final PropertyDto data}) = _$CreatePropertyResponseDtoImpl;

  factory _CreatePropertyResponseDto.fromJson(Map<String, dynamic> json) =
      _$CreatePropertyResponseDtoImpl.fromJson;

  @override
  String? get message;
  @override
  PropertyDto get data;

  /// Create a copy of CreatePropertyResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatePropertyResponseDtoImplCopyWith<_$CreatePropertyResponseDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
