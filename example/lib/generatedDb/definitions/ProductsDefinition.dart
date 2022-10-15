import 'package:easy_orm_engine/column.dart';
import 'package:easy_orm_engine/ITableDefinition.dart';
import 'package:example/generatedDb/models/Product.dart';

class ProductsDefinition implements ITableDefinition {
  final String tableName = "products";

  ColumnNumeric<int> product_id = ColumnNumeric<int>(
    name: "product_id",
    nullable: false,
    datatype: "int2",
    getValue: (row) => row["products"]!["product_id"],
  );

  ColumnNumeric<int> discontinued = ColumnNumeric<int>(
    name: "discontinued",
    nullable: false,
    datatype: "int4",
    getValue: (row) => row["products"]!["discontinued"],
  );

  ColumnChar<String> product_name = ColumnChar<String>(
    name: "product_name",
    nullable: false,
    datatype: "varchar",
    getValue: (row) => row["products"]!["product_name"],
  );

  ColumnNumeric<double> unit_price = ColumnNumeric<double>(
    name: "unit_price",
    nullable: true,
    datatype: "float4",
    getValue: (row) => row["products"]!["unit_price"],
  );

  ColumnNumeric<int> category_id = ColumnNumeric<int>(
    name: "category_id",
    nullable: true,
    datatype: "int2",
    getValue: (row) => row["products"]!["category_id"],
  );

  ColumnNumeric<int> reorder_level = ColumnNumeric<int>(
    name: "reorder_level",
    nullable: true,
    datatype: "int2",
    getValue: (row) => row["products"]!["reorder_level"],
  );

  ColumnNumeric<int> supplier_id = ColumnNumeric<int>(
    name: "supplier_id",
    nullable: true,
    datatype: "int2",
    getValue: (row) => row["products"]!["supplier_id"],
  );

  ColumnNumeric<int> units_in_stock = ColumnNumeric<int>(
    name: "units_in_stock",
    nullable: true,
    datatype: "int2",
    getValue: (row) => row["products"]!["units_in_stock"],
  );

  ColumnNumeric<int> units_on_order = ColumnNumeric<int>(
    name: "units_on_order",
    nullable: true,
    datatype: "int2",
    getValue: (row) => row["products"]!["units_on_order"],
  );

  ColumnChar<String> quantity_per_unit = ColumnChar<String>(
    name: "quantity_per_unit",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["products"]!["quantity_per_unit"],
  );

  List<Column> get allColumns => [
        product_id,
        discontinued,
        product_name,
        unit_price,
        category_id,
        reorder_level,
        supplier_id,
        units_in_stock,
        units_on_order,
        quantity_per_unit
      ];

  Product getTypeFromRow(Map<String, Map<String, dynamic>> row) {
    return Product(
      product_id: row[this.tableName]![this.product_id.name],
      discontinued: row[this.tableName]![this.discontinued.name],
      product_name: row[this.tableName]![this.product_name.name],
      unit_price: row[this.tableName]![this.unit_price.name],
      category_id: row[this.tableName]![this.category_id.name],
      reorder_level: row[this.tableName]![this.reorder_level.name],
      supplier_id: row[this.tableName]![this.supplier_id.name],
      units_in_stock: row[this.tableName]![this.units_in_stock.name],
      units_on_order: row[this.tableName]![this.units_on_order.name],
      quantity_per_unit: row[this.tableName]![this.quantity_per_unit.name],
    );
  }
}
