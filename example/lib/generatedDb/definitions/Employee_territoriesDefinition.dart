import 'package:easy_orm_engine/column.dart';
import 'package:easy_orm_engine/ITableDefinition.dart';
import 'package:example/generatedDb/models/Employee_territorie.dart';

class Employee_territoriesDefinition implements ITableDefinition {
  final String tableName = "employee_territories";

  ColumnNumeric<int> employee_id = ColumnNumeric<int>(
    name: "employee_id",
    nullable: false,
    datatype: "int2",
    getValue: (row) => row["employee_territories"]!["employee_id"],
  );

  ColumnChar<String> territory_id = ColumnChar<String>(
    name: "territory_id",
    nullable: false,
    datatype: "varchar",
    getValue: (row) => row["employee_territories"]!["territory_id"],
  );

  List<Column> get allColumns => [employee_id, territory_id];

  Employee_territorie getTypeFromRow(Map<String, Map<String, dynamic>> row) {
    return Employee_territorie(
      employee_id: row[this.tableName]![this.employee_id.name],
      territory_id: row[this.tableName]![this.territory_id.name],
    );
  }
}
