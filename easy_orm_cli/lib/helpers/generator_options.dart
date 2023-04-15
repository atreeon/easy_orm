// ignore_for_file: invalid_annotation_target

import 'package:easy_orm_postgres/easy_orm_postgres.dart';
import 'package:yaml/yaml.dart';

part 'generator_options.freezed.dart';
part 'generator_options.g.dart';

@freezed
class GeneratorOptions with _$GeneratorOptions {
  @JsonSerializable(checked: true, explicitToJson: true)
  const factory GeneratorOptions({
    required String host,
    required int port,
    required String db,
    required String username,
    required String password,
    @Default("public") String schema,
    required String package,
    @Default(true) bool build_runner,
    @YamlMapToMapConverter()
    @Default(<String, dynamic>{})
        Map<String, dynamic> sql_to_dart_type_conversion_overrides,
    @YamlMapToMapListConverter()
    @Default(<String, List<String>?>{})
        Map<String, List<String>?> exclude,
  }) = _GeneratorOptions;

  factory GeneratorOptions.fromJson(Map<String, dynamic> json) =>
      _$GeneratorOptionsFromJson(json);

  const GeneratorOptions._();

  PostgreSQLConnection get postgresConnection => PostgreSQLConnection(
        host,
        port,
        db,
        username: username,
        password: password,
      );

  static const empty = GeneratorOptions(
    host: '',
    port: 0,
    db: '',
    username: '',
    password: '',
    package: '',
  );
}

class YamlMapToMapConverter
    implements JsonConverter<Map<String, dynamic>, Map> {
  const YamlMapToMapConverter();

  @override
  Map<String, String> fromJson(Map json) {
    if (json is YamlMap) {
      return Map<String, String>.fromEntries(
          json.nodes.entries.map((e) => MapEntry(e.key.value, e.value.value)));
    } else {
      return json.cast();
    }
  }

  @override
  Map toJson(Map<String, dynamic> object) {
    return object;
  }
}

class YamlMapToMapListConverter
    implements JsonConverter<Map<String, List<String>?>, Map> {
  const YamlMapToMapListConverter();

  @override
  Map<String, List<String>?> fromJson(Map json) {
    if (json is YamlMap) {
      return Map<String, List<String>?>.fromEntries(json.nodes.entries.map(
        (e) => MapEntry(
          e.key.value,
          (e.value.value as YamlList?)?.cast<String>(),
        ),
      ));
    } else {
      return json.cast();
    }
  }

  @override
  Map toJson(Map<String, List<String>?> object) {
    return object;
  }
}
