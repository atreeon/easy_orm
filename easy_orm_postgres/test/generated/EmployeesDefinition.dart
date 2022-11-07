// ignore_for_file: unused_import
import 'dart:typed_data';

import 'package:easy_orm_postgres/ITableDefinition.dart';
import 'package:easy_orm_postgres/column.dart';

import 'Employee.dart';

class EmployeesDefinition implements ITableDefinition<Employee> {
  final String tableName = "employees";

  ColumnNumeric<int, Employee> employee_id = ColumnNumeric<int, Employee>(
    name: "employee_id",
    nullable: false,
    isIdentity: true,
    datatype: "int2",
    getDbValue: (row) => row["employees"]!["employee_id"],
    getModelValue: (model) => model.employee_id,
  );

  ColumnChar<String, Employee> first_name = ColumnChar<String, Employee>(
    name: "first_name",
    nullable: false,
    isIdentity: false,
    datatype: "varchar",
    getDbValue: (row) => row["employees"]!["first_name"],
    getModelValue: (model) => model.first_name,
  );

  ColumnChar<String, Employee> last_name = ColumnChar<String, Employee>(
    name: "last_name",
    nullable: false,
    isIdentity: false,
    datatype: "varchar",
    getDbValue: (row) => row["employees"]!["last_name"],
    getModelValue: (model) => model.last_name,
  );

  ColumnNullableDateTime<DateTime?, Employee> birth_date = ColumnNullableDateTime<DateTime?, Employee>(
    name: "birth_date",
    nullable: true,
    isIdentity: false,
    datatype: "date",
    getDbValue: (row) => row["employees"]!["birth_date"],
    getModelValue: (model) => model.birth_date,
  );

  ColumnNullableDateTime<DateTime?, Employee> hire_date = ColumnNullableDateTime<DateTime?, Employee>(
    name: "hire_date",
    nullable: true,
    isIdentity: false,
    datatype: "date",
    getDbValue: (row) => row["employees"]!["hire_date"],
    getModelValue: (model) => model.hire_date,
  );

  ColumnNullableNumeric<int?, Employee> reports_to = ColumnNullableNumeric<int?, Employee>(
    name: "reports_to",
    nullable: true,
    isIdentity: false,
    datatype: "int2",
    getDbValue: (row) => row["employees"]!["reports_to"],
    getModelValue: (model) => model.reports_to,
  );

  ColumnNullableChar<String?, Employee> notes = ColumnNullableChar<String?, Employee>(
    name: "notes",
    nullable: true,
    isIdentity: false,
    datatype: "text",
    getDbValue: (row) => row["employees"]!["notes"],
    getModelValue: (model) => model.notes,
  );

  ColumnNullableChar<String?, Employee> address = ColumnNullableChar<String?, Employee>(
    name: "address",
    nullable: true,
    isIdentity: false,
    datatype: "varchar",
    getDbValue: (row) => row["employees"]!["address"],
    getModelValue: (model) => model.address,
  );

  ColumnNullableChar<String?, Employee> city = ColumnNullableChar<String?, Employee>(
    name: "city",
    nullable: true,
    isIdentity: false,
    datatype: "varchar",
    getDbValue: (row) => row["employees"]!["city"],
    getModelValue: (model) => model.city,
  );

  ColumnNullableChar<String?, Employee> country = ColumnNullableChar<String?, Employee>(
    name: "country",
    nullable: true,
    isIdentity: false,
    datatype: "varchar",
    getDbValue: (row) => row["employees"]!["country"],
    getModelValue: (model) => model.country,
  );

  ColumnNullableChar<String?, Employee> extension = ColumnNullableChar<String?, Employee>(
    name: "extension",
    nullable: true,
    isIdentity: false,
    datatype: "varchar",
    getDbValue: (row) => row["employees"]!["extension"],
    getModelValue: (model) => model.extension,
  );

  ColumnNullableChar<String?, Employee> home_phone = ColumnNullableChar<String?, Employee>(
    name: "home_phone",
    nullable: true,
    isIdentity: false,
    datatype: "varchar",
    getDbValue: (row) => row["employees"]!["home_phone"],
    getModelValue: (model) => model.home_phone,
  );

  ColumnNullableChar<String?, Employee> photo_path = ColumnNullableChar<String?, Employee>(
    name: "photo_path",
    nullable: true,
    isIdentity: false,
    datatype: "varchar",
    getDbValue: (row) => row["employees"]!["photo_path"],
    getModelValue: (model) => model.photo_path,
  );

  ColumnNullableChar<String?, Employee> postal_code = ColumnNullableChar<String?, Employee>(
    name: "postal_code",
    nullable: true,
    isIdentity: false,
    datatype: "varchar",
    getDbValue: (row) => row["employees"]!["postal_code"],
    getModelValue: (model) => model.postal_code,
  );

  ColumnNullableChar<String?, Employee> region = ColumnNullableChar<String?, Employee>(
    name: "region",
    nullable: true,
    isIdentity: false,
    datatype: "varchar",
    getDbValue: (row) => row["employees"]!["region"],
    getModelValue: (model) => model.region,
  );

  ColumnNullableChar<String?, Employee> title = ColumnNullableChar<String?, Employee>(
    name: "title",
    nullable: true,
    isIdentity: false,
    datatype: "varchar",
    getDbValue: (row) => row["employees"]!["title"],
    getModelValue: (model) => model.title,
  );

  ColumnNullableChar<String?, Employee> title_of_courtesy = ColumnNullableChar<String?, Employee>(
    name: "title_of_courtesy",
    nullable: true,
    isIdentity: false,
    datatype: "varchar",
    getDbValue: (row) => row["employees"]!["title_of_courtesy"],
    getModelValue: (model) => model.title_of_courtesy,
  );

  List<dynamic> get allColumns => [employee_id, first_name, last_name, birth_date, hire_date, reports_to, notes, address, city, country, extension, home_phone, photo_path, postal_code, region, title, title_of_courtesy];

  Employee getTypeFromRow(Map<String, Map<String, dynamic>> row) {
    return Employee(
      employee_id: row[this.tableName]![this.employee_id.name],
      first_name: row[this.tableName]![this.first_name.name],
      last_name: row[this.tableName]![this.last_name.name],
      birth_date: row[this.tableName]![this.birth_date.name],
      hire_date: row[this.tableName]![this.hire_date.name],
      reports_to: row[this.tableName]![this.reports_to.name],
      notes: row[this.tableName]![this.notes.name],
      address: row[this.tableName]![this.address.name],
      city: row[this.tableName]![this.city.name],
      country: row[this.tableName]![this.country.name],
      extension: row[this.tableName]![this.extension.name],
      home_phone: row[this.tableName]![this.home_phone.name],
      photo_path: row[this.tableName]![this.photo_path.name],
      postal_code: row[this.tableName]![this.postal_code.name],
      region: row[this.tableName]![this.region.name],
      title: row[this.tableName]![this.title.name],
      title_of_courtesy: row[this.tableName]![this.title_of_courtesy.name],
    );
  }

  String get insertIntoHeader => 'INSERT INTO employees(employee_id,first_name,last_name,birth_date,hire_date,reports_to,notes,address,city,country,extension,home_phone,photo_path,postal_code,region,title,title_of_courtesy) VALUES';
}
