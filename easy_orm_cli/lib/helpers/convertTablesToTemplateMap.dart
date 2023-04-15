import 'package:easy_orm_cli/helpers/generator_options.dart';
import 'package:easy_orm_cli/helpers/lookupDbType.dart';

import 'Table.dart';

///converts our list of Tables & Columns to our Map to be used in our templates
Map<String, Map<String, dynamic>> convertTablesToTemplateMap(
  List<Table> tables,
  GeneratorOptions options,
  String Function(Table) getFilename,
) {
  var result = {
    for (var table in tables) //
      getFilename(table): //
          {
        "packageName": options.package,
        "definitionName": table.definitionName,
        "tableName": table.tableName,
        "columns": table.columns
            .map((column) => {
                  "dbType": column.dbType,
                  "dartType": lookupDbType(
                          column.dbType,
                          convertDbTypeToDartType
                            ..addAll(options
                                .sql_to_dart_type_conversion_overrides
                                .cast())) +
                      (column.nullable ? "?" : ""),
                  "columnName": column.columnName,
                  "nullable": column.nullable.toString(),
                  "tableName": table.tableName,
                  "columnType": (column.nullable ? "Nullable" : "") +
                      lookupDbType(
                          column.dbType,
                          convertDbTypeToColumnType
                            ..addAll(options
                                .sql_to_dart_type_conversion_overrides
                                .cast())),
                  "modelName": table.modelName,
                  "isIdentity": column.isIdentity.toString(),
                })
            .toList(),
        "modelName": table.modelName,
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
