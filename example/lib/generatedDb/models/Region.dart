import 'package:freezed_annotation/freezed_annotation.dart';
part 'Region.freezed.dart';
part 'Region.g.dart';

@freezed
class Region with _$Region {
  const factory Region({
    required String region_description,
    required int region_id,
  }) = _Region;

  factory Region.fromJson(Map<String, Object?> json) => //
      _$RegionFromJson(json);
}
