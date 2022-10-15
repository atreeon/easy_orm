import 'package:easy_orm_engine/column.dart';
import 'package:easy_orm_engine/ITableDefinition.dart';
import 'package:example/generatedDb/models/Employee.dart';

class EmployeesDefinition implements ITableDefinition {
  final String tableName = "employees";

  ColumnNumeric<int> employee_id = ColumnNumeric<int>(
    name: "employee_id",
    nullable: false,
    datatype: "int2",
    getValue: (row) => row["employees"]!["employee_id"],
  );

  ColumnChar<String> first_name = ColumnChar<String>(
    name: "first_name",
    nullable: false,
    datatype: "varchar",
    getValue: (row) => row["employees"]!["first_name"],
  );

  ColumnChar<String> last_name = ColumnChar<String>(
    name: "last_name",
    nullable: false,
    datatype: "varchar",
    getValue: (row) => row["employees"]!["last_name"],
  );

  ColumnChar<String> photo = ColumnChar<String>(
    name: "photo",
    nullable: true,
    datatype: "bytea",
    getValue: (row) => row["employees"]!["photo"],
  );

  ColumnChar<String> birth_date = ColumnChar<String>(
    name: "birth_date",
    nullable: true,
    datatype: "date",
    getValue: (row) => row["employees"]!["birth_date"],
  );

  ColumnChar<String> hire_date = ColumnChar<String>(
    name: "hire_date",
    nullable: true,
    datatype: "date",
    getValue: (row) => row["employees"]!["hire_date"],
  );

  ColumnNumeric<int> reports_to = ColumnNumeric<int>(
    name: "reports_to",
    nullable: true,
    datatype: "int2",
    getValue: (row) => row["employees"]!["reports_to"],
  );

  ColumnChar<String> notes = ColumnChar<String>(
    name: "notes",
    nullable: true,
    datatype: "text",
    getValue: (row) => row["employees"]!["notes"],
  );

  ColumnChar<String> address = ColumnChar<String>(
    name: "address",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["employees"]!["address"],
  );

  ColumnChar<String> city = ColumnChar<String>(
    name: "city",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["employees"]!["city"],
  );

  ColumnChar<String> country = ColumnChar<String>(
    name: "country",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["employees"]!["country"],
  );

  ColumnChar<String> extension = ColumnChar<String>(
    name: "extension",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["employees"]!["extension"],
  );

  ColumnChar<String> home_phone = ColumnChar<String>(
    name: "home_phone",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["employees"]!["home_phone"],
  );

  ColumnChar<String> photo_path = ColumnChar<String>(
    name: "photo_path",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["employees"]!["photo_path"],
  );

  ColumnChar<String> postal_code = ColumnChar<String>(
    name: "postal_code",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["employees"]!["postal_code"],
  );

  ColumnChar<String> region = ColumnChar<String>(
    name: "region",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["employees"]!["region"],
  );

  ColumnChar<String> title = ColumnChar<String>(
    name: "title",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["employees"]!["title"],
  );

  ColumnChar<String> title_of_courtesy = ColumnChar<String>(
    name: "title_of_courtesy",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["employees"]!["title_of_courtesy"],
  );

  List<Column> get allColumns => [
        employee_id,
        first_name,
        last_name,
        photo,
        birth_date,
        hire_date,
        reports_to,
        notes,
        address,
        city,
        country,
        extension,
        home_phone,
        photo_path,
        postal_code,
        region,
        title,
        title_of_courtesy
      ];

  Employee getTypeFromRow(Map<String, Map<String, dynamic>> row) {
    return Employee(
      employee_id: row[this.tableName]![this.employee_id.name],
      first_name: row[this.tableName]![this.first_name.name],
      last_name: row[this.tableName]![this.last_name.name],
      photo: row[this.tableName]![this.photo.name],
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
}
