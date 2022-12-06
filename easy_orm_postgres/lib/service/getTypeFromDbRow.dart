import 'package:easy_orm_postgres/column.dart';

TType getTypeFromDbRow<TType, TModel>(
  String tableName,
  Column<TType, TModel> column,
  Map<String, Map<String, dynamic>> row,
) {
  dynamic result = row[tableName]![column.name];

  if (column.datatype == 'numeric' && column.nullable == true) {
    return double.tryParse(result) as TType;
  } else if (column.datatype == 'numeric' && column.nullable == false) {
    return double.parse(result) as TType;
  } else {
    return result as TType;
  }
}
