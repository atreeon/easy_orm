// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Order_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Order_detail _$$_Order_detailFromJson(Map<String, dynamic> json) =>
    _$_Order_detail(
      discount: (json['discount'] as num).toDouble(),
      unit_price: (json['unit_price'] as num).toDouble(),
      order_id: json['order_id'] as int,
      product_id: json['product_id'] as int,
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$$_Order_detailToJson(_$_Order_detail instance) =>
    <String, dynamic>{
      'discount': instance.discount,
      'unit_price': instance.unit_price,
      'order_id': instance.order_id,
      'product_id': instance.product_id,
      'quantity': instance.quantity,
    };
