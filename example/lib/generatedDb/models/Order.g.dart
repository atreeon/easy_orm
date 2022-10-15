// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Order _$$_OrderFromJson(Map<String, dynamic> json) => _$_Order(
      order_id: json['order_id'] as int,
      customer_id: json['customer_id'] as String,
      order_date: json['order_date'] as String,
      required_date: json['required_date'] as String,
      shipped_date: json['shipped_date'] as String,
      freight: (json['freight'] as num).toDouble(),
      employee_id: json['employee_id'] as int,
      ship_via: json['ship_via'] as int,
      ship_address: json['ship_address'] as String,
      ship_city: json['ship_city'] as String,
      ship_country: json['ship_country'] as String,
      ship_name: json['ship_name'] as String,
      ship_postal_code: json['ship_postal_code'] as String,
      ship_region: json['ship_region'] as String,
    );

Map<String, dynamic> _$$_OrderToJson(_$_Order instance) => <String, dynamic>{
      'order_id': instance.order_id,
      'customer_id': instance.customer_id,
      'order_date': instance.order_date,
      'required_date': instance.required_date,
      'shipped_date': instance.shipped_date,
      'freight': instance.freight,
      'employee_id': instance.employee_id,
      'ship_via': instance.ship_via,
      'ship_address': instance.ship_address,
      'ship_city': instance.ship_city,
      'ship_country': instance.ship_country,
      'ship_name': instance.ship_name,
      'ship_postal_code': instance.ship_postal_code,
      'ship_region': instance.ship_region,
    };
