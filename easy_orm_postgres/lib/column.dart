import 'dart:typed_data';

import 'package:easy_orm_postgres/clauseObjects/Where.dart';

///Abstract definition for each column
abstract class Column<TType, TModel> {
  final String name;
  final bool nullable;
  final bool isIdentity;
  final String datatype;
  final TType Function(Map<String, Map<String, dynamic>> row) getDbValue;
  final TType Function(TModel model) getModelValue;
  // final TType Function(Map<String, Map<String, dynamic>>) blah;

  Column({
    required this.name,
    required this.nullable,
    required this.isIdentity,
    required this.datatype,
    required this.getDbValue,
    required this.getModelValue,
  });
}

class ColumnNumeric<TType extends num, TModel> extends Column<TType, TModel> {
  ColumnNumeric({
    required super.name,
    required super.nullable,
    required super.isIdentity,
    required super.datatype,
    required super.getDbValue,
    required super.getModelValue,
  });

  FilterOneValue<TType> eq(TType t) => FilterOneValue<TType>(t, this, " = ");
  FilterOneValue<TType> gt(TType t) => FilterOneValue<TType>(t, this, " > ");
  FilterOneValue<TType> lt(TType t) => FilterOneValue<TType>(t, this, " < ");
  FilterOneValue<TType> gte(TType t) => FilterOneValue<TType>(t, this, " >= ");
}

class ColumnNullableNumeric<TType extends num?, TModel> extends Column<TType, TModel> {
  ColumnNullableNumeric({
    required super.name,
    required super.nullable,
    required super.isIdentity,
    required super.datatype,
    required super.getDbValue,
    required super.getModelValue,
  });

  FilterOneValue<TType> eq(TType t) => FilterOneValue<TType>(t, this, " = ");
  FilterOneValue<TType> gt(TType t) => FilterOneValue<TType>(t, this, " > ");
  FilterOneValue<TType> lt(TType t) => FilterOneValue<TType>(t, this, " < ");
  FilterOneValue<TType> gte(TType t) => FilterOneValue<TType>(t, this, " >= ");
}

class ColumnChar<TType extends String, TModel> extends Column<TType, TModel> {
  ColumnChar({
    required super.name,
    required super.nullable,
    required super.isIdentity,
    required super.datatype,
    required super.getDbValue,
    required super.getModelValue,
  });

  FilterOneValue<TType> like(TType t) => FilterOneValue<TType>(t, this, " like ");
}

class ColumnNullableChar<TType extends String?, TModel> extends Column<TType, TModel> {
  ColumnNullableChar({
    required super.name,
    required super.nullable,
    required super.isIdentity,
    required super.datatype,
    required super.getDbValue,
    required super.getModelValue,
  });

  FilterOneValue<TType> like(TType t) => FilterOneValue<TType>(t, this, " like ");
}

class ColumnBool<TType extends bool, TModel> extends Column<TType, TModel> {
  ColumnBool({
    required super.name,
    required super.nullable,
    required super.isIdentity,
    required super.datatype,
    required super.getDbValue,
    required super.getModelValue,
  });

  FilterOneValue<TType> is_(TType t) => FilterOneValue<TType>(t, this, " is ");
}

class ColumnNullableBool<TType extends bool?, TModel> extends Column<TType, TModel> {
  ColumnNullableBool({
    required super.name,
    required super.nullable,
    required super.isIdentity,
    required super.datatype,
    required super.getDbValue,
    required super.getModelValue,
  });

  FilterOneValue<TType> is_(TType t) => FilterOneValue<TType>(t, this, " is ");
}

class ColumnDateTime<TType extends DateTime, TModel> extends Column<TType, TModel> {
  ColumnDateTime({
    required super.name,
    required super.nullable,
    required super.isIdentity,
    required super.datatype,
    required super.getDbValue,
    required super.getModelValue,
  });

  // FilterOneValue<TType> is_(TType t) => FilterOneValue<TType>(t, this, " is ");
}

class ColumnNullableDateTime<TType extends DateTime?, TModel> extends Column<TType, TModel> {
  ColumnNullableDateTime({
    required super.name,
    required super.nullable,
    required super.isIdentity,
    required super.datatype,
    required super.getDbValue,
    required super.getModelValue,
  });

  // FilterOneValue<TType> is_(TType t) => FilterOneValue<TType>(t, this, " is ");
}

class ColumnUint8List<TType extends Uint8List, TModel> extends Column<TType, TModel> {
  ColumnUint8List({
    required super.name,
    required super.nullable,
    required super.isIdentity,
    required super.datatype,
    required super.getDbValue,
    required super.getModelValue,
  });

  // FilterOneValue<TType> is_(TType t) => FilterOneValue<TType>(t, this, " is ");
}
