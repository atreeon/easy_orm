import 'package:freezed_annotation/freezed_annotation.dart';
part 'Customer_customer_demo.freezed.dart';
part 'Customer_customer_demo.g.dart';

@freezed
class Customer_customer_demo with _$Customer_customer_demo {
  const factory Customer_customer_demo({
    required String customer_id,
    required String customer_type_id,
  }) = _Customer_customer_demo;

  factory Customer_customer_demo.fromJson(Map<String, Object?> json) => //
      _$Customer_customer_demoFromJson(json);
}
