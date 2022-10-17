import 'package:easy_orm_engine/ITableDefinition.dart';
import 'package:easy_orm_engine/SqlRequest.dart';

///'from' clause
SqlRequest getFrom(ITableDefinition tableDefinition) {
  return SqlRequest("from ${tableDefinition.tableName}", {});
}
