import 'package:easy_orm_engine/column.dart';
import 'package:easy_orm_engine/ITableDefinition.dart';
import 'package:example/generatedDb/models/Territorie.dart';

class TerritoriesDefinition implements ITableDefinition {
  final String tableName = "territories";

  ColumnChar<String> territory_description = ColumnChar<String>(
    name: "territory_description",
    nullable: false,
    datatype: "bpchar",
    getValue: (row) => row["territories"]!["territory_description"],
  );

  ColumnNumeric<int> region_id = ColumnNumeric<int>(
    name: "region_id",
    nullable: false,
    datatype: "int2",
    getValue: (row) => row["territories"]!["region_id"],
  );

  ColumnChar<String> territory_id = ColumnChar<String>(
    name: "territory_id",
    nullable: false,
    datatype: "varchar",
    getValue: (row) => row["territories"]!["territory_id"],
  );

  List<Column> get allColumns =>
      [territory_description, region_id, territory_id];

  Territorie getTypeFromRow(Map<String, Map<String, dynamic>> row) {
    return Territorie(
      territory_description:
          row[this.tableName]![this.territory_description.name],
      region_id: row[this.tableName]![this.region_id.name],
      territory_id: row[this.tableName]![this.territory_id.name],
    );
  }
}
