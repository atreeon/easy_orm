import 'package:freezed_annotation/freezed_annotation.dart';
part 'Order.freezed.dart';
part 'Order.g.dart';

@freezed
class Order with _$Order {
  const factory Order({
    required int order_id,
    required String customer_id,
    required String order_date,
    required String required_date,
    required String shipped_date,
    required double freight,
    required int employee_id,
    required int ship_via,
    required String ship_address,
    required String ship_city,
    required String ship_country,
    required String ship_name,
    required String ship_postal_code,
    required String ship_region,
  }) = _Order;

  factory Order.fromJson(Map<String, Object?> json) => //
      _$OrderFromJson(json);
}
