import 'package:easy_orm_cli/helpers/lookupDbType.dart';

import '../../util/linqH.dart';
import 'Column.dart';
import 'Table.dart';

///convert the db result to a list of Tables & Columns
List<Table> convertRawTablesToTables(
  List<Map<String, Map<String, dynamic>>> rawDbTables,
  Map<String, List<String>?>? excludeList,
) {
  var rawDbTables2 = rawDbTables.map((e) {
    return e[e.keys.first]!;
  }).toList();

  var tables = groupBy<Map<String, dynamic>, String>(
    rawDbTables2,
    by: (val) => val["table_name"],
  ).map((e) {
    var excludedColumns = excludeList?[e.key] ?? [];

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
          .where((c) =>
              getSupportedDataTypes().any((supported) => c.dbType == supported) && //
              !excludedColumns.any((excluded) => c.columnName == excluded))
          .toList(),
    );
  }).toList();

  var excludedTables = excludeList //
          ?.entries
          .where((element) => element.value == null)
          .map((e) => e.key)
          .toList() ??
      [];

  var result = tables.where((x) => !excludedTables.any((element) => element == x.tableName)).toList();

  return result;
}
