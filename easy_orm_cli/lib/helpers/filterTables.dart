import 'dart:io';

import 'package:easy_orm_cli/helpers/Table.dart';
import 'package:easy_orm_cli/helpers/excludeColumns.dart';
import 'package:easy_orm_cli/helpers/excludeTables.dart';
import 'package:easy_orm_cli/helpers/excludeUnsupportedColumns.dart';
import 'package:easy_orm_cli/helpers/processExcludeListYaml.dart';

Future<List<Table>> filterTables(List<Table> tables) async {
  Map<String, List<String>?>? excludeList = null;
  if (await File('config/excludeList.yaml').exists()) {
    var excludeListString = await File('config/excludeList.yaml').readAsString();
    excludeList = processExcludeListYaml(excludeListString);
  }

  var result1 = excludeTables(tables, excludeList);
  var result2 = excludeColumns(result1, excludeList);
  var result3 = excludeUnsupported(result2);

  return result3;
}
