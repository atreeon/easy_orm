import 'package:freezed_annotation/freezed_annotation.dart';
part 'Customer_demographic.freezed.dart';
part 'Customer_demographic.g.dart';

@freezed
class Customer_demographic with _$Customer_demographic {
  const factory Customer_demographic({
    required String customer_type_id,
    required String customer_desc,
  }) = _Customer_demographic;

  factory Customer_demographic.fromJson(Map<String, Object?> json) => //
      _$Customer_demographicFromJson(json);
}
