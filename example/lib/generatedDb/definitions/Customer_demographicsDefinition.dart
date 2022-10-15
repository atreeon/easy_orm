import 'package:easy_orm_engine/column.dart';
import 'package:easy_orm_engine/ITableDefinition.dart';
import 'package:example/generatedDb/models/Customer_demographic.dart';

class Customer_demographicsDefinition implements ITableDefinition {
  final String tableName = "customer_demographics";

  ColumnChar<String> customer_type_id = ColumnChar<String>(
    name: "customer_type_id",
    nullable: false,
    datatype: "bpchar",
    getValue: (row) => row["customer_demographics"]!["customer_type_id"],
  );

  ColumnChar<String> customer_desc = ColumnChar<String>(
    name: "customer_desc",
    nullable: true,
    datatype: "text",
    getValue: (row) => row["customer_demographics"]!["customer_desc"],
  );

  List<Column> get allColumns => [customer_type_id, customer_desc];

  Customer_demographic getTypeFromRow(Map<String, Map<String, dynamic>> row) {
    return Customer_demographic(
      customer_type_id: row[this.tableName]![this.customer_type_id.name],
      customer_desc: row[this.tableName]![this.customer_desc.name],
    );
  }
}
