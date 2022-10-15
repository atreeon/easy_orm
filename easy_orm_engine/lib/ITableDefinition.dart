import 'package:easy_orm_engine/column.dart';

abstract class ITableDefinition<TType> {
  final String tableName;

  const ITableDefinition(this.tableName);

  ///receives a row from the db (a map) and then outputs the desired type
  TType getTypeFromRow(Map<String, Map<String, dynamic>> row);
}

dynamic getValue(Map<String, Map<String, dynamic>> row, Column col, String tableName) {
  return row[tableName]![col.name];
}
