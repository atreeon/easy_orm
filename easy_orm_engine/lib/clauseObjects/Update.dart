import 'package:easy_orm_engine/ITableDefinition.dart';
import 'package:easy_orm_engine/column.dart';

abstract class Update<TTable extends ITableDefinition> {}

class UpdateCustom<TTable extends ITableDefinition> implements Update<TTable> {
  final Map<Column, dynamic> columns;

  UpdateCustom(this.columns);
}
