import 'package:easy_orm_postgres/ITableDefinition.dart';
import 'package:easy_orm_postgres/SqlRequest.dart';
import 'package:easy_orm_postgres/column.dart';

SqlRequest getSelect<TDef extends ITableDefinition>(
  TDef tableDefinition, [
  Column Function(TDef e)? col1,
  Column Function(TDef e)? col2,
  Column Function(TDef e)? col3,
  Column Function(TDef e)? col4,
]) {
  if (col1 == null) //
    return SqlRequest("select * ", {});

  var columnListSql = [
    col1.call((tableDefinition)).name,
    col2?.call((tableDefinition)).name,
    col3?.call((tableDefinition)).name,
    col4?.call((tableDefinition)).name,
  ].where((x) => x != null).join(", ");

  return SqlRequest("select $columnListSql", {});
}
