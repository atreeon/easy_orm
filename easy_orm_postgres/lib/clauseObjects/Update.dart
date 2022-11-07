import 'package:easy_orm_postgres/ITableDefinition.dart';
import 'package:easy_orm_postgres/column.dart';

abstract class Update<TTable extends ITableDefinition> {}

class UpdateCustom<TTable extends ITableDefinition> implements Update<TTable> {
  final Map<Column, dynamic> columns;

  UpdateCustom(this.columns);
}
