var expectedService = """import 'package:example/generatedDb/definitions/Us_statesDefinition.dart';
import 'package:example/generatedDb/models/Us_state.dart';
import 'package:easy_orm_engine/IService.dart';
import 'package:easy_orm_engine/clauseObjects/OrderBy.dart';
import 'package:easy_orm_engine/clauseObjects/Select.dart';
import 'package:easy_orm_engine/clauseObjects/Where.dart';

class Us_statesService extends IService<Us_statesDefinition, Us_state> {
  final Us_statesDefinition tableDefinition = Us_statesDefinition();
  final Where Function(Us_statesDefinition e)? where;
  final Select<Us_statesDefinition> Function(Us_statesDefinition e)? select;
  final OrderBy Function(Us_statesDefinition e)? orderBy;

  Us_statesService({this.where, this.select, this.orderBy});
}
""";

var expectedDefinition = """import 'package:easy_orm_engine/column.dart';
import 'package:easy_orm_engine/ITableDefinition.dart';
import 'package:example/generatedDb/models/Us_state.dart';

class Us_statesDefinition implements ITableDefinition {
  final String tableName = "us_states";


  ColumnNumeric<int> state_id = ColumnNumeric<int>(
    name: "state_id",
    nullable: false,
    datatype: "int2",
    getValue: (row) => row["us_states"]!["state_id"],
  );

  ColumnChar<String> state_abbr = ColumnChar<String>(
    name: "state_abbr",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["us_states"]!["state_abbr"],
  );

  ColumnChar<String> state_name = ColumnChar<String>(
    name: "state_name",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["us_states"]!["state_name"],
  );

  ColumnChar<String> state_region = ColumnChar<String>(
    name: "state_region",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["us_states"]!["state_region"],
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
}
""";
