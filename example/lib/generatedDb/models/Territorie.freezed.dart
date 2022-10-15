// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'Territorie.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Territorie _$TerritorieFromJson(Map<String, dynamic> json) {
  return _Territorie.fromJson(json);
}

/// @nodoc
mixin _$Territorie {
  String get territory_description => throw _privateConstructorUsedError;
  int get region_id => throw _privateConstructorUsedError;
  String get territory_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TerritorieCopyWith<Territorie> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TerritorieCopyWith<$Res> {
  factory $TerritorieCopyWith(
          Territorie value, $Res Function(Territorie) then) =
      _$TerritorieCopyWithImpl<$Res>;
  $Res call({String territory_description, int region_id, String territory_id});
}

/// @nodoc
class _$TerritorieCopyWithImpl<$Res> implements $TerritorieCopyWith<$Res> {
  _$TerritorieCopyWithImpl(this._value, this._then);

  final Territorie _value;
  // ignore: unused_field
  final $Res Function(Territorie) _then;

  @override
  $Res call({
    Object? territory_description = freezed,
    Object? region_id = freezed,
    Object? territory_id = freezed,
  }) {
    return _then(_value.copyWith(
      territory_description: territory_description == freezed
          ? _value.territory_description
          : territory_description // ignore: cast_nullable_to_non_nullable
              as String,
      region_id: region_id == freezed
          ? _value.region_id
          : region_id // ignore: cast_nullable_to_non_nullable
              as int,
      territory_id: territory_id == freezed
          ? _value.territory_id
          : territory_id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_TerritorieCopyWith<$Res>
    implements $TerritorieCopyWith<$Res> {
  factory _$$_TerritorieCopyWith(
          _$_Territorie value, $Res Function(_$_Territorie) then) =
      __$$_TerritorieCopyWithImpl<$Res>;
  @override
  $Res call({String territory_description, int region_id, String territory_id});
}

/// @nodoc
class __$$_TerritorieCopyWithImpl<$Res> extends _$TerritorieCopyWithImpl<$Res>
    implements _$$_TerritorieCopyWith<$Res> {
  __$$_TerritorieCopyWithImpl(
      _$_Territorie _value, $Res Function(_$_Territorie) _then)
      : super(_value, (v) => _then(v as _$_Territorie));

  @override
  _$_Territorie get _value => super._value as _$_Territorie;

  @override
  $Res call({
    Object? territory_description = freezed,
    Object? region_id = freezed,
    Object? territory_id = freezed,
  }) {
    return _then(_$_Territorie(
      territory_description: territory_description == freezed
          ? _value.territory_description
          : territory_description // ignore: cast_nullable_to_non_nullable
              as String,
      region_id: region_id == freezed
          ? _value.region_id
          : region_id // ignore: cast_nullable_to_non_nullable
              as int,
      territory_id: territory_id == freezed
          ? _value.territory_id
          : territory_id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Territorie implements _Territorie {
  const _$_Territorie(
      {required this.territory_description,
      required this.region_id,
      required this.territory_id});

  factory _$_Territorie.fromJson(Map<String, dynamic> json) =>
      _$$_TerritorieFromJson(json);

  @override
  final String territory_description;
  @override
  final int region_id;
  @override
  final String territory_id;

  @override
  String toString() {
    return 'Territorie(territory_description: $territory_description, region_id: $region_id, territory_id: $territory_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Territorie &&
            const DeepCollectionEquality()
                .equals(other.territory_description, territory_description) &&
            const DeepCollectionEquality().equals(other.region_id, region_id) &&
            const DeepCollectionEquality()
                .equals(other.territory_id, territory_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(territory_description),
      const DeepCollectionEquality().hash(region_id),
      const DeepCollectionEquality().hash(territory_id));

  @JsonKey(ignore: true)
  @override
  _$$_TerritorieCopyWith<_$_Territorie> get copyWith =>
      __$$_TerritorieCopyWithImpl<_$_Territorie>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TerritorieToJson(
      this,
    );
  }
}

abstract class _Territorie implements Territorie {
  const factory _Territorie(
      {required final String territory_description,
      required final int region_id,
      required final String territory_id}) = _$_Territorie;

  factory _Territorie.fromJson(Map<String, dynamic> json) =
      _$_Territorie.fromJson;

  @override
  String get territory_description;
  @override
  int get region_id;
  @override
  String get territory_id;
  @override
  @JsonKey(ignore: true)
  _$$_TerritorieCopyWith<_$_Territorie> get copyWith =>
      throw _privateConstructorUsedError;
}
