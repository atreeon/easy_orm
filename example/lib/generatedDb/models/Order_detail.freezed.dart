// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'Order_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Order_detail _$Order_detailFromJson(Map<String, dynamic> json) {
  return _Order_detail.fromJson(json);
}

/// @nodoc
mixin _$Order_detail {
  double get discount => throw _privateConstructorUsedError;
  double get unit_price => throw _privateConstructorUsedError;
  int get order_id => throw _privateConstructorUsedError;
  int get product_id => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $Order_detailCopyWith<Order_detail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Order_detailCopyWith<$Res> {
  factory $Order_detailCopyWith(
          Order_detail value, $Res Function(Order_detail) then) =
      _$Order_detailCopyWithImpl<$Res>;
  $Res call(
      {double discount,
      double unit_price,
      int order_id,
      int product_id,
      int quantity});
}

/// @nodoc
class _$Order_detailCopyWithImpl<$Res> implements $Order_detailCopyWith<$Res> {
  _$Order_detailCopyWithImpl(this._value, this._then);

  final Order_detail _value;
  // ignore: unused_field
  final $Res Function(Order_detail) _then;

  @override
  $Res call({
    Object? discount = freezed,
    Object? unit_price = freezed,
    Object? order_id = freezed,
    Object? product_id = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_value.copyWith(
      discount: discount == freezed
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      unit_price: unit_price == freezed
          ? _value.unit_price
          : unit_price // ignore: cast_nullable_to_non_nullable
              as double,
      order_id: order_id == freezed
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
              as int,
      product_id: product_id == freezed
          ? _value.product_id
          : product_id // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_Order_detailCopyWith<$Res>
    implements $Order_detailCopyWith<$Res> {
  factory _$$_Order_detailCopyWith(
          _$_Order_detail value, $Res Function(_$_Order_detail) then) =
      __$$_Order_detailCopyWithImpl<$Res>;
  @override
  $Res call(
      {double discount,
      double unit_price,
      int order_id,
      int product_id,
      int quantity});
}

/// @nodoc
class __$$_Order_detailCopyWithImpl<$Res>
    extends _$Order_detailCopyWithImpl<$Res>
    implements _$$_Order_detailCopyWith<$Res> {
  __$$_Order_detailCopyWithImpl(
      _$_Order_detail _value, $Res Function(_$_Order_detail) _then)
      : super(_value, (v) => _then(v as _$_Order_detail));

  @override
  _$_Order_detail get _value => super._value as _$_Order_detail;

  @override
  $Res call({
    Object? discount = freezed,
    Object? unit_price = freezed,
    Object? order_id = freezed,
    Object? product_id = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_$_Order_detail(
      discount: discount == freezed
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      unit_price: unit_price == freezed
          ? _value.unit_price
          : unit_price // ignore: cast_nullable_to_non_nullable
              as double,
      order_id: order_id == freezed
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
              as int,
      product_id: product_id == freezed
          ? _value.product_id
          : product_id // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Order_detail implements _Order_detail {
  const _$_Order_detail(
      {required this.discount,
      required this.unit_price,
      required this.order_id,
      required this.product_id,
      required this.quantity});

  factory _$_Order_detail.fromJson(Map<String, dynamic> json) =>
      _$$_Order_detailFromJson(json);

  @override
  final double discount;
  @override
  final double unit_price;
  @override
  final int order_id;
  @override
  final int product_id;
  @override
  final int quantity;

  @override
  String toString() {
    return 'Order_detail(discount: $discount, unit_price: $unit_price, order_id: $order_id, product_id: $product_id, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Order_detail &&
            const DeepCollectionEquality().equals(other.discount, discount) &&
            const DeepCollectionEquality()
                .equals(other.unit_price, unit_price) &&
            const DeepCollectionEquality().equals(other.order_id, order_id) &&
            const DeepCollectionEquality()
                .equals(other.product_id, product_id) &&
            const DeepCollectionEquality().equals(other.quantity, quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(discount),
      const DeepCollectionEquality().hash(unit_price),
      const DeepCollectionEquality().hash(order_id),
      const DeepCollectionEquality().hash(product_id),
      const DeepCollectionEquality().hash(quantity));

  @JsonKey(ignore: true)
  @override
  _$$_Order_detailCopyWith<_$_Order_detail> get copyWith =>
      __$$_Order_detailCopyWithImpl<_$_Order_detail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_Order_detailToJson(
      this,
    );
  }
}

abstract class _Order_detail implements Order_detail {
  const factory _Order_detail(
      {required final double discount,
      required final double unit_price,
      required final int order_id,
      required final int product_id,
      required final int quantity}) = _$_Order_detail;

  factory _Order_detail.fromJson(Map<String, dynamic> json) =
      _$_Order_detail.fromJson;

  @override
  double get discount;
  @override
  double get unit_price;
  @override
  int get order_id;
  @override
  int get product_id;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$_Order_detailCopyWith<_$_Order_detail> get copyWith =>
      throw _privateConstructorUsedError;
}
