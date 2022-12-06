import 'package:easy_orm_cli/helpers/Column.dart';
import 'package:easy_orm_cli/helpers/Table.dart';
import 'package:easy_orm_cli/util/linqH.dart';

///convert the db result to a list of Tables & Columns
List<Table> convertRawTablesToTables(
  List<Map<String, Map<String, dynamic>>> rawDbTables,
) {
  var rawDbTables2 = rawDbTables.map((e) {
    return e[e.keys.first]!;
  }).toList();

  var tables = groupBy<Map<String, dynamic>, String>(
    rawDbTables2,
    by: (val) => val["table_name"],
  ).map((e) {
    return Table(
      e.key,
      e.values
          .map(
            (x) => Column(
              dbType: x["udt_name"],
              columnName: x["column_name"],
              nullable: x["is_nullable"] == "YES" ? true : false,
              isIdentity: x["is_identity"] == "YES" ? true : false,
            ),
          )
          .toList(),
    );
  }).toList();

  return tables;
}
