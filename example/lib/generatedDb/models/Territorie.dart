import 'package:freezed_annotation/freezed_annotation.dart';
part 'Territorie.freezed.dart';
part 'Territorie.g.dart';

@freezed
class Territorie with _$Territorie {
  const factory Territorie({
    required String territory_description,
    required int region_id,
    required String territory_id,
  }) = _Territorie;

  factory Territorie.fromJson(Map<String, Object?> json) => //
      _$TerritorieFromJson(json);
}
