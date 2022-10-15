import 'package:freezed_annotation/freezed_annotation.dart';
part 'Us_state.freezed.dart';
part 'Us_state.g.dart';

@freezed
class Us_state with _$Us_state {
  const factory Us_state({
    required int state_id,
    required String state_abbr,
    required String state_name,
    required String state_region,
  }) = _Us_state;

  factory Us_state.fromJson(Map<String, Object?> json) => //
      _$Us_stateFromJson(json);
}
