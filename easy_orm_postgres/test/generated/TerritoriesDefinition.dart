// ignore_for_file: unused_import
import 'dart:typed_data';

import 'package:easy_orm_postgres/ITableDefinition.dart';
import 'package:easy_orm_postgres/column.dart';

import 'Territorie.dart';

class TerritoriesDefinition implements ITableDefinition<Territorie> {
  final String tableName = "territories";

  ColumnChar<String, Territorie> territory_description = ColumnChar<String, Territorie>(
    name: "territory_description",
    nullable: false,
    isIdentity: false,
    datatype: "bpchar",
    getDbValue: (row) => row["territories"]!["territory_description"],
    getModelValue: (model) => model.territory_description,
  );

  ColumnNumeric<int, Territorie> region_id = ColumnNumeric<int, Territorie>(
    name: "region_id",
    nullable: false,
    isIdentity: false,
    datatype: "int2",
    getDbValue: (row) => row["territories"]!["region_id"],
    getModelValue: (model) => model.region_id,
  );

  ColumnChar<String, Territorie> territory_id = ColumnChar<String, Territorie>(
    name: "territory_id",
    nullable: false,
    isIdentity: false,
    datatype: "varchar",
    getDbValue: (row) => row["territories"]!["territory_id"],
    getModelValue: (model) => model.territory_id,
  );

  List<Column> get allColumns => [territory_description, region_id, territory_id];

  Territorie getTypeFromRow(Map<String, Map<String, dynamic>> row) {
    return Territorie(
      territory_description: row[this.tableName]![this.territory_description.name],
      region_id: row[this.tableName]![this.region_id.name],
      territory_id: row[this.tableName]![this.territory_id.name],
    );
  }

  String get insertIntoHeader => 'INSERT INTO territories(territory_description,region_id,territory_id) VALUES';
}
