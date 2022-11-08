import 'package:easy_orm_postgres/ITableDefinition.dart';
import 'package:easy_orm_postgres/SqlRequest.dart';

///'from' clause
SqlRequest getFrom(ITableDefinition tableDefinition) {
  return SqlRequest("from ${tableDefinition.tableName}", {});
}
