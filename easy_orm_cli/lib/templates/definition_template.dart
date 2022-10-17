var definition_template = """--inputs: className, tableName, columns as List<Column>, classOutputName
// ignore_for_file: unused_import
import 'package:easy_orm_engine/column.dart';
import 'package:easy_orm_engine/ITableDefinition.dart';
import 'package:%%%packageName%%%/generatedDb/models/%%%modelName%%%.dart';
import 'dart:typed_data';

class %%%name%%%Definition implements ITableDefinition<%%%modelName%%%> {
  final String tableName = "%%%tableName%%%";

~~~columns|column_subTemplate~~~

  List<Column> get allColumns => [%%%columnNamesDelimited%%%];

  %%%modelName%%% getTypeFromRow(Map<String, Map<String, dynamic>> row) {
    return %%%modelName%%%(
~~~propertySetColumns|propertySet_subTemplate~~~
    );
  }
  
  String get insertIntoHeader => 'INSERT INTO %%%tableName%%%(%%%columnNamesDelimited%%%) VALUES';
}
""";