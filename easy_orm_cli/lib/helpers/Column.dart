class Column {
  final String dbType;
  final String columnName;
  final bool nullable;
  final bool isIdentity;

  Column({
    required this.dbType,
    required this.columnName,
    required this.nullable,
    required this.isIdentity,
  });

  String toString() => "$dbType, $columnName, $nullable, $isIdentity";
}
