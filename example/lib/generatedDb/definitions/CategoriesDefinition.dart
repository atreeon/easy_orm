import 'package:easy_orm_engine/column.dart';
import 'package:easy_orm_engine/ITableDefinition.dart';
import 'package:example/generatedDb/models/Categorie.dart';

class CategoriesDefinition implements ITableDefinition {
  final String tableName = "categories";

  ColumnNumeric<int> category_id = ColumnNumeric<int>(
    name: "category_id",
    nullable: false,
    datatype: "int2",
    getValue: (row) => row["categories"]!["category_id"],
  );

  ColumnChar<String> category_name = ColumnChar<String>(
    name: "category_name",
    nullable: false,
    datatype: "varchar",
    getValue: (row) => row["categories"]!["category_name"],
  );

  ColumnChar<String> picture = ColumnChar<String>(
    name: "picture",
    nullable: true,
    datatype: "bytea",
    getValue: (row) => row["categories"]!["picture"],
  );

  ColumnChar<String> description = ColumnChar<String>(
    name: "description",
    nullable: true,
    datatype: "text",
    getValue: (row) => row["categories"]!["description"],
  );

  List<Column> get allColumns =>
      [category_id, category_name, picture, description];

  Categorie getTypeFromRow(Map<String, Map<String, dynamic>> row) {
    return Categorie(
      category_id: row[this.tableName]![this.category_id.name],
      category_name: row[this.tableName]![this.category_name.name],
      picture: row[this.tableName]![this.picture.name],
      description: row[this.tableName]![this.description.name],
    );
  }
}
