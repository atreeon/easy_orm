import 'package:basic_utils/basic_utils.dart';
import 'package:easy_orm_cli/util/dePluralise.dart';

import 'Table.dart';

///converts our list of Tables & Columns to our Map to be used in our templates
Map<String, Map<String, dynamic>> convertTablesToDbMap(
  List<Table> tables,
  String packageName,
) {
  var result = {
    "db.dart": //
        {
      "tables": tables.map((e) => {
            "type": dePluralise(StringUtils.capitalize(e.name)),
            "definition": StringUtils.capitalize(e.name) + "Definition",
            "name": e.name,
          }).toList(),
      "modelNames": tables.map((e) => {
            "name": dePluralise(StringUtils.capitalize(e.name)),
            "directory": "models",
            "packageName": packageName,
          }).toList(),
      "definitionNames": tables.map((e) => {
            "name": StringUtils.capitalize(e.name) + "Definition",
            "directory": "models",
            "packageName": packageName,
          }).toList(),
    }
  };

  return result;
}
