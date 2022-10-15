import 'package:freezed_annotation/freezed_annotation.dart';
part 'Product.freezed.dart';
part 'Product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required int product_id,
    required int discontinued,
    required String product_name,
    required double unit_price,
    required int category_id,
    required int reorder_level,
    required int supplier_id,
    required int units_in_stock,
    required int units_on_order,
    required String quantity_per_unit,
  }) = _Product;

  factory Product.fromJson(Map<String, Object?> json) => //
      _$ProductFromJson(json);
}
