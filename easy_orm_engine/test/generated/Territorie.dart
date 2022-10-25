// ignore_for_file: unused_import
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:typed_data';
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
