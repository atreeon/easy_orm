import 'package:freezed_annotation/freezed_annotation.dart';
part 'Supplier.freezed.dart';
part 'Supplier.g.dart';

@freezed
class Supplier with _$Supplier {
  const factory Supplier({
    required int supplier_id,
    required String company_name,
    required String homepage,
    required String address,
    required String city,
    required String contact_name,
    required String contact_title,
    required String country,
    required String fax,
    required String phone,
    required String postal_code,
    required String region,
  }) = _Supplier;

  factory Supplier.fromJson(Map<String, Object?> json) => //
      _$SupplierFromJson(json);
}
