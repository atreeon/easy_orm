import 'package:easy_orm_engine/column.dart';

abstract class ITableDefinition<TModel> {
  final String tableName;

  const ITableDefinition(this.tableName);

  ///receives a row from the db (a map) and then outputs the desired type
  TModel getTypeFromRow(Map<String, Map<String, dynamic>> row);

  List<dynamic> get allColumns;

  String get insertIntoHeader;
}

dynamic getValue(Map<String, Map<String, dynamic>> row, Column col, String tableName) {
  return row[tableName]![col.name];
}
