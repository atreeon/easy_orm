// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      product_id: json['product_id'] as int,
      discontinued: json['discontinued'] as int,
      product_name: json['product_name'] as String,
      unit_price: (json['unit_price'] as num).toDouble(),
      category_id: json['category_id'] as int,
      reorder_level: json['reorder_level'] as int,
      supplier_id: json['supplier_id'] as int,
      units_in_stock: json['units_in_stock'] as int,
      units_on_order: json['units_on_order'] as int,
      quantity_per_unit: json['quantity_per_unit'] as String,
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'product_id': instance.product_id,
      'discontinued': instance.discontinued,
      'product_name': instance.product_name,
      'unit_price': instance.unit_price,
      'category_id': instance.category_id,
      'reorder_level': instance.reorder_level,
      'supplier_id': instance.supplier_id,
      'units_in_stock': instance.units_in_stock,
      'units_on_order': instance.units_on_order,
      'quantity_per_unit': instance.quantity_per_unit,
    };
