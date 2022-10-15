
import 'package:easy_orm_engine/clauseObjects/Where.dart';

///Abstract definition for each column
abstract class Column<TType> {
  final String name;
  final bool nullable;
  final String datatype;
  final TType Function(Map<String, Map<String, dynamic>> row) getValue;
  // final TType Function(Map<String, Map<String, dynamic>>) blah;

  Column({
    required this.name,
    required this.nullable,
    required this.datatype,
    required this.getValue,
  });
}

class ColumnNumeric<TType extends num> extends Column<TType> {
  ColumnNumeric({
    required super.name,
    required super.nullable,
    required super.datatype,
    required super.getValue,
  });

  FilterOneValue<TType> eq(TType t) => FilterOneValue<TType>(t, this, " = ");
  FilterOneValue<TType> gt(TType t) => FilterOneValue<TType>(t, this, " > ");
  FilterOneValue<TType> lt(TType t) => FilterOneValue<TType>(t, this, " < ");
  FilterOneValue<TType> gte(TType t) => FilterOneValue<TType>(t, this, " >= ");
}

class ColumnChar<TType extends String> extends Column<TType> {
  ColumnChar({
    required super.name,
    required super.nullable,
    required super.datatype,
    required super.getValue,
  });

  FilterOneValue<TType> like(TType t) => FilterOneValue<TType>(t, this, " like ");
}

class ColumnBool<TType extends bool> extends Column<TType> {
  ColumnBool({
    required super.name,
    required super.nullable,
    required super.datatype,
    required super.getValue,
  });

  FilterOneValue<TType> is_(TType t) => FilterOneValue<TType>(t, this, " is ");
}
