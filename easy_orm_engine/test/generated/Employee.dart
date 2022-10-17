// ignore_for_file: unused_import
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:typed_data';
part 'Employee.freezed.dart';
part 'Employee.g.dart';

@freezed
class Employee with _$Employee {
  const factory Employee({
    required int employee_id,
    required String first_name,
    required String last_name,
    required DateTime? birth_date,
    required DateTime? hire_date,
    required int? reports_to,
    required String? notes,
    required String? address,
    required String? city,
    required String? country,
    required String? extension,
    required String? home_phone,
    required String? photo_path,
    required String? postal_code,
    required String? region,
    required String? title,
    required String? title_of_courtesy,
  }) = _Employee;

  factory Employee.fromJson(Map<String, Object?> json) => //
      _$EmployeeFromJson(json);
}
