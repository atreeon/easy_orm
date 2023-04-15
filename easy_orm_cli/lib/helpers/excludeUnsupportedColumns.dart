import 'package:colorize/colorize.dart';
import 'package:easy_orm_cli/helpers/Column.dart';
import 'package:easy_orm_cli/helpers/Table.dart';
import 'package:easy_orm_cli/helpers/lookupDbType.dart';
import 'package:easy_orm_cli/util/logger.dart';

List<Table> excludeUnsupported(List<Table> tables) {
  final supportedDataTypes = getSupportedDataTypes();
  final unsupported = <Table, List<Column>>{};

  var filteredTables = tables.map((table) {
    final unsupportedColumns = <Column>[];
    final supportedColumns = <Column>[];
    table.columns.forEach((c) {
      if (supportedDataTypes.contains(c.dbType)) {
        supportedColumns.add(c);
      } else {
        unsupportedColumns.add(c);
      }
    });
    if (unsupportedColumns.isNotEmpty) {
      unsupported[table] = unsupportedColumns;
    }

    return Table(
      table.tableName, //
      supportedColumns,
    );
  }).toList();

  if (unsupported.isNotEmpty) {
    final s = StringBuffer();
    s.writeln("The following columns are not supported "
        "and will be excluded from the generated code:");
    for (final entry in unsupported.entries) {
      s.writeln("    ${Colorize(entry.key.tableName)..bold()}:");
      for (var column in entry.value) {
        s.writeln(
            "      * ${column.columnName} (${Colorize(column.dbType)..dark()})");
      }
    }
    Logger.warning(s.toString());
  }

  return filteredTables;
}
