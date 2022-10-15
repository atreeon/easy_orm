import 'package:easy_orm_engine/column.dart';
import 'package:easy_orm_engine/ITableDefinition.dart';
import 'package:example/generatedDb/models/Shipper.dart';

class ShippersDefinition implements ITableDefinition {
  final String tableName = "shippers";

  ColumnNumeric<int> shipper_id = ColumnNumeric<int>(
    name: "shipper_id",
    nullable: false,
    datatype: "int2",
    getValue: (row) => row["shippers"]!["shipper_id"],
  );

  ColumnChar<String> company_name = ColumnChar<String>(
    name: "company_name",
    nullable: false,
    datatype: "varchar",
    getValue: (row) => row["shippers"]!["company_name"],
  );

  ColumnChar<String> phone = ColumnChar<String>(
    name: "phone",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["shippers"]!["phone"],
  );

  List<Column> get allColumns => [shipper_id, company_name, phone];

  Shipper getTypeFromRow(Map<String, Map<String, dynamic>> row) {
    return Shipper(
      shipper_id: row[this.tableName]![this.shipper_id.name],
      company_name: row[this.tableName]![this.company_name.name],
      phone: row[this.tableName]![this.phone.name],
    );
  }
}
