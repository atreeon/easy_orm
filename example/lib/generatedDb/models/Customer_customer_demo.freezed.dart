// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'Customer_customer_demo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Customer_customer_demo _$Customer_customer_demoFromJson(
    Map<String, dynamic> json) {
  return _Customer_customer_demo.fromJson(json);
}

/// @nodoc
mixin _$Customer_customer_demo {
  String get customer_id => throw _privateConstructorUsedError;
  String get customer_type_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $Customer_customer_demoCopyWith<Customer_customer_demo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Customer_customer_demoCopyWith<$Res> {
  factory $Customer_customer_demoCopyWith(Customer_customer_demo value,
          $Res Function(Customer_customer_demo) then) =
      _$Customer_customer_demoCopyWithImpl<$Res>;
  $Res call({String customer_id, String customer_type_id});
}

/// @nodoc
class _$Customer_customer_demoCopyWithImpl<$Res>
    implements $Customer_customer_demoCopyWith<$Res> {
  _$Customer_customer_demoCopyWithImpl(this._value, this._then);

  final Customer_customer_demo _value;
  // ignore: unused_field
  final $Res Function(Customer_customer_demo) _then;

  @override
  $Res call({
    Object? customer_id = freezed,
    Object? customer_type_id = freezed,
  }) {
    return _then(_value.copyWith(
      customer_id: customer_id == freezed
          ? _value.customer_id
          : customer_id // ignore: cast_nullable_to_non_nullable
              as String,
      customer_type_id: customer_type_id == freezed
          ? _value.customer_type_id
          : customer_type_id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_Customer_customer_demoCopyWith<$Res>
    implements $Customer_customer_demoCopyWith<$Res> {
  factory _$$_Customer_customer_demoCopyWith(_$_Customer_customer_demo value,
          $Res Function(_$_Customer_customer_demo) then) =
      __$$_Customer_customer_demoCopyWithImpl<$Res>;
  @override
  $Res call({String customer_id, String customer_type_id});
}

/// @nodoc
class __$$_Customer_customer_demoCopyWithImpl<$Res>
    extends _$Customer_customer_demoCopyWithImpl<$Res>
    implements _$$_Customer_customer_demoCopyWith<$Res> {
  __$$_Customer_customer_demoCopyWithImpl(_$_Customer_customer_demo _value,
      $Res Function(_$_Customer_customer_demo) _then)
      : super(_value, (v) => _then(v as _$_Customer_customer_demo));

  @override
  _$_Customer_customer_demo get _value =>
      super._value as _$_Customer_customer_demo;

  @override
  $Res call({
    Object? customer_id = freezed,
    Object? customer_type_id = freezed,
  }) {
    return _then(_$_Customer_customer_demo(
      customer_id: customer_id == freezed
          ? _value.customer_id
          : customer_id // ignore: cast_nullable_to_non_nullable
              as String,
      customer_type_id: customer_type_id == freezed
          ? _value.customer_type_id
          : customer_type_id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Customer_customer_demo implements _Customer_customer_demo {
  const _$_Customer_customer_demo(
      {required this.customer_id, required this.customer_type_id});

  factory _$_Customer_customer_demo.fromJson(Map<String, dynamic> json) =>
      _$$_Customer_customer_demoFromJson(json);

  @override
  final String customer_id;
  @override
  final String customer_type_id;

  @override
  String toString() {
    return 'Customer_customer_demo(customer_id: $customer_id, customer_type_id: $customer_type_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Customer_customer_demo &&
            const DeepCollectionEquality()
                .equals(other.customer_id, customer_id) &&
            const DeepCollectionEquality()
                .equals(other.customer_type_id, customer_type_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(customer_id),
      const DeepCollectionEquality().hash(customer_type_id));

  @JsonKey(ignore: true)
  @override
  _$$_Customer_customer_demoCopyWith<_$_Customer_customer_demo> get copyWith =>
      __$$_Customer_customer_demoCopyWithImpl<_$_Customer_customer_demo>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_Customer_customer_demoToJson(
      this,
    );
  }
}

abstract class _Customer_customer_demo implements Customer_customer_demo {
  const factory _Customer_customer_demo(
      {required final String customer_id,
      required final String customer_type_id}) = _$_Customer_customer_demo;

  factory _Customer_customer_demo.fromJson(Map<String, dynamic> json) =
      _$_Customer_customer_demo.fromJson;

  @override
  String get customer_id;
  @override
  String get customer_type_id;
  @override
  @JsonKey(ignore: true)
  _$$_Customer_customer_demoCopyWith<_$_Customer_customer_demo> get copyWith =>
      throw _privateConstructorUsedError;
}
