import 'package:dartx/dartx.dart';
import 'package:easy_orm_cli/helpers/Table.dart';

List<Table> excludeColumns(
  List<Table> tables,
  Map<String, List<String>?>? excludeList,
) {
  if (excludeList == null) //
    return tables;

  var excludeList2 = excludeList //
      .filter((entry) => entry.value != null)
      .map((key, value) => MapEntry(key, value as List<String>));

  var filteredTables = tables.map((table) {
    if (excludeList2.any((key, value) => key == table.tableName)) {
      var excludedColumns = excludeList2[table.tableName]!;
      return Table(
        table.tableName,
        table.columns.where((c) => !excludedColumns.any((excluded) => excluded == c.columnName)).toList(),
      );
    } else {
      return table;
    }
  }).toList();

  return filteredTables;
}
