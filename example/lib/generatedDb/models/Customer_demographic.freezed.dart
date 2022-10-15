// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'Customer_demographic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Customer_demographic _$Customer_demographicFromJson(Map<String, dynamic> json) {
  return _Customer_demographic.fromJson(json);
}

/// @nodoc
mixin _$Customer_demographic {
  String get customer_type_id => throw _privateConstructorUsedError;
  String get customer_desc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $Customer_demographicCopyWith<Customer_demographic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Customer_demographicCopyWith<$Res> {
  factory $Customer_demographicCopyWith(Customer_demographic value,
          $Res Function(Customer_demographic) then) =
      _$Customer_demographicCopyWithImpl<$Res>;
  $Res call({String customer_type_id, String customer_desc});
}

/// @nodoc
class _$Customer_demographicCopyWithImpl<$Res>
    implements $Customer_demographicCopyWith<$Res> {
  _$Customer_demographicCopyWithImpl(this._value, this._then);

  final Customer_demographic _value;
  // ignore: unused_field
  final $Res Function(Customer_demographic) _then;

  @override
  $Res call({
    Object? customer_type_id = freezed,
    Object? customer_desc = freezed,
  }) {
    return _then(_value.copyWith(
      customer_type_id: customer_type_id == freezed
          ? _value.customer_type_id
          : customer_type_id // ignore: cast_nullable_to_non_nullable
              as String,
      customer_desc: customer_desc == freezed
          ? _value.customer_desc
          : customer_desc // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_Customer_demographicCopyWith<$Res>
    implements $Customer_demographicCopyWith<$Res> {
  factory _$$_Customer_demographicCopyWith(_$_Customer_demographic value,
          $Res Function(_$_Customer_demographic) then) =
      __$$_Customer_demographicCopyWithImpl<$Res>;
  @override
  $Res call({String customer_type_id, String customer_desc});
}

/// @nodoc
class __$$_Customer_demographicCopyWithImpl<$Res>
    extends _$Customer_demographicCopyWithImpl<$Res>
    implements _$$_Customer_demographicCopyWith<$Res> {
  __$$_Customer_demographicCopyWithImpl(_$_Customer_demographic _value,
      $Res Function(_$_Customer_demographic) _then)
      : super(_value, (v) => _then(v as _$_Customer_demographic));

  @override
  _$_Customer_demographic get _value => super._value as _$_Customer_demographic;

  @override
  $Res call({
    Object? customer_type_id = freezed,
    Object? customer_desc = freezed,
  }) {
    return _then(_$_Customer_demographic(
      customer_type_id: customer_type_id == freezed
          ? _value.customer_type_id
          : customer_type_id // ignore: cast_nullable_to_non_nullable
              as String,
      customer_desc: customer_desc == freezed
          ? _value.customer_desc
          : customer_desc // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Customer_demographic implements _Customer_demographic {
  const _$_Customer_demographic(
      {required this.customer_type_id, required this.customer_desc});

  factory _$_Customer_demographic.fromJson(Map<String, dynamic> json) =>
      _$$_Customer_demographicFromJson(json);

  @override
  final String customer_type_id;
  @override
  final String customer_desc;

  @override
  String toString() {
    return 'Customer_demographic(customer_type_id: $customer_type_id, customer_desc: $customer_desc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Customer_demographic &&
            const DeepCollectionEquality()
                .equals(other.customer_type_id, customer_type_id) &&
            const DeepCollectionEquality()
                .equals(other.customer_desc, customer_desc));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(customer_type_id),
      const DeepCollectionEquality().hash(customer_desc));

  @JsonKey(ignore: true)
  @override
  _$$_Customer_demographicCopyWith<_$_Customer_demographic> get copyWith =>
      __$$_Customer_demographicCopyWithImpl<_$_Customer_demographic>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_Customer_demographicToJson(
      this,
    );
  }
}

abstract class _Customer_demographic implements Customer_demographic {
  const factory _Customer_demographic(
      {required final String customer_type_id,
      required final String customer_desc}) = _$_Customer_demographic;

  factory _Customer_demographic.fromJson(Map<String, dynamic> json) =
      _$_Customer_demographic.fromJson;

  @override
  String get customer_type_id;
  @override
  String get customer_desc;
  @override
  @JsonKey(ignore: true)
  _$$_Customer_demographicCopyWith<_$_Customer_demographic> get copyWith =>
      throw _privateConstructorUsedError;
}
