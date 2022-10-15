// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'EmployeeFreezed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EmployeeF _$EmployeeFFromJson(Map<String, dynamic> json) {
  return _EmployeeF.fromJson(json);
}

/// @nodoc
mixin _$EmployeeF {
  int get employee_id => throw _privateConstructorUsedError;
  String get title_of_courtesy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmployeeFCopyWith<EmployeeF> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeFCopyWith<$Res> {
  factory $EmployeeFCopyWith(EmployeeF value, $Res Function(EmployeeF) then) =
      _$EmployeeFCopyWithImpl<$Res>;
  $Res call({int employee_id, String title_of_courtesy});
}

/// @nodoc
class _$EmployeeFCopyWithImpl<$Res> implements $EmployeeFCopyWith<$Res> {
  _$EmployeeFCopyWithImpl(this._value, this._then);

  final EmployeeF _value;
  // ignore: unused_field
  final $Res Function(EmployeeF) _then;

  @override
  $Res call({
    Object? employee_id = freezed,
    Object? title_of_courtesy = freezed,
  }) {
    return _then(_value.copyWith(
      employee_id: employee_id == freezed
          ? _value.employee_id
          : employee_id // ignore: cast_nullable_to_non_nullable
              as int,
      title_of_courtesy: title_of_courtesy == freezed
          ? _value.title_of_courtesy
          : title_of_courtesy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_EmployeeFCopyWith<$Res> implements $EmployeeFCopyWith<$Res> {
  factory _$$_EmployeeFCopyWith(
          _$_EmployeeF value, $Res Function(_$_EmployeeF) then) =
      __$$_EmployeeFCopyWithImpl<$Res>;
  @override
  $Res call({int employee_id, String title_of_courtesy});
}

/// @nodoc
class __$$_EmployeeFCopyWithImpl<$Res> extends _$EmployeeFCopyWithImpl<$Res>
    implements _$$_EmployeeFCopyWith<$Res> {
  __$$_EmployeeFCopyWithImpl(
      _$_EmployeeF _value, $Res Function(_$_EmployeeF) _then)
      : super(_value, (v) => _then(v as _$_EmployeeF));

  @override
  _$_EmployeeF get _value => super._value as _$_EmployeeF;

  @override
  $Res call({
    Object? employee_id = freezed,
    Object? title_of_courtesy = freezed,
  }) {
    return _then(_$_EmployeeF(
      employee_id: employee_id == freezed
          ? _value.employee_id
          : employee_id // ignore: cast_nullable_to_non_nullable
              as int,
      title_of_courtesy: title_of_courtesy == freezed
          ? _value.title_of_courtesy
          : title_of_courtesy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EmployeeF implements _EmployeeF {
  const _$_EmployeeF(
      {required this.employee_id, required this.title_of_courtesy});

  factory _$_EmployeeF.fromJson(Map<String, dynamic> json) =>
      _$$_EmployeeFFromJson(json);

  @override
  final int employee_id;
  @override
  final String title_of_courtesy;

  @override
  String toString() {
    return 'EmployeeF(employee_id: $employee_id, title_of_courtesy: $title_of_courtesy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmployeeF &&
            const DeepCollectionEquality()
                .equals(other.employee_id, employee_id) &&
            const DeepCollectionEquality()
                .equals(other.title_of_courtesy, title_of_courtesy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(employee_id),
      const DeepCollectionEquality().hash(title_of_courtesy));

  @JsonKey(ignore: true)
  @override
  _$$_EmployeeFCopyWith<_$_EmployeeF> get copyWith =>
      __$$_EmployeeFCopyWithImpl<_$_EmployeeF>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EmployeeFToJson(
      this,
    );
  }
}

abstract class _EmployeeF implements EmployeeF {
  const factory _EmployeeF(
      {required final int employee_id,
      required final String title_of_courtesy}) = _$_EmployeeF;

  factory _EmployeeF.fromJson(Map<String, dynamic> json) =
      _$_EmployeeF.fromJson;

  @override
  int get employee_id;
  @override
  String get title_of_courtesy;
  @override
  @JsonKey(ignore: true)
  _$$_EmployeeFCopyWith<_$_EmployeeF> get copyWith =>
      throw _privateConstructorUsedError;
}
