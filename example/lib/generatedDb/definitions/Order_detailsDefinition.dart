import 'package:easy_orm_engine/column.dart';
import 'package:easy_orm_engine/ITableDefinition.dart';
import 'package:example/generatedDb/models/Order_detail.dart';

class Order_detailsDefinition implements ITableDefinition {
  final String tableName = "order_details";

  ColumnNumeric<double> discount = ColumnNumeric<double>(
    name: "discount",
    nullable: false,
    datatype: "float4",
    getValue: (row) => row["order_details"]!["discount"],
  );

  ColumnNumeric<double> unit_price = ColumnNumeric<double>(
    name: "unit_price",
    nullable: false,
    datatype: "float4",
    getValue: (row) => row["order_details"]!["unit_price"],
  );

  ColumnNumeric<int> order_id = ColumnNumeric<int>(
    name: "order_id",
    nullable: false,
    datatype: "int2",
    getValue: (row) => row["order_details"]!["order_id"],
  );

  ColumnNumeric<int> product_id = ColumnNumeric<int>(
    name: "product_id",
    nullable: false,
    datatype: "int2",
    getValue: (row) => row["order_details"]!["product_id"],
  );

  ColumnNumeric<int> quantity = ColumnNumeric<int>(
    name: "quantity",
    nullable: false,
    datatype: "int2",
    getValue: (row) => row["order_details"]!["quantity"],
  );

  List<Column> get allColumns =>
      [discount, unit_price, order_id, product_id, quantity];

  Order_detail getTypeFromRow(Map<String, Map<String, dynamic>> row) {
    return Order_detail(
      discount: row[this.tableName]![this.discount.name],
      unit_price: row[this.tableName]![this.unit_price.name],
      order_id: row[this.tableName]![this.order_id.name],
      product_id: row[this.tableName]![this.product_id.name],
      quantity: row[this.tableName]![this.quantity.name],
    );
  }
}
