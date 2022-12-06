import "package:yaml/yaml.dart";

extension YamlMapConverter on YamlMap {
  dynamic _convertNode(dynamic v) {
    if (v is YamlMap) {
      return v.toMap();
    } else if (v is YamlList) {
      var list = <dynamic>[];
      v.forEach((e) {
        list.add(_convertNode(e));
      });
      return list;
    } else {
      return v;
    }
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    this.nodes.forEach((k, v) {
      map[(k as YamlScalar).value.toString()] = _convertNode(v.value);
    });
    return map;
  }
}

Map<String, List<String>?> processExcludeListYaml(String excludeListYaml) {
  late YamlMap yamlData;
  try {
    var yaml = loadYaml(excludeListYaml);
    yamlData = yaml;
  } catch (e) {
    throw Exception('problem in excludeList.yaml, read comments in example project example/config/excludeList.yaml');
  }
  var mapData = yamlData.toMap();
  var result = mapData.map((key, value) => MapEntry(key, (value as String?)?.split(" ") ?? null));
  return result;
}
