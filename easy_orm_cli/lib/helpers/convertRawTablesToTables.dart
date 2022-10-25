import 'package:postgrest_cli/helpers/lookupDbType.dart';

import '../../util/linqH.dart';
import 'Column.dart';
import 'Table.dart';

///convert the db result to a list of Tables & Columns
List<Table> convertRawTablesToTables(List<Map<String, Map<String, dynamic>>> rawDbTables) {
  var rawDbTables2 = rawDbTables.map((e) {
    return e[e.keys.first]!;
  }).toList();

  var result = groupBy<Map<String, dynamic>, String>(
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
          .where((c) => !unsupportedColumnTypes.any((unsupportedType) => c.dbType == unsupportedType))
          .toList(),
    );
  }).toList();

  return result;
}
