import 'package:freezed_annotation/freezed_annotation.dart';
part 'Categorie.freezed.dart';
part 'Categorie.g.dart';

@freezed
class Categorie with _$Categorie {
  const factory Categorie({
    required int category_id,
    required String category_name,
    required String picture,
    required String description,
  }) = _Categorie;

  factory Categorie.fromJson(Map<String, Object?> json) => //
      _$CategorieFromJson(json);
}
