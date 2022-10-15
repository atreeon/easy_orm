import 'package:freezed_annotation/freezed_annotation.dart';
part 'Shipper.freezed.dart';
part 'Shipper.g.dart';

@freezed
class Shipper with _$Shipper {
  const factory Shipper({
    required int shipper_id,
    required String company_name,
    required String phone,
  }) = _Shipper;

  factory Shipper.fromJson(Map<String, Object?> json) => //
      _$ShipperFromJson(json);
}
