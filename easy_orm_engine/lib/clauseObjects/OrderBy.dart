import 'package:easy_orm_engine/ITableDefinition.dart';
import 'package:easy_orm_engine/column.dart';

class OrderBy<TDef extends ITableDefinition> {
  final List<OrderByItem> columns;

  OrderBy(this.columns);
}

class OrderByItem<TTable> {
  final Column column;
  final bool isAscending;

  OrderByItem(this.column, {this.isAscending = true});
}
