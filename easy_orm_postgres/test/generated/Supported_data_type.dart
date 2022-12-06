// ignore_for_file: unused_import
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:typed_data';
part 'Supported_data_type.freezed.dart';
part 'Supported_data_type.g.dart';

@freezed
class Supported_data_type with _$Supported_data_type {
  const factory Supported_data_type({
    required int int2_col,
    required int serial2_col,
    required int serial4_col,
    required int serial8_col,
    required bool? bool_col,
    required String? char_col,
    required DateTime? date_col,
    required double? float4_col,
    required double? float8_col,
    required int? int4_col,
    required int? bigint_col,
    required int? int8_col,
    required double? numeric_col,
    required String? text_col,
    required String? varchar_col,
  }) = _Supported_data_type;

  factory Supported_data_type.fromJson(Map<String, Object?> json) => //
      _$Supported_data_typeFromJson(json);
}
