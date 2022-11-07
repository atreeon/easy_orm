// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'Employee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Employee _$EmployeeFromJson(Map<String, dynamic> json) {
  return _Employee.fromJson(json);
}

/// @nodoc
mixin _$Employee {
  int get employee_id => throw _privateConstructorUsedError;
  String get first_name => throw _privateConstructorUsedError;
  String get last_name => throw _privateConstructorUsedError;
  DateTime? get birth_date => throw _privateConstructorUsedError;
  DateTime? get hire_date => throw _privateConstructorUsedError;
  int? get reports_to => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get extension => throw _privateConstructorUsedError;
  String? get home_phone => throw _privateConstructorUsedError;
  String? get photo_path => throw _privateConstructorUsedError;
  String? get postal_code => throw _privateConstructorUsedError;
  String? get region => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get title_of_courtesy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmployeeCopyWith<Employee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeCopyWith<$Res> {
  factory $EmployeeCopyWith(Employee value, $Res Function(Employee) then) =
      _$EmployeeCopyWithImpl<$Res>;
  $Res call(
      {int employee_id,
      String first_name,
      String last_name,
      DateTime? birth_date,
      DateTime? hire_date,
      int? reports_to,
      String? notes,
      String? address,
      String? city,
      String? country,
      String? extension,
      String? home_phone,
      String? photo_path,
      String? postal_code,
      String? region,
      String? title,
      String? title_of_courtesy});
}

/// @nodoc
class _$EmployeeCopyWithImpl<$Res> implements $EmployeeCopyWith<$Res> {
  _$EmployeeCopyWithImpl(this._value, this._then);

  final Employee _value;
  // ignore: unused_field
  final $Res Function(Employee) _then;

  @override
  $Res call({
    Object? employee_id = freezed,
    Object? first_name = freezed,
    Object? last_name = freezed,
    Object? birth_date = freezed,
    Object? hire_date = freezed,
    Object? reports_to = freezed,
    Object? notes = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? country = freezed,
    Object? extension = freezed,
    Object? home_phone = freezed,
    Object? photo_path = freezed,
    Object? postal_code = freezed,
    Object? region = freezed,
    Object? title = freezed,
    Object? title_of_courtesy = freezed,
  }) {
    return _then(_value.copyWith(
      employee_id: employee_id == freezed
          ? _value.employee_id
          : employee_id // ignore: cast_nullable_to_non_nullable
              as int,
      first_name: first_name == freezed
          ? _value.first_name
          : first_name // ignore: cast_nullable_to_non_nullable
              as String,
      last_name: last_name == freezed
          ? _value.last_name
          : last_name // ignore: cast_nullable_to_non_nullable
              as String,
      birth_date: birth_date == freezed
          ? _value.birth_date
          : birth_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      hire_date: hire_date == freezed
          ? _value.hire_date
          : hire_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reports_to: reports_to == freezed
          ? _value.reports_to
          : reports_to // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      extension: extension == freezed
          ? _value.extension
          : extension // ignore: cast_nullable_to_non_nullable
              as String?,
      home_phone: home_phone == freezed
          ? _value.home_phone
          : home_phone // ignore: cast_nullable_to_non_nullable
              as String?,
      photo_path: photo_path == freezed
          ? _value.photo_path
          : photo_path // ignore: cast_nullable_to_non_nullable
              as String?,
      postal_code: postal_code == freezed
          ? _value.postal_code
          : postal_code // ignore: cast_nullable_to_non_nullable
              as String?,
      region: region == freezed
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      title_of_courtesy: title_of_courtesy == freezed
          ? _value.title_of_courtesy
          : title_of_courtesy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_EmployeeCopyWith<$Res> implements $EmployeeCopyWith<$Res> {
  factory _$$_EmployeeCopyWith(
          _$_Employee value, $Res Function(_$_Employee) then) =
      __$$_EmployeeCopyWithImpl<$Res>;
  @override
  $Res call(
      {int employee_id,
      String first_name,
      String last_name,
      DateTime? birth_date,
      DateTime? hire_date,
      int? reports_to,
      String? notes,
      String? address,
      String? city,
      String? country,
      String? extension,
      String? home_phone,
      String? photo_path,
      String? postal_code,
      String? region,
      String? title,
      String? title_of_courtesy});
}

/// @nodoc
class __$$_EmployeeCopyWithImpl<$Res> extends _$EmployeeCopyWithImpl<$Res>
    implements _$$_EmployeeCopyWith<$Res> {
  __$$_EmployeeCopyWithImpl(
      _$_Employee _value, $Res Function(_$_Employee) _then)
      : super(_value, (v) => _then(v as _$_Employee));

  @override
  _$_Employee get _value => super._value as _$_Employee;

  @override
  $Res call({
    Object? employee_id = freezed,
    Object? first_name = freezed,
    Object? last_name = freezed,
    Object? birth_date = freezed,
    Object? hire_date = freezed,
    Object? reports_to = freezed,
    Object? notes = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? country = freezed,
    Object? extension = freezed,
    Object? home_phone = freezed,
    Object? photo_path = freezed,
    Object? postal_code = freezed,
    Object? region = freezed,
    Object? title = freezed,
    Object? title_of_courtesy = freezed,
  }) {
    return _then(_$_Employee(
      employee_id: employee_id == freezed
          ? _value.employee_id
          : employee_id // ignore: cast_nullable_to_non_nullable
              as int,
      first_name: first_name == freezed
          ? _value.first_name
          : first_name // ignore: cast_nullable_to_non_nullable
              as String,
      last_name: last_name == freezed
          ? _value.last_name
          : last_name // ignore: cast_nullable_to_non_nullable
              as String,
      birth_date: birth_date == freezed
          ? _value.birth_date
          : birth_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      hire_date: hire_date == freezed
          ? _value.hire_date
          : hire_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reports_to: reports_to == freezed
          ? _value.reports_to
          : reports_to // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      extension: extension == freezed
          ? _value.extension
          : extension // ignore: cast_nullable_to_non_nullable
              as String?,
      home_phone: home_phone == freezed
          ? _value.home_phone
          : home_phone // ignore: cast_nullable_to_non_nullable
              as String?,
      photo_path: photo_path == freezed
          ? _value.photo_path
          : photo_path // ignore: cast_nullable_to_non_nullable
              as String?,
      postal_code: postal_code == freezed
          ? _value.postal_code
          : postal_code // ignore: cast_nullable_to_non_nullable
              as String?,
      region: region == freezed
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      title_of_courtesy: title_of_courtesy == freezed
          ? _value.title_of_courtesy
          : title_of_courtesy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Employee implements _Employee {
  const _$_Employee(
      {required this.employee_id,
      required this.first_name,
      required this.last_name,
      required this.birth_date,
      required this.hire_date,
      required this.reports_to,
      required this.notes,
      required this.address,
      required this.city,
      required this.country,
      required this.extension,
      required this.home_phone,
      required this.photo_path,
      required this.postal_code,
      required this.region,
      required this.title,
      required this.title_of_courtesy});

  factory _$_Employee.fromJson(Map<String, dynamic> json) =>
      _$$_EmployeeFromJson(json);

  @override
  final int employee_id;
  @override
  final String first_name;
  @override
  final String last_name;
  @override
  final DateTime? birth_date;
  @override
  final DateTime? hire_date;
  @override
  final int? reports_to;
  @override
  final String? notes;
  @override
  final String? address;
  @override
  final String? city;
  @override
  final String? country;
  @override
  final String? extension;
  @override
  final String? home_phone;
  @override
  final String? photo_path;
  @override
  final String? postal_code;
  @override
  final String? region;
  @override
  final String? title;
  @override
  final String? title_of_courtesy;

  @override
  String toString() {
    return 'Employee(employee_id: $employee_id, first_name: $first_name, last_name: $last_name, birth_date: $birth_date, hire_date: $hire_date, reports_to: $reports_to, notes: $notes, address: $address, city: $city, country: $country, extension: $extension, home_phone: $home_phone, photo_path: $photo_path, postal_code: $postal_code, region: $region, title: $title, title_of_courtesy: $title_of_courtesy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Employee &&
            const DeepCollectionEquality()
                .equals(other.employee_id, employee_id) &&
            const DeepCollectionEquality()
                .equals(other.first_name, first_name) &&
            const DeepCollectionEquality().equals(other.last_name, last_name) &&
            const DeepCollectionEquality()
                .equals(other.birth_date, birth_date) &&
            const DeepCollectionEquality().equals(other.hire_date, hire_date) &&
            const DeepCollectionEquality()
                .equals(other.reports_to, reports_to) &&
            const DeepCollectionEquality().equals(other.notes, notes) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.city, city) &&
            const DeepCollectionEquality().equals(other.country, country) &&
            const DeepCollectionEquality().equals(other.extension, extension) &&
            const DeepCollectionEquality()
                .equals(other.home_phone, home_phone) &&
            const DeepCollectionEquality()
                .equals(other.photo_path, photo_path) &&
            const DeepCollectionEquality()
                .equals(other.postal_code, postal_code) &&
            const DeepCollectionEquality().equals(other.region, region) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.title_of_courtesy, title_of_courtesy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(employee_id),
      const DeepCollectionEquality().hash(first_name),
      const DeepCollectionEquality().hash(last_name),
      const DeepCollectionEquality().hash(birth_date),
      const DeepCollectionEquality().hash(hire_date),
      const DeepCollectionEquality().hash(reports_to),
      const DeepCollectionEquality().hash(notes),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(city),
      const DeepCollectionEquality().hash(country),
      const DeepCollectionEquality().hash(extension),
      const DeepCollectionEquality().hash(home_phone),
      const DeepCollectionEquality().hash(photo_path),
      const DeepCollectionEquality().hash(postal_code),
      const DeepCollectionEquality().hash(region),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(title_of_courtesy));

  @JsonKey(ignore: true)
  @override
  _$$_EmployeeCopyWith<_$_Employee> get copyWith =>
      __$$_EmployeeCopyWithImpl<_$_Employee>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EmployeeToJson(
      this,
    );
  }
}

abstract class _Employee implements Employee {
  const factory _Employee(
      {required final int employee_id,
      required final String first_name,
      required final String last_name,
      required final DateTime? birth_date,
      required final DateTime? hire_date,
      required final int? reports_to,
      required final String? notes,
      required final String? address,
      required final String? city,
      required final String? country,
      required final String? extension,
      required final String? home_phone,
      required final String? photo_path,
      required final String? postal_code,
      required final String? region,
      required final String? title,
      required final String? title_of_courtesy}) = _$_Employee;

  factory _Employee.fromJson(Map<String, dynamic> json) = _$_Employee.fromJson;

  @override
  int get employee_id;
  @override
  String get first_name;
  @override
  String get last_name;
  @override
  DateTime? get birth_date;
  @override
  DateTime? get hire_date;
  @override
  int? get reports_to;
  @override
  String? get notes;
  @override
  String? get address;
  @override
  String? get city;
  @override
  String? get country;
  @override
  String? get extension;
  @override
  String? get home_phone;
  @override
  String? get photo_path;
  @override
  String? get postal_code;
  @override
  String? get region;
  @override
  String? get title;
  @override
  String? get title_of_courtesy;
  @override
  @JsonKey(ignore: true)
  _$$_EmployeeCopyWith<_$_Employee> get copyWith =>
      throw _privateConstructorUsedError;
}
