import 'package:freezed_annotation/freezed_annotation.dart';
part 'Employee.freezed.dart';
part 'Employee.g.dart';

@freezed
class Employee with _$Employee {
  const factory Employee({
    required int employee_id,
    required String first_name,
    required String last_name,
    required String photo,
    required String birth_date,
    required String hire_date,
    required int reports_to,
    required String notes,
    required String address,
    required String city,
    required String country,
    required String extension,
    required String home_phone,
    required String photo_path,
    required String postal_code,
    required String region,
    required String title,
    required String title_of_courtesy,
  }) = _Employee;

  factory Employee.fromJson(Map<String, Object?> json) => //
      _$EmployeeFromJson(json);
}
