import 'package:basic_utils/basic_utils.dart';
import 'package:postgrest_cli/helpers/lookupDbType.dart';
import 'package:postgrest_cli/util/dePluralise.dart';

import 'Table.dart';

///converts our list of Tables & Columns to our Map to be used in our templates
Map<String, Map<String, dynamic>> tablesToTemplateMap(
  List<Table> tables,
  String packageName,
  String Function(Table) getFilename,
) {
  var result = {
    for (var table in tables) //
      getFilename(table): //
          {
        "packageName": packageName,
        "name": StringUtils.capitalize(table.name),
        "tableName": table.name,
        "columns": table.columns
            .map((column) => {
                  "dbType": column.dbType,
                  "dartType": lookupDbType(column.dbType, convertDbTypeToDartType),
                  "columnName": column.columnName,
                  "nullable": column.nullable.toString(),
                  "tableName": table.name,
                  "columnType": lookupDbType(column.dbType, convertDbTypeToColumnType),
                })
            .toList(),
        "modelName": dePluralise(StringUtils.capitalize(table.name)),
        "propertySetColumns": table.columns //
            .map((column) => {"columnName": column.columnName})
            .toList(),
        "columnNamesDelimited": table.columns //
            .map((column) => column.columnName)
            .join(","),
      }
  };

  return result;
}
