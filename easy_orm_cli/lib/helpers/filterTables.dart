import 'package:easy_orm_cli/helpers/Table.dart';
import 'package:easy_orm_cli/helpers/excludeColumns.dart';
import 'package:easy_orm_cli/helpers/excludeTables.dart';
import 'package:easy_orm_cli/helpers/excludeUnsupportedColumns.dart';
import 'package:easy_orm_cli/helpers/generator_options.dart';

List<Table> filterTables(List<Table> tables, GeneratorOptions options) {
  var result1 = excludeTables(tables, options.exclude);
  var result2 = excludeColumns(result1, options.exclude);
  var result3 = excludeUnsupported(result2);

  return result3;
}
