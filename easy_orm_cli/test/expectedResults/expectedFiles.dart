var expectedService = """import 'package:example/generatedDb/definitions/Us_statesDefinition.dart';
import 'package:example/generatedDb/models/Us_state.dart';
import 'package:easy_orm_engine/service/IService.dart';
import 'package:postgres/postgres.dart';

class Us_statesService extends IService<Us_statesDefinition, Us_state> {
  final Us_statesDefinition tableDefinition = Us_statesDefinition();
  final PostgreSQLExecutionContext connection;

  Us_statesService(PostgreSQLExecutionContext this.connection);
}
""";

var expectedDefinition = """// ignore_for_file: unused_import
import 'package:easy_orm_engine/column.dart';
import 'package:easy_orm_engine/ITableDefinition.dart';
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
state_id: row[this.tableName]![this.state_id.name],
state_abbr: row[this.tableName]![this.state_abbr.name],
state_name: row[this.tableName]![this.state_name.name],
state_region: row[this.tableName]![this.state_region.name],

    );
  }
  
  String get insertIntoHeader => 'INSERT INTO us_states(state_id,state_abbr,state_name,state_region) VALUES';
}
""";
