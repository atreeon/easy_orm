import 'package:easy_orm_engine/column.dart';
import 'package:easy_orm_engine/ITableDefinition.dart';
import 'package:example/generatedDb/models/Order.dart';

class OrdersDefinition implements ITableDefinition {
  final String tableName = "orders";

  ColumnNumeric<int> order_id = ColumnNumeric<int>(
    name: "order_id",
    nullable: false,
    datatype: "int2",
    getValue: (row) => row["orders"]!["order_id"],
  );

  ColumnChar<String> customer_id = ColumnChar<String>(
    name: "customer_id",
    nullable: true,
    datatype: "bpchar",
    getValue: (row) => row["orders"]!["customer_id"],
  );

  ColumnChar<String> order_date = ColumnChar<String>(
    name: "order_date",
    nullable: true,
    datatype: "date",
    getValue: (row) => row["orders"]!["order_date"],
  );

  ColumnChar<String> required_date = ColumnChar<String>(
    name: "required_date",
    nullable: true,
    datatype: "date",
    getValue: (row) => row["orders"]!["required_date"],
  );

  ColumnChar<String> shipped_date = ColumnChar<String>(
    name: "shipped_date",
    nullable: true,
    datatype: "date",
    getValue: (row) => row["orders"]!["shipped_date"],
  );

  ColumnNumeric<double> freight = ColumnNumeric<double>(
    name: "freight",
    nullable: true,
    datatype: "float4",
    getValue: (row) => row["orders"]!["freight"],
  );

  ColumnNumeric<int> employee_id = ColumnNumeric<int>(
    name: "employee_id",
    nullable: true,
    datatype: "int2",
    getValue: (row) => row["orders"]!["employee_id"],
  );

  ColumnNumeric<int> ship_via = ColumnNumeric<int>(
    name: "ship_via",
    nullable: true,
    datatype: "int2",
    getValue: (row) => row["orders"]!["ship_via"],
  );

  ColumnChar<String> ship_address = ColumnChar<String>(
    name: "ship_address",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["orders"]!["ship_address"],
  );

  ColumnChar<String> ship_city = ColumnChar<String>(
    name: "ship_city",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["orders"]!["ship_city"],
  );

  ColumnChar<String> ship_country = ColumnChar<String>(
    name: "ship_country",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["orders"]!["ship_country"],
  );

  ColumnChar<String> ship_name = ColumnChar<String>(
    name: "ship_name",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["orders"]!["ship_name"],
  );

  ColumnChar<String> ship_postal_code = ColumnChar<String>(
    name: "ship_postal_code",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["orders"]!["ship_postal_code"],
  );

  ColumnChar<String> ship_region = ColumnChar<String>(
    name: "ship_region",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["orders"]!["ship_region"],
  );

  List<Column> get allColumns => [
        order_id,
        customer_id,
        order_date,
        required_date,
        shipped_date,
        freight,
        employee_id,
        ship_via,
        ship_address,
        ship_city,
        ship_country,
        ship_name,
        ship_postal_code,
        ship_region
      ];

  Order getTypeFromRow(Map<String, Map<String, dynamic>> row) {
    return Order(
      order_id: row[this.tableName]![this.order_id.name],
      customer_id: row[this.tableName]![this.customer_id.name],
      order_date: row[this.tableName]![this.order_date.name],
      required_date: row[this.tableName]![this.required_date.name],
      shipped_date: row[this.tableName]![this.shipped_date.name],
      freight: row[this.tableName]![this.freight.name],
      employee_id: row[this.tableName]![this.employee_id.name],
      ship_via: row[this.tableName]![this.ship_via.name],
      ship_address: row[this.tableName]![this.ship_address.name],
      ship_city: row[this.tableName]![this.ship_city.name],
      ship_country: row[this.tableName]![this.ship_country.name],
      ship_name: row[this.tableName]![this.ship_name.name],
      ship_postal_code: row[this.tableName]![this.ship_postal_code.name],
      ship_region: row[this.tableName]![this.ship_region.name],
    );
  }
}
