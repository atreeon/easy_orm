import 'package:freezed_annotation/freezed_annotation.dart';
part 'Employee_territorie.freezed.dart';
part 'Employee_territorie.g.dart';

@freezed
class Employee_territorie with _$Employee_territorie {
  const factory Employee_territorie({
    required int employee_id,
    required String territory_id,
  }) = _Employee_territorie;

  factory Employee_territorie.fromJson(Map<String, Object?> json) => //
      _$Employee_territorieFromJson(json);
}
