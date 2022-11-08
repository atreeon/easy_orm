import 'package:easy_orm_postgres/ITableDefinition.dart';
import 'package:easy_orm_postgres/column.dart';

abstract class Select<TTable extends ITableDefinition> {}

// class SelectCustom<TTable, TModel> implements Select<TTable> {
//   final List<Column> columns;
//   final TModel Function(TTable, Map<String, Map<String, dynamic>>) blim;
//
//   SelectCustom(this.columns, this.blim);
// }

class SelectCustom2<TDef extends ITableDefinition> implements Select<TDef> {
  final List<Column> columns;

  SelectCustom2(this.columns);
}

class SelectDefault<TDef extends ITableDefinition> implements Select<TDef> {}
