class Column {
  final String dbType;
  final String columnName;
  final bool nullable;

  Column({
    required this.dbType,
    required this.columnName,
    required this.nullable,
  });

  String toString() => "$dbType, $columnName, $nullable";
}
