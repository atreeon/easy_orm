import 'package:easy_orm_engine/column.dart';
import 'package:easy_orm_engine/ITableDefinition.dart';
import 'package:example/generatedDb/models/Customer_customer_demo.dart';

class Customer_customer_demoDefinition implements ITableDefinition {
  final String tableName = "customer_customer_demo";

  ColumnChar<String> customer_id = ColumnChar<String>(
    name: "customer_id",
    nullable: false,
    datatype: "bpchar",
    getValue: (row) => row["customer_customer_demo"]!["customer_id"],
  );

  ColumnChar<String> customer_type_id = ColumnChar<String>(
    name: "customer_type_id",
    nullable: false,
    datatype: "bpchar",
    getValue: (row) => row["customer_customer_demo"]!["customer_type_id"],
  );

  List<Column> get allColumns => [customer_id, customer_type_id];

  Customer_customer_demo getTypeFromRow(Map<String, Map<String, dynamic>> row) {
    return Customer_customer_demo(
      customer_id: row[this.tableName]![this.customer_id.name],
      customer_type_id: row[this.tableName]![this.customer_type_id.name],
    );
  }
}
