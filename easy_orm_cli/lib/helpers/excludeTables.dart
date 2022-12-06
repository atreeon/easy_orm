import 'package:easy_orm_cli/helpers/Table.dart';

List<Table> excludeTables(
  List<Table> tables,
  Map<String, List<String>?>? excludeList,
) {
  if (excludeList == null) //
    return tables;

  var excludedTables = excludeList //
      .entries
      .where((element) => element.value == null)
      .map((e) => e.key)
      .toList();

  var result = tables.where((x) => !excludedTables.any((element) => element == x.tableName)).toList();

  return result;
}
