// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'Employee_territorie.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Employee_territorie _$Employee_territorieFromJson(Map<String, dynamic> json) {
  return _Employee_territorie.fromJson(json);
}

/// @nodoc
mixin _$Employee_territorie {
  int get employee_id => throw _privateConstructorUsedError;
  String get territory_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $Employee_territorieCopyWith<Employee_territorie> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Employee_territorieCopyWith<$Res> {
  factory $Employee_territorieCopyWith(
          Employee_territorie value, $Res Function(Employee_territorie) then) =
      _$Employee_territorieCopyWithImpl<$Res>;
  $Res call({int employee_id, String territory_id});
}

/// @nodoc
class _$Employee_territorieCopyWithImpl<$Res>
    implements $Employee_territorieCopyWith<$Res> {
  _$Employee_territorieCopyWithImpl(this._value, this._then);

  final Employee_territorie _value;
  // ignore: unused_field
  final $Res Function(Employee_territorie) _then;

  @override
  $Res call({
    Object? employee_id = freezed,
    Object? territory_id = freezed,
  }) {
    return _then(_value.copyWith(
      employee_id: employee_id == freezed
          ? _value.employee_id
          : employee_id // ignore: cast_nullable_to_non_nullable
              as int,
      territory_id: territory_id == freezed
          ? _value.territory_id
          : territory_id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_Employee_territorieCopyWith<$Res>
    implements $Employee_territorieCopyWith<$Res> {
  factory _$$_Employee_territorieCopyWith(_$_Employee_territorie value,
          $Res Function(_$_Employee_territorie) then) =
      __$$_Employee_territorieCopyWithImpl<$Res>;
  @override
  $Res call({int employee_id, String territory_id});
}

/// @nodoc
class __$$_Employee_territorieCopyWithImpl<$Res>
    extends _$Employee_territorieCopyWithImpl<$Res>
    implements _$$_Employee_territorieCopyWith<$Res> {
  __$$_Employee_territorieCopyWithImpl(_$_Employee_territorie _value,
      $Res Function(_$_Employee_territorie) _then)
      : super(_value, (v) => _then(v as _$_Employee_territorie));

  @override
  _$_Employee_territorie get _value => super._value as _$_Employee_territorie;

  @override
  $Res call({
    Object? employee_id = freezed,
    Object? territory_id = freezed,
  }) {
    return _then(_$_Employee_territorie(
      employee_id: employee_id == freezed
          ? _value.employee_id
          : employee_id // ignore: cast_nullable_to_non_nullable
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
class _$_Employee_territorie implements _Employee_territorie {
  const _$_Employee_territorie(
      {required this.employee_id, required this.territory_id});

  factory _$_Employee_territorie.fromJson(Map<String, dynamic> json) =>
      _$$_Employee_territorieFromJson(json);

  @override
  final int employee_id;
  @override
  final String territory_id;

  @override
  String toString() {
    return 'Employee_territorie(employee_id: $employee_id, territory_id: $territory_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Employee_territorie &&
            const DeepCollectionEquality()
                .equals(other.employee_id, employee_id) &&
            const DeepCollectionEquality()
                .equals(other.territory_id, territory_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(employee_id),
      const DeepCollectionEquality().hash(territory_id));

  @JsonKey(ignore: true)
  @override
  _$$_Employee_territorieCopyWith<_$_Employee_territorie> get copyWith =>
      __$$_Employee_territorieCopyWithImpl<_$_Employee_territorie>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_Employee_territorieToJson(
      this,
    );
  }
}

abstract class _Employee_territorie implements Employee_territorie {
  const factory _Employee_territorie(
      {required final int employee_id,
      required final String territory_id}) = _$_Employee_territorie;

  factory _Employee_territorie.fromJson(Map<String, dynamic> json) =
      _$_Employee_territorie.fromJson;

  @override
  int get employee_id;
  @override
  String get territory_id;
  @override
  @JsonKey(ignore: true)
  _$$_Employee_territorieCopyWith<_$_Employee_territorie> get copyWith =>
      throw _privateConstructorUsedError;
}
