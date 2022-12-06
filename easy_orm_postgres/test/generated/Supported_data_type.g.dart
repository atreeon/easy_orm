// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Supported_data_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Supported_data_type _$$_Supported_data_typeFromJson(
        Map<String, dynamic> json) =>
    _$_Supported_data_type(
      int2_col: json['int2_col'] as int,
      serial2_col: json['serial2_col'] as int,
      serial4_col: json['serial4_col'] as int,
      serial8_col: json['serial8_col'] as int,
      bool_col: json['bool_col'] as bool?,
      char_col: json['char_col'] as String?,
      date_col: json['date_col'] == null
          ? null
          : DateTime.parse(json['date_col'] as String),
      float4_col: (json['float4_col'] as num?)?.toDouble(),
      float8_col: (json['float8_col'] as num?)?.toDouble(),
      int4_col: json['int4_col'] as int?,
      bigint_col: json['bigint_col'] as int?,
      int8_col: json['int8_col'] as int?,
      numeric_col: (json['numeric_col'] as num?)?.toDouble(),
      text_col: json['text_col'] as String?,
      varchar_col: json['varchar_col'] as String?,
    );

Map<String, dynamic> _$$_Supported_data_typeToJson(
        _$_Supported_data_type instance) =>
    <String, dynamic>{
      'int2_col': instance.int2_col,
      'serial2_col': instance.serial2_col,
      'serial4_col': instance.serial4_col,
      'serial8_col': instance.serial8_col,
      'bool_col': instance.bool_col,
      'char_col': instance.char_col,
      'date_col': instance.date_col?.toIso8601String(),
      'float4_col': instance.float4_col,
      'float8_col': instance.float8_col,
      'int4_col': instance.int4_col,
      'bigint_col': instance.bigint_col,
      'int8_col': instance.int8_col,
      'numeric_col': instance.numeric_col,
      'text_col': instance.text_col,
      'varchar_col': instance.varchar_col,
    };
