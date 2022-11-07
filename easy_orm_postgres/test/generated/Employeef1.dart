import 'Employee.dart';

Employee EmployeeF1({
  required int employee_id,
  required String title_of_courtesy,
  required String last_name,
}) {
  return Employee(
    employee_id: employee_id,
    first_name: "first_name",
    last_name: last_name,
    birth_date: null,
    hire_date: null,
    reports_to: null,
    notes: null,
    address: null,
    city: null,
    country: null,
    extension: null,
    home_phone: null,
    photo_path: null,
    postal_code: null,
    region: null,
    title: null,
    title_of_courtesy: title_of_courtesy,
  );
}
