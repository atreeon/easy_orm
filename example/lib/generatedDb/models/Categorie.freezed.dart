// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'Categorie.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Categorie _$CategorieFromJson(Map<String, dynamic> json) {
  return _Categorie.fromJson(json);
}

/// @nodoc
mixin _$Categorie {
  int get category_id => throw _privateConstructorUsedError;
  String get category_name => throw _privateConstructorUsedError;
  String get picture => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategorieCopyWith<Categorie> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategorieCopyWith<$Res> {
  factory $CategorieCopyWith(Categorie value, $Res Function(Categorie) then) =
      _$CategorieCopyWithImpl<$Res>;
  $Res call(
      {int category_id,
      String category_name,
      String picture,
      String description});
}

/// @nodoc
class _$CategorieCopyWithImpl<$Res> implements $CategorieCopyWith<$Res> {
  _$CategorieCopyWithImpl(this._value, this._then);

  final Categorie _value;
  // ignore: unused_field
  final $Res Function(Categorie) _then;

  @override
  $Res call({
    Object? category_id = freezed,
    Object? category_name = freezed,
    Object? picture = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      category_id: category_id == freezed
          ? _value.category_id
          : category_id // ignore: cast_nullable_to_non_nullable
              as int,
      category_name: category_name == freezed
          ? _value.category_name
          : category_name // ignore: cast_nullable_to_non_nullable
              as String,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_CategorieCopyWith<$Res> implements $CategorieCopyWith<$Res> {
  factory _$$_CategorieCopyWith(
          _$_Categorie value, $Res Function(_$_Categorie) then) =
      __$$_CategorieCopyWithImpl<$Res>;
  @override
  $Res call(
      {int category_id,
      String category_name,
      String picture,
      String description});
}

/// @nodoc
class __$$_CategorieCopyWithImpl<$Res> extends _$CategorieCopyWithImpl<$Res>
    implements _$$_CategorieCopyWith<$Res> {
  __$$_CategorieCopyWithImpl(
      _$_Categorie _value, $Res Function(_$_Categorie) _then)
      : super(_value, (v) => _then(v as _$_Categorie));

  @override
  _$_Categorie get _value => super._value as _$_Categorie;

  @override
  $Res call({
    Object? category_id = freezed,
    Object? category_name = freezed,
    Object? picture = freezed,
    Object? description = freezed,
  }) {
    return _then(_$_Categorie(
      category_id: category_id == freezed
          ? _value.category_id
          : category_id // ignore: cast_nullable_to_non_nullable
              as int,
      category_name: category_name == freezed
          ? _value.category_name
          : category_name // ignore: cast_nullable_to_non_nullable
              as String,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Categorie implements _Categorie {
  const _$_Categorie(
      {required this.category_id,
      required this.category_name,
      required this.picture,
      required this.description});

  factory _$_Categorie.fromJson(Map<String, dynamic> json) =>
      _$$_CategorieFromJson(json);

  @override
  final int category_id;
  @override
  final String category_name;
  @override
  final String picture;
  @override
  final String description;

  @override
  String toString() {
    return 'Categorie(category_id: $category_id, category_name: $category_name, picture: $picture, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Categorie &&
            const DeepCollectionEquality()
                .equals(other.category_id, category_id) &&
            const DeepCollectionEquality()
                .equals(other.category_name, category_name) &&
            const DeepCollectionEquality().equals(other.picture, picture) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(category_id),
      const DeepCollectionEquality().hash(category_name),
      const DeepCollectionEquality().hash(picture),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$$_CategorieCopyWith<_$_Categorie> get copyWith =>
      __$$_CategorieCopyWithImpl<_$_Categorie>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategorieToJson(
      this,
    );
  }
}

abstract class _Categorie implements Categorie {
  const factory _Categorie(
      {required final int category_id,
      required final String category_name,
      required final String picture,
      required final String description}) = _$_Categorie;

  factory _Categorie.fromJson(Map<String, dynamic> json) =
      _$_Categorie.fromJson;

  @override
  int get category_id;
  @override
  String get category_name;
  @override
  String get picture;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_CategorieCopyWith<_$_Categorie> get copyWith =>
      throw _privateConstructorUsedError;
}
