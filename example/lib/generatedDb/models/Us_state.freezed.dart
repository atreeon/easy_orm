// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'Us_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Us_state _$Us_stateFromJson(Map<String, dynamic> json) {
  return _Us_state.fromJson(json);
}

/// @nodoc
mixin _$Us_state {
  int get state_id => throw _privateConstructorUsedError;
  String get state_abbr => throw _privateConstructorUsedError;
  String get state_name => throw _privateConstructorUsedError;
  String get state_region => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $Us_stateCopyWith<Us_state> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Us_stateCopyWith<$Res> {
  factory $Us_stateCopyWith(Us_state value, $Res Function(Us_state) then) =
      _$Us_stateCopyWithImpl<$Res>;
  $Res call(
      {int state_id,
      String state_abbr,
      String state_name,
      String state_region});
}

/// @nodoc
class _$Us_stateCopyWithImpl<$Res> implements $Us_stateCopyWith<$Res> {
  _$Us_stateCopyWithImpl(this._value, this._then);

  final Us_state _value;
  // ignore: unused_field
  final $Res Function(Us_state) _then;

  @override
  $Res call({
    Object? state_id = freezed,
    Object? state_abbr = freezed,
    Object? state_name = freezed,
    Object? state_region = freezed,
  }) {
    return _then(_value.copyWith(
      state_id: state_id == freezed
          ? _value.state_id
          : state_id // ignore: cast_nullable_to_non_nullable
              as int,
      state_abbr: state_abbr == freezed
          ? _value.state_abbr
          : state_abbr // ignore: cast_nullable_to_non_nullable
              as String,
      state_name: state_name == freezed
          ? _value.state_name
          : state_name // ignore: cast_nullable_to_non_nullable
              as String,
      state_region: state_region == freezed
          ? _value.state_region
          : state_region // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_Us_stateCopyWith<$Res> implements $Us_stateCopyWith<$Res> {
  factory _$$_Us_stateCopyWith(
          _$_Us_state value, $Res Function(_$_Us_state) then) =
      __$$_Us_stateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int state_id,
      String state_abbr,
      String state_name,
      String state_region});
}

/// @nodoc
class __$$_Us_stateCopyWithImpl<$Res> extends _$Us_stateCopyWithImpl<$Res>
    implements _$$_Us_stateCopyWith<$Res> {
  __$$_Us_stateCopyWithImpl(
      _$_Us_state _value, $Res Function(_$_Us_state) _then)
      : super(_value, (v) => _then(v as _$_Us_state));

  @override
  _$_Us_state get _value => super._value as _$_Us_state;

  @override
  $Res call({
    Object? state_id = freezed,
    Object? state_abbr = freezed,
    Object? state_name = freezed,
    Object? state_region = freezed,
  }) {
    return _then(_$_Us_state(
      state_id: state_id == freezed
          ? _value.state_id
          : state_id // ignore: cast_nullable_to_non_nullable
              as int,
      state_abbr: state_abbr == freezed
          ? _value.state_abbr
          : state_abbr // ignore: cast_nullable_to_non_nullable
              as String,
      state_name: state_name == freezed
          ? _value.state_name
          : state_name // ignore: cast_nullable_to_non_nullable
              as String,
      state_region: state_region == freezed
          ? _value.state_region
          : state_region // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Us_state implements _Us_state {
  const _$_Us_state(
      {required this.state_id,
      required this.state_abbr,
      required this.state_name,
      required this.state_region});

  factory _$_Us_state.fromJson(Map<String, dynamic> json) =>
      _$$_Us_stateFromJson(json);

  @override
  final int state_id;
  @override
  final String state_abbr;
  @override
  final String state_name;
  @override
  final String state_region;

  @override
  String toString() {
    return 'Us_state(state_id: $state_id, state_abbr: $state_abbr, state_name: $state_name, state_region: $state_region)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Us_state &&
            const DeepCollectionEquality().equals(other.state_id, state_id) &&
            const DeepCollectionEquality()
                .equals(other.state_abbr, state_abbr) &&
            const DeepCollectionEquality()
                .equals(other.state_name, state_name) &&
            const DeepCollectionEquality()
                .equals(other.state_region, state_region));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(state_id),
      const DeepCollectionEquality().hash(state_abbr),
      const DeepCollectionEquality().hash(state_name),
      const DeepCollectionEquality().hash(state_region));

  @JsonKey(ignore: true)
  @override
  _$$_Us_stateCopyWith<_$_Us_state> get copyWith =>
      __$$_Us_stateCopyWithImpl<_$_Us_state>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_Us_stateToJson(
      this,
    );
  }
}

abstract class _Us_state implements Us_state {
  const factory _Us_state(
      {required final int state_id,
      required final String state_abbr,
      required final String state_name,
      required final String state_region}) = _$_Us_state;

  factory _Us_state.fromJson(Map<String, dynamic> json) = _$_Us_state.fromJson;

  @override
  int get state_id;
  @override
  String get state_abbr;
  @override
  String get state_name;
  @override
  String get state_region;
  @override
  @JsonKey(ignore: true)
  _$$_Us_stateCopyWith<_$_Us_state> get copyWith =>
      throw _privateConstructorUsedError;
}
