import 'package:basic_utils/basic_utils.dart';
import 'package:easy_orm_cli/util/dePluralise.dart';

import 'Column.dart';

class Table {
  final String _name;
  final List<Column> columns;

  Table(String name, this.columns) : this._name = name;

  String toString() => _name + "|" + columns.toString();

  String get modelName => dePluralise(StringUtils.capitalize(this._name));

  String get modelFileName => modelName + ".dart";

  String get definitionName => StringUtils.capitalize(this._name) + "Definition";

  String get definitionFileName => definitionName + ".dart";

  String get variableName => this._name.toLowerCase();

  String get tableName => this._name;
}
