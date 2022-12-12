import 'Table.dart';

///converts our list of Tables & Columns to our Map to be used in our templates
Map<String, Map<String, dynamic>> convertTablesToDbMap(
  List<Table> tables,
  String packageName,
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
                "packageName": packageName,
              })
          .toList(),
      "definitions": tables
          .map((e) => {
                "filename": e.definitionName,
                "directory": "definitions",
                "packageName": packageName,
              })
          .toList(),
    }
  };

  return result;
}
