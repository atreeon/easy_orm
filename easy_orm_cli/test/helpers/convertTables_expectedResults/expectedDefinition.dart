
var expectedDefinition = """// ignore_for_file: unused_import
import 'package:easy_orm_postgres/column.dart';
import 'package:easy_orm_postgres/ITableDefinition.dart';
import 'package:easy_orm_postgres/service/getTypeFromDbRow.dart';
import 'package:example/generatedDb/models/Us_state.dart';
import 'dart:typed_data';

class Us_statesDefinition implements ITableDefinition<Us_state> {
  final String tableName = "us_states";


  ColumnNumeric<int, Us_state> state_id = ColumnNumeric<int, Us_state>(
    name: "state_id",
    nullable: false,
    isIdentity: true,
    datatype: "int2",
    getDbValue: (row) => row["us_states"]!["state_id"],
    getModelValue: (model) => model.state_id,
  );

  ColumnNullableChar<String?, Us_state> state_abbr = ColumnNullableChar<String?, Us_state>(
    name: "state_abbr",
    nullable: true,
    isIdentity: false,
    datatype: "varchar",
    getDbValue: (row) => row["us_states"]!["state_abbr"],
    getModelValue: (model) => model.state_abbr,
  );

  ColumnNullableChar<String?, Us_state> state_name = ColumnNullableChar<String?, Us_state>(
    name: "state_name",
    nullable: true,
    isIdentity: false,
    datatype: "varchar",
    getDbValue: (row) => row["us_states"]!["state_name"],
    getModelValue: (model) => model.state_name,
  );

  ColumnNullableChar<String?, Us_state> state_region = ColumnNullableChar<String?, Us_state>(
    name: "state_region",
    nullable: true,
    isIdentity: false,
    datatype: "varchar",
    getDbValue: (row) => row["us_states"]!["state_region"],
    getModelValue: (model) => model.state_region,
  );


  List<Column> get allColumns => [state_id,state_abbr,state_name,state_region];

  Us_state getTypeFromRow(Map<String, Map<String, dynamic>> row) {
    return Us_state(
state_id: getTypeFromDbRow(this.tableName, this.state_id, row),
state_abbr: getTypeFromDbRow(this.tableName, this.state_abbr, row),
state_name: getTypeFromDbRow(this.tableName, this.state_name, row),
state_region: getTypeFromDbRow(this.tableName, this.state_region, row),

    );
  }
  
  String get insertIntoHeader => 'INSERT INTO us_states(state_id,state_abbr,state_name,state_region) VALUES';
}
""";
