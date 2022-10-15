// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Categorie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Categorie _$$_CategorieFromJson(Map<String, dynamic> json) => _$_Categorie(
      category_id: json['category_id'] as int,
      category_name: json['category_name'] as String,
      picture: json['picture'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$_CategorieToJson(_$_Categorie instance) =>
    <String, dynamic>{
      'category_id': instance.category_id,
      'category_name': instance.category_name,
      'picture': instance.picture,
      'description': instance.description,
    };
