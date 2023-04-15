// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generator_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GeneratorOptions _$$_GeneratorOptionsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_GeneratorOptions',
      json,
      ($checkedConvert) {
        final val = _$_GeneratorOptions(
          host: $checkedConvert('host', (v) => v as String),
          port: $checkedConvert('port', (v) => v as int),
          db: $checkedConvert('db', (v) => v as String),
          username: $checkedConvert('username', (v) => v as String),
          password: $checkedConvert('password', (v) => v as String),
          schema: $checkedConvert('schema', (v) => v as String? ?? "public"),
          package: $checkedConvert('package', (v) => v as String),
          build_runner:
              $checkedConvert('build_runner', (v) => v as bool? ?? true),
          only_generate_models: $checkedConvert(
              'only_generate_models', (v) => v as bool? ?? false),
          sql_to_dart_type_conversion_overrides: $checkedConvert(
              'sql_to_dart_type_conversion_overrides',
              (v) => v == null
                  ? const <String, dynamic>{}
                  : const YamlMapToMapConverter().fromJson(v as Map)),
          exclude: $checkedConvert(
              'exclude',
              (v) => v == null
                  ? const <String, List<String>?>{}
                  : const YamlMapToMapListConverter().fromJson(v as Map)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_GeneratorOptionsToJson(_$_GeneratorOptions instance) =>
    <String, dynamic>{
      'host': instance.host,
      'port': instance.port,
      'db': instance.db,
      'username': instance.username,
      'password': instance.password,
      'schema': instance.schema,
      'package': instance.package,
      'build_runner': instance.build_runner,
      'only_generate_models': instance.only_generate_models,
      'sql_to_dart_type_conversion_overrides': const YamlMapToMapConverter()
          .toJson(instance.sql_to_dart_type_conversion_overrides),
      'exclude': const YamlMapToMapListConverter().toJson(instance.exclude),
    };
