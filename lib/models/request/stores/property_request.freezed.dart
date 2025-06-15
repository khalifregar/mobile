// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'property_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreatePropertyRequest _$CreatePropertyRequestFromJson(
    Map<String, dynamic> json) {
  return _CreatePropertyRequest.fromJson(json);
}

/// @nodoc
mixin _$CreatePropertyRequest {
  @JsonKey(name: 'namaRumah')
  String get namaRumah => throw _privateConstructorUsedError;
  @JsonKey(name: 'deskripsi')
  String get deskripsi => throw _privateConstructorUsedError;
  @JsonKey(name: 'tipeRumah')
  String get tipeRumah => throw _privateConstructorUsedError;
  @JsonKey(name: 'harga')
  int? get harga => throw _privateConstructorUsedError;
  @JsonKey(name: 'lokasi')
  String get lokasi => throw _privateConstructorUsedError;

  /// Serializes this CreatePropertyRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreatePropertyRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreatePropertyRequestCopyWith<CreatePropertyRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePropertyRequestCopyWith<$Res> {
  factory $CreatePropertyRequestCopyWith(CreatePropertyRequest value,
          $Res Function(CreatePropertyRequest) then) =
      _$CreatePropertyRequestCopyWithImpl<$Res, CreatePropertyRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'namaRumah') String namaRumah,
      @JsonKey(name: 'deskripsi') String deskripsi,
      @JsonKey(name: 'tipeRumah') String tipeRumah,
      @JsonKey(name: 'harga') int? harga,
      @JsonKey(name: 'lokasi') String lokasi});
}

/// @nodoc
class _$CreatePropertyRequestCopyWithImpl<$Res,
        $Val extends CreatePropertyRequest>
    implements $CreatePropertyRequestCopyWith<$Res> {
  _$CreatePropertyRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreatePropertyRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? namaRumah = null,
    Object? deskripsi = null,
    Object? tipeRumah = null,
    Object? harga = freezed,
    Object? lokasi = null,
  }) {
    return _then(_value.copyWith(
      namaRumah: null == namaRumah
          ? _value.namaRumah
          : namaRumah // ignore: cast_nullable_to_non_nullable
              as String,
      deskripsi: null == deskripsi
          ? _value.deskripsi
          : deskripsi // ignore: cast_nullable_to_non_nullable
              as String,
      tipeRumah: null == tipeRumah
          ? _value.tipeRumah
          : tipeRumah // ignore: cast_nullable_to_non_nullable
              as String,
      harga: freezed == harga
          ? _value.harga
          : harga // ignore: cast_nullable_to_non_nullable
              as int?,
      lokasi: null == lokasi
          ? _value.lokasi
          : lokasi // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreatePropertyRequestImplCopyWith<$Res>
    implements $CreatePropertyRequestCopyWith<$Res> {
  factory _$$CreatePropertyRequestImplCopyWith(
          _$CreatePropertyRequestImpl value,
          $Res Function(_$CreatePropertyRequestImpl) then) =
      __$$CreatePropertyRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'namaRumah') String namaRumah,
      @JsonKey(name: 'deskripsi') String deskripsi,
      @JsonKey(name: 'tipeRumah') String tipeRumah,
      @JsonKey(name: 'harga') int? harga,
      @JsonKey(name: 'lokasi') String lokasi});
}

/// @nodoc
class __$$CreatePropertyRequestImplCopyWithImpl<$Res>
    extends _$CreatePropertyRequestCopyWithImpl<$Res,
        _$CreatePropertyRequestImpl>
    implements _$$CreatePropertyRequestImplCopyWith<$Res> {
  __$$CreatePropertyRequestImplCopyWithImpl(_$CreatePropertyRequestImpl _value,
      $Res Function(_$CreatePropertyRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreatePropertyRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? namaRumah = null,
    Object? deskripsi = null,
    Object? tipeRumah = null,
    Object? harga = freezed,
    Object? lokasi = null,
  }) {
    return _then(_$CreatePropertyRequestImpl(
      namaRumah: null == namaRumah
          ? _value.namaRumah
          : namaRumah // ignore: cast_nullable_to_non_nullable
              as String,
      deskripsi: null == deskripsi
          ? _value.deskripsi
          : deskripsi // ignore: cast_nullable_to_non_nullable
              as String,
      tipeRumah: null == tipeRumah
          ? _value.tipeRumah
          : tipeRumah // ignore: cast_nullable_to_non_nullable
              as String,
      harga: freezed == harga
          ? _value.harga
          : harga // ignore: cast_nullable_to_non_nullable
              as int?,
      lokasi: null == lokasi
          ? _value.lokasi
          : lokasi // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreatePropertyRequestImpl implements _CreatePropertyRequest {
  const _$CreatePropertyRequestImpl(
      {@JsonKey(name: 'namaRumah') required this.namaRumah,
      @JsonKey(name: 'deskripsi') required this.deskripsi,
      @JsonKey(name: 'tipeRumah') required this.tipeRumah,
      @JsonKey(name: 'harga') this.harga,
      @JsonKey(name: 'lokasi') required this.lokasi});

  factory _$CreatePropertyRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatePropertyRequestImplFromJson(json);

  @override
  @JsonKey(name: 'namaRumah')
  final String namaRumah;
  @override
  @JsonKey(name: 'deskripsi')
  final String deskripsi;
  @override
  @JsonKey(name: 'tipeRumah')
  final String tipeRumah;
  @override
  @JsonKey(name: 'harga')
  final int? harga;
  @override
  @JsonKey(name: 'lokasi')
  final String lokasi;

  @override
  String toString() {
    return 'CreatePropertyRequest(namaRumah: $namaRumah, deskripsi: $deskripsi, tipeRumah: $tipeRumah, harga: $harga, lokasi: $lokasi)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePropertyRequestImpl &&
            (identical(other.namaRumah, namaRumah) ||
                other.namaRumah == namaRumah) &&
            (identical(other.deskripsi, deskripsi) ||
                other.deskripsi == deskripsi) &&
            (identical(other.tipeRumah, tipeRumah) ||
                other.tipeRumah == tipeRumah) &&
            (identical(other.harga, harga) || other.harga == harga) &&
            (identical(other.lokasi, lokasi) || other.lokasi == lokasi));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, namaRumah, deskripsi, tipeRumah, harga, lokasi);

  /// Create a copy of CreatePropertyRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePropertyRequestImplCopyWith<_$CreatePropertyRequestImpl>
      get copyWith => __$$CreatePropertyRequestImplCopyWithImpl<
          _$CreatePropertyRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatePropertyRequestImplToJson(
      this,
    );
  }
}

abstract class _CreatePropertyRequest implements CreatePropertyRequest {
  const factory _CreatePropertyRequest(
          {@JsonKey(name: 'namaRumah') required final String namaRumah,
          @JsonKey(name: 'deskripsi') required final String deskripsi,
          @JsonKey(name: 'tipeRumah') required final String tipeRumah,
          @JsonKey(name: 'harga') final int? harga,
          @JsonKey(name: 'lokasi') required final String lokasi}) =
      _$CreatePropertyRequestImpl;

  factory _CreatePropertyRequest.fromJson(Map<String, dynamic> json) =
      _$CreatePropertyRequestImpl.fromJson;

  @override
  @JsonKey(name: 'namaRumah')
  String get namaRumah;
  @override
  @JsonKey(name: 'deskripsi')
  String get deskripsi;
  @override
  @JsonKey(name: 'tipeRumah')
  String get tipeRumah;
  @override
  @JsonKey(name: 'harga')
  int? get harga;
  @override
  @JsonKey(name: 'lokasi')
  String get lokasi;

  /// Create a copy of CreatePropertyRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatePropertyRequestImplCopyWith<_$CreatePropertyRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UpdatePropertyRequest _$UpdatePropertyRequestFromJson(
    Map<String, dynamic> json) {
  return _UpdatePropertyRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdatePropertyRequest {
  @JsonKey(name: 'namaRumah')
  String? get namaRumah => throw _privateConstructorUsedError;
  @JsonKey(name: 'deskripsi')
  String? get deskripsi => throw _privateConstructorUsedError;
  @JsonKey(name: 'tipeRumah')
  String? get tipeRumah => throw _privateConstructorUsedError;
  @JsonKey(name: 'harga')
  int? get harga => throw _privateConstructorUsedError;
  @JsonKey(name: 'lokasi')
  String? get lokasi => throw _privateConstructorUsedError;
  @JsonKey(name: 'isAvailable')
  bool? get isAvailable => throw _privateConstructorUsedError;

  /// Serializes this UpdatePropertyRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdatePropertyRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdatePropertyRequestCopyWith<UpdatePropertyRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatePropertyRequestCopyWith<$Res> {
  factory $UpdatePropertyRequestCopyWith(UpdatePropertyRequest value,
          $Res Function(UpdatePropertyRequest) then) =
      _$UpdatePropertyRequestCopyWithImpl<$Res, UpdatePropertyRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'namaRumah') String? namaRumah,
      @JsonKey(name: 'deskripsi') String? deskripsi,
      @JsonKey(name: 'tipeRumah') String? tipeRumah,
      @JsonKey(name: 'harga') int? harga,
      @JsonKey(name: 'lokasi') String? lokasi,
      @JsonKey(name: 'isAvailable') bool? isAvailable});
}

/// @nodoc
class _$UpdatePropertyRequestCopyWithImpl<$Res,
        $Val extends UpdatePropertyRequest>
    implements $UpdatePropertyRequestCopyWith<$Res> {
  _$UpdatePropertyRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdatePropertyRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? namaRumah = freezed,
    Object? deskripsi = freezed,
    Object? tipeRumah = freezed,
    Object? harga = freezed,
    Object? lokasi = freezed,
    Object? isAvailable = freezed,
  }) {
    return _then(_value.copyWith(
      namaRumah: freezed == namaRumah
          ? _value.namaRumah
          : namaRumah // ignore: cast_nullable_to_non_nullable
              as String?,
      deskripsi: freezed == deskripsi
          ? _value.deskripsi
          : deskripsi // ignore: cast_nullable_to_non_nullable
              as String?,
      tipeRumah: freezed == tipeRumah
          ? _value.tipeRumah
          : tipeRumah // ignore: cast_nullable_to_non_nullable
              as String?,
      harga: freezed == harga
          ? _value.harga
          : harga // ignore: cast_nullable_to_non_nullable
              as int?,
      lokasi: freezed == lokasi
          ? _value.lokasi
          : lokasi // ignore: cast_nullable_to_non_nullable
              as String?,
      isAvailable: freezed == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdatePropertyRequestImplCopyWith<$Res>
    implements $UpdatePropertyRequestCopyWith<$Res> {
  factory _$$UpdatePropertyRequestImplCopyWith(
          _$UpdatePropertyRequestImpl value,
          $Res Function(_$UpdatePropertyRequestImpl) then) =
      __$$UpdatePropertyRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'namaRumah') String? namaRumah,
      @JsonKey(name: 'deskripsi') String? deskripsi,
      @JsonKey(name: 'tipeRumah') String? tipeRumah,
      @JsonKey(name: 'harga') int? harga,
      @JsonKey(name: 'lokasi') String? lokasi,
      @JsonKey(name: 'isAvailable') bool? isAvailable});
}

/// @nodoc
class __$$UpdatePropertyRequestImplCopyWithImpl<$Res>
    extends _$UpdatePropertyRequestCopyWithImpl<$Res,
        _$UpdatePropertyRequestImpl>
    implements _$$UpdatePropertyRequestImplCopyWith<$Res> {
  __$$UpdatePropertyRequestImplCopyWithImpl(_$UpdatePropertyRequestImpl _value,
      $Res Function(_$UpdatePropertyRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdatePropertyRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? namaRumah = freezed,
    Object? deskripsi = freezed,
    Object? tipeRumah = freezed,
    Object? harga = freezed,
    Object? lokasi = freezed,
    Object? isAvailable = freezed,
  }) {
    return _then(_$UpdatePropertyRequestImpl(
      namaRumah: freezed == namaRumah
          ? _value.namaRumah
          : namaRumah // ignore: cast_nullable_to_non_nullable
              as String?,
      deskripsi: freezed == deskripsi
          ? _value.deskripsi
          : deskripsi // ignore: cast_nullable_to_non_nullable
              as String?,
      tipeRumah: freezed == tipeRumah
          ? _value.tipeRumah
          : tipeRumah // ignore: cast_nullable_to_non_nullable
              as String?,
      harga: freezed == harga
          ? _value.harga
          : harga // ignore: cast_nullable_to_non_nullable
              as int?,
      lokasi: freezed == lokasi
          ? _value.lokasi
          : lokasi // ignore: cast_nullable_to_non_nullable
              as String?,
      isAvailable: freezed == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdatePropertyRequestImpl implements _UpdatePropertyRequest {
  const _$UpdatePropertyRequestImpl(
      {@JsonKey(name: 'namaRumah') this.namaRumah,
      @JsonKey(name: 'deskripsi') this.deskripsi,
      @JsonKey(name: 'tipeRumah') this.tipeRumah,
      @JsonKey(name: 'harga') this.harga,
      @JsonKey(name: 'lokasi') this.lokasi,
      @JsonKey(name: 'isAvailable') this.isAvailable});

  factory _$UpdatePropertyRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdatePropertyRequestImplFromJson(json);

  @override
  @JsonKey(name: 'namaRumah')
  final String? namaRumah;
  @override
  @JsonKey(name: 'deskripsi')
  final String? deskripsi;
  @override
  @JsonKey(name: 'tipeRumah')
  final String? tipeRumah;
  @override
  @JsonKey(name: 'harga')
  final int? harga;
  @override
  @JsonKey(name: 'lokasi')
  final String? lokasi;
  @override
  @JsonKey(name: 'isAvailable')
  final bool? isAvailable;

  @override
  String toString() {
    return 'UpdatePropertyRequest(namaRumah: $namaRumah, deskripsi: $deskripsi, tipeRumah: $tipeRumah, harga: $harga, lokasi: $lokasi, isAvailable: $isAvailable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePropertyRequestImpl &&
            (identical(other.namaRumah, namaRumah) ||
                other.namaRumah == namaRumah) &&
            (identical(other.deskripsi, deskripsi) ||
                other.deskripsi == deskripsi) &&
            (identical(other.tipeRumah, tipeRumah) ||
                other.tipeRumah == tipeRumah) &&
            (identical(other.harga, harga) || other.harga == harga) &&
            (identical(other.lokasi, lokasi) || other.lokasi == lokasi) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, namaRumah, deskripsi, tipeRumah, harga, lokasi, isAvailable);

  /// Create a copy of UpdatePropertyRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePropertyRequestImplCopyWith<_$UpdatePropertyRequestImpl>
      get copyWith => __$$UpdatePropertyRequestImplCopyWithImpl<
          _$UpdatePropertyRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdatePropertyRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdatePropertyRequest implements UpdatePropertyRequest {
  const factory _UpdatePropertyRequest(
          {@JsonKey(name: 'namaRumah') final String? namaRumah,
          @JsonKey(name: 'deskripsi') final String? deskripsi,
          @JsonKey(name: 'tipeRumah') final String? tipeRumah,
          @JsonKey(name: 'harga') final int? harga,
          @JsonKey(name: 'lokasi') final String? lokasi,
          @JsonKey(name: 'isAvailable') final bool? isAvailable}) =
      _$UpdatePropertyRequestImpl;

  factory _UpdatePropertyRequest.fromJson(Map<String, dynamic> json) =
      _$UpdatePropertyRequestImpl.fromJson;

  @override
  @JsonKey(name: 'namaRumah')
  String? get namaRumah;
  @override
  @JsonKey(name: 'deskripsi')
  String? get deskripsi;
  @override
  @JsonKey(name: 'tipeRumah')
  String? get tipeRumah;
  @override
  @JsonKey(name: 'harga')
  int? get harga;
  @override
  @JsonKey(name: 'lokasi')
  String? get lokasi;
  @override
  @JsonKey(name: 'isAvailable')
  bool? get isAvailable;

  /// Create a copy of UpdatePropertyRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatePropertyRequestImplCopyWith<_$UpdatePropertyRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
