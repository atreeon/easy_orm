var model_template = """--inputs: className, tableName, columns as List<Column>, classOutputName
import 'package:freezed_annotation/freezed_annotation.dart';
part '%%%modelName%%%.freezed.dart';
part '%%%modelName%%%.g.dart';

@freezed
class %%%modelName%%% with _\$%%%modelName%%% {
  const factory %%%modelName%%%({
~~~columns|modelParameters_subTemplate~~~
  }) = _%%%modelName%%%;

  factory %%%modelName%%%.fromJson(Map<String, Object?> json) => //
  _\$%%%modelName%%%FromJson(json);
}
""";