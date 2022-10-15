import 'Column.dart';

class Table {
  final String name;
  final List<Column> columns;

  Table(this.name, this.columns);

  String toString() => name + "|" + columns.toString();
}