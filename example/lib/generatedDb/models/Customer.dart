import 'package:freezed_annotation/freezed_annotation.dart';
part 'Customer.freezed.dart';
part 'Customer.g.dart';

@freezed
class Customer with _$Customer {
  const factory Customer({
    required String customer_id,
    required String company_name,
    required String address,
    required String city,
    required String contact_name,
    required String contact_title,
    required String country,
    required String fax,
    required String phone,
    required String postal_code,
    required String region,
  }) = _Customer;

  factory Customer.fromJson(Map<String, Object?> json) => //
      _$CustomerFromJson(json);
}
