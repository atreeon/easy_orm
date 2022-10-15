import 'package:easy_orm_engine/ITableDefinition.dart';
import 'package:easy_orm_engine/column.dart';

import '../freezedTest/EmployeeFreezed.dart';

class EmployeeDefinition implements ITableDefinition {
  final String tableName = "employees";

  ColumnNumeric<int> employee_id = ColumnNumeric<int>(
    name: "employee_id",
    nullable: false,
    datatype: "int",
    getValue: (row) => row["employees"]!["employee_id"],
  );

  ColumnChar<String> title_of_courtesy = ColumnChar<String>(
    name: "title_of_courtesy",
    nullable: true,
    datatype: "String",
    getValue: (row) => row["employees"]!["title_of_courtesy"],
  );

  List<Column> get allColumns => [employee_id, title_of_courtesy];

  EmployeeF getTypeFromRow(Map<String, Map<String, dynamic>> row) {
    return EmployeeF(
      employee_id: row[this.tableName]![this.employee_id.name],
      title_of_courtesy: row[this.tableName]![this.title_of_courtesy.name],
    );
  }
}
