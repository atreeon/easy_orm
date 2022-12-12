// ignore_for_file: unused_import
import 'package:easy_orm_postgres/column.dart';
import 'package:easy_orm_postgres/ITableDefinition.dart';
import 'package:easy_orm_postgres/service/getTypeFromDbRow.dart';
import 'dart:typed_data';

import 'Supported_data_type.dart';

class Supported_data_typesDefinition
    implements ITableDefinition<Supported_data_type> {
  final String tableName = "supported_data_types";

  ColumnNumeric<int, Supported_data_type> int2_col =
      ColumnNumeric<int, Supported_data_type>(
    name: "int2_col",
    nullable: false,
    isIdentity: false,
    datatype: "int2",
    getDbValue: (row) => row["supported_data_types"]!["int2_col"],
    getModelValue: (model) => model.int2_col,
  );

  ColumnNumeric<int, Supported_data_type> serial2_col =
      ColumnNumeric<int, Supported_data_type>(
    name: "serial2_col",
    nullable: false,
    isIdentity: false,
    datatype: "int2",
    getDbValue: (row) => row["supported_data_types"]!["serial2_col"],
    getModelValue: (model) => model.serial2_col,
  );

  ColumnNumeric<int, Supported_data_type> serial4_col =
      ColumnNumeric<int, Supported_data_type>(
    name: "serial4_col",
    nullable: false,
    isIdentity: false,
    datatype: "int4",
    getDbValue: (row) => row["supported_data_types"]!["serial4_col"],
    getModelValue: (model) => model.serial4_col,
  );

  ColumnNumeric<int, Supported_data_type> serial8_col =
      ColumnNumeric<int, Supported_data_type>(
    name: "serial8_col",
    nullable: false,
    isIdentity: false,
    datatype: "int8",
    getDbValue: (row) => row["supported_data_types"]!["serial8_col"],
    getModelValue: (model) => model.serial8_col,
  );

  ColumnNullableBool<bool?, Supported_data_type> bool_col =
      ColumnNullableBool<bool?, Supported_data_type>(
    name: "bool_col",
    nullable: true,
    isIdentity: false,
    datatype: "bool",
    getDbValue: (row) => row["supported_data_types"]!["bool_col"],
    getModelValue: (model) => model.bool_col,
  );

  ColumnNullableChar<String?, Supported_data_type> char_col =
      ColumnNullableChar<String?, Supported_data_type>(
    name: "char_col",
    nullable: true,
    isIdentity: false,
    datatype: "bpchar",
    getDbValue: (row) => row["supported_data_types"]!["char_col"],
    getModelValue: (model) => model.char_col,
  );

  ColumnNullableDateTime<DateTime?, Supported_data_type> date_col =
      ColumnNullableDateTime<DateTime?, Supported_data_type>(
    name: "date_col",
    nullable: true,
    isIdentity: false,
    datatype: "date",
    getDbValue: (row) => row["supported_data_types"]!["date_col"],
    getModelValue: (model) => model.date_col,
  );

  ColumnNullableNumeric<double?, Supported_data_type> float4_col =
      ColumnNullableNumeric<double?, Supported_data_type>(
    name: "float4_col",
    nullable: true,
    isIdentity: false,
    datatype: "float4",
    getDbValue: (row) => row["supported_data_types"]!["float4_col"],
    getModelValue: (model) => model.float4_col,
  );

  ColumnNullableNumeric<double?, Supported_data_type> float8_col =
      ColumnNullableNumeric<double?, Supported_data_type>(
    name: "float8_col",
    nullable: true,
    isIdentity: false,
    datatype: "float8",
    getDbValue: (row) => row["supported_data_types"]!["float8_col"],
    getModelValue: (model) => model.float8_col,
  );

  ColumnNullableNumeric<int?, Supported_data_type> int4_col =
      ColumnNullableNumeric<int?, Supported_data_type>(
    name: "int4_col",
    nullable: true,
    isIdentity: false,
    datatype: "int4",
    getDbValue: (row) => row["supported_data_types"]!["int4_col"],
    getModelValue: (model) => model.int4_col,
  );

  ColumnNullableNumeric<int?, Supported_data_type> bigint_col =
      ColumnNullableNumeric<int?, Supported_data_type>(
    name: "bigint_col",
    nullable: true,
    isIdentity: false,
    datatype: "int8",
    getDbValue: (row) => row["supported_data_types"]!["bigint_col"],
    getModelValue: (model) => model.bigint_col,
  );

  ColumnNullableNumeric<int?, Supported_data_type> int8_col =
      ColumnNullableNumeric<int?, Supported_data_type>(
    name: "int8_col",
    nullable: true,
    isIdentity: false,
    datatype: "int8",
    getDbValue: (row) => row["supported_data_types"]!["int8_col"],
    getModelValue: (model) => model.int8_col,
  );

  ColumnNullableNumeric<double?, Supported_data_type> numeric_col =
      ColumnNullableNumeric<double?, Supported_data_type>(
    name: "numeric_col",
    nullable: true,
    isIdentity: false,
    datatype: "numeric",
    getDbValue: (row) => row["supported_data_types"]!["numeric_col"],
    getModelValue: (model) => model.numeric_col,
  );

  ColumnNullableChar<String?, Supported_data_type> text_col =
      ColumnNullableChar<String?, Supported_data_type>(
    name: "text_col",
    nullable: true,
    isIdentity: false,
    datatype: "text",
    getDbValue: (row) => row["supported_data_types"]!["text_col"],
    getModelValue: (model) => model.text_col,
  );

  ColumnNullableChar<String?, Supported_data_type> varchar_col =
      ColumnNullableChar<String?, Supported_data_type>(
    name: "varchar_col",
    nullable: true,
    isIdentity: false,
    datatype: "varchar",
    getDbValue: (row) => row["supported_data_types"]!["varchar_col"],
    getModelValue: (model) => model.varchar_col,
  );

  List<Column> get allColumns => [
        int2_col,
        serial2_col,
        serial4_col,
        serial8_col,
        bool_col,
        char_col,
        date_col,
        float4_col,
        float8_col,
        int4_col,
        bigint_col,
        int8_col,
        numeric_col,
        text_col,
        varchar_col
      ];

  Supported_data_type getTypeFromRow(Map<String, Map<String, dynamic>> row) {
    return Supported_data_type(
      int2_col: getTypeFromDbRow(this.tableName, this.int2_col, row),
      serial2_col: getTypeFromDbRow(this.tableName, this.serial2_col, row),
      serial4_col: getTypeFromDbRow(this.tableName, this.serial4_col, row),
      serial8_col: getTypeFromDbRow(this.tableName, this.serial8_col, row),
      bool_col: getTypeFromDbRow(this.tableName, this.bool_col, row),
      char_col: getTypeFromDbRow(this.tableName, this.char_col, row),
      date_col: getTypeFromDbRow(this.tableName, this.date_col, row),
      float4_col: getTypeFromDbRow(this.tableName, this.float4_col, row),
      float8_col: getTypeFromDbRow(this.tableName, this.float8_col, row),
      int4_col: getTypeFromDbRow(this.tableName, this.int4_col, row),
      bigint_col: getTypeFromDbRow(this.tableName, this.bigint_col, row),
      int8_col: getTypeFromDbRow(this.tableName, this.int8_col, row),
      numeric_col: getTypeFromDbRow(this.tableName, this.numeric_col, row),
      text_col: getTypeFromDbRow(this.tableName, this.text_col, row),
      varchar_col: getTypeFromDbRow(this.tableName, this.varchar_col, row),
    );
  }

  String get insertIntoHeader =>
      'INSERT INTO supported_data_types(int2_col,serial2_col,serial4_col,serial8_col,bool_col,char_col,date_col,float4_col,float8_col,int4_col,bigint_col,int8_col,numeric_col,text_col,varchar_col) VALUES';
}
