// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'Shipper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Shipper _$ShipperFromJson(Map<String, dynamic> json) {
  return _Shipper.fromJson(json);
}

/// @nodoc
mixin _$Shipper {
  int get shipper_id => throw _privateConstructorUsedError;
  String get company_name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShipperCopyWith<Shipper> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShipperCopyWith<$Res> {
  factory $ShipperCopyWith(Shipper value, $Res Function(Shipper) then) =
      _$ShipperCopyWithImpl<$Res>;
  $Res call({int shipper_id, String company_name, String phone});
}

/// @nodoc
class _$ShipperCopyWithImpl<$Res> implements $ShipperCopyWith<$Res> {
  _$ShipperCopyWithImpl(this._value, this._then);

  final Shipper _value;
  // ignore: unused_field
  final $Res Function(Shipper) _then;

  @override
  $Res call({
    Object? shipper_id = freezed,
    Object? company_name = freezed,
    Object? phone = freezed,
  }) {
    return _then(_value.copyWith(
      shipper_id: shipper_id == freezed
          ? _value.shipper_id
          : shipper_id // ignore: cast_nullable_to_non_nullable
              as int,
      company_name: company_name == freezed
          ? _value.company_name
          : company_name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ShipperCopyWith<$Res> implements $ShipperCopyWith<$Res> {
  factory _$$_ShipperCopyWith(
          _$_Shipper value, $Res Function(_$_Shipper) then) =
      __$$_ShipperCopyWithImpl<$Res>;
  @override
  $Res call({int shipper_id, String company_name, String phone});
}

/// @nodoc
class __$$_ShipperCopyWithImpl<$Res> extends _$ShipperCopyWithImpl<$Res>
    implements _$$_ShipperCopyWith<$Res> {
  __$$_ShipperCopyWithImpl(_$_Shipper _value, $Res Function(_$_Shipper) _then)
      : super(_value, (v) => _then(v as _$_Shipper));

  @override
  _$_Shipper get _value => super._value as _$_Shipper;

  @override
  $Res call({
    Object? shipper_id = freezed,
    Object? company_name = freezed,
    Object? phone = freezed,
  }) {
    return _then(_$_Shipper(
      shipper_id: shipper_id == freezed
          ? _value.shipper_id
          : shipper_id // ignore: cast_nullable_to_non_nullable
              as int,
      company_name: company_name == freezed
          ? _value.company_name
          : company_name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Shipper implements _Shipper {
  const _$_Shipper(
      {required this.shipper_id,
      required this.company_name,
      required this.phone});

  factory _$_Shipper.fromJson(Map<String, dynamic> json) =>
      _$$_ShipperFromJson(json);

  @override
  final int shipper_id;
  @override
  final String company_name;
  @override
  final String phone;

  @override
  String toString() {
    return 'Shipper(shipper_id: $shipper_id, company_name: $company_name, phone: $phone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Shipper &&
            const DeepCollectionEquality()
                .equals(other.shipper_id, shipper_id) &&
            const DeepCollectionEquality()
                .equals(other.company_name, company_name) &&
            const DeepCollectionEquality().equals(other.phone, phone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(shipper_id),
      const DeepCollectionEquality().hash(company_name),
      const DeepCollectionEquality().hash(phone));

  @JsonKey(ignore: true)
  @override
  _$$_ShipperCopyWith<_$_Shipper> get copyWith =>
      __$$_ShipperCopyWithImpl<_$_Shipper>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShipperToJson(
      this,
    );
  }
}

abstract class _Shipper implements Shipper {
  const factory _Shipper(
      {required final int shipper_id,
      required final String company_name,
      required final String phone}) = _$_Shipper;

  factory _Shipper.fromJson(Map<String, dynamic> json) = _$_Shipper.fromJson;

  @override
  int get shipper_id;
  @override
  String get company_name;
  @override
  String get phone;
  @override
  @JsonKey(ignore: true)
  _$$_ShipperCopyWith<_$_Shipper> get copyWith =>
      throw _privateConstructorUsedError;
}
