import 'package:easy_orm_cli/helpers/generator_options.dart';

import 'Table.dart';

///converts our list of Tables & Columns to our Map to be used in our templates
Map<String, Map<String, dynamic>> convertTablesToDbMap(
  List<Table> tables,
  GeneratorOptions options,
) {
  var result = {
    "Db.dart": //
        {
      "tables": tables
          .map((e) => {
                "modelName": e.modelName,
                "definitionName": e.definitionName,
                "variableName": e.variableName,
              })
          .toList(),
      "models": tables
          .map((e) => {
                "filename": e.modelName,
                "directory": "models",
                "packageName": options.package,
              })
          .toList(),
      "definitions": tables
          .map((e) => {
                "filename": e.definitionName,
                "directory": "definitions",
                "packageName": options.package,
              })
          .toList(),
    }
  };

  return result;
}
