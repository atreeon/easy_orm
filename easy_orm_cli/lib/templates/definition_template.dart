var definition_template = """--inputs: className, tableName, columns as List<Column>, classOutputName
import 'package:easy_orm_engine/column.dart';
import 'package:easy_orm_engine/ITableDefinition.dart';
import 'package:%%%packageName%%%/generatedDb/models/%%%modelName%%%.dart';

class %%%name%%%Definition implements ITableDefinition {
  final String tableName = "%%%tableName%%%";

~~~columns|column_subTemplate~~~

  List<Column> get allColumns => [%%%columnNamesDelimited%%%];

  %%%modelName%%% getTypeFromRow(Map<String, Map<String, dynamic>> row) {
    return %%%modelName%%%(
~~~propertySetColumns|propertySet_subTemplate~~~
    );
  }
}
""";