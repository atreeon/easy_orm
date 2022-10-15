import 'package:freezed_annotation/freezed_annotation.dart';
part 'Order_detail.freezed.dart';
part 'Order_detail.g.dart';

@freezed
class Order_detail with _$Order_detail {
  const factory Order_detail({
    required double discount,
    required double unit_price,
    required int order_id,
    required int product_id,
    required int quantity,
  }) = _Order_detail;

  factory Order_detail.fromJson(Map<String, Object?> json) => //
      _$Order_detailFromJson(json);
}
