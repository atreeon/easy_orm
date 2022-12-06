import 'package:easy_orm_cli/helpers/Table.dart';
import 'package:easy_orm_cli/helpers/lookupDbType.dart';

List<Table> excludeUnsupported(List<Table> tables) {
  var filteredTables = tables.map((table) {
    return Table(
        table.tableName, //
        table.columns.where((c) {
          var result = getSupportedDataTypes().contains(c.dbType);
          return result;
        }).toList());
  }).toList();

  return filteredTables;
}
