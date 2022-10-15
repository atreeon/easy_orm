import 'package:easy_orm_engine/column.dart';
import 'package:easy_orm_engine/ITableDefinition.dart';
import 'package:example/generatedDb/models/Region.dart';

class RegionDefinition implements ITableDefinition {
  final String tableName = "region";

  ColumnChar<String> region_description = ColumnChar<String>(
    name: "region_description",
    nullable: false,
    datatype: "bpchar",
    getValue: (row) => row["region"]!["region_description"],
  );

  ColumnNumeric<int> region_id = ColumnNumeric<int>(
    name: "region_id",
    nullable: false,
    datatype: "int2",
    getValue: (row) => row["region"]!["region_id"],
  );

  List<Column> get allColumns => [region_description, region_id];

  Region getTypeFromRow(Map<String, Map<String, dynamic>> row) {
    return Region(
      region_description: row[this.tableName]![this.region_description.name],
      region_id: row[this.tableName]![this.region_id.name],
    );
  }
}
