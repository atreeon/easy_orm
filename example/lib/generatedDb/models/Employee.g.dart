// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Employee _$$_EmployeeFromJson(Map<String, dynamic> json) => _$_Employee(
      employee_id: json['employee_id'] as int,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      photo: json['photo'] as String,
      birth_date: json['birth_date'] as String,
      hire_date: json['hire_date'] as String,
      reports_to: json['reports_to'] as int,
      notes: json['notes'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      extension: json['extension'] as String,
      home_phone: json['home_phone'] as String,
      photo_path: json['photo_path'] as String,
      postal_code: json['postal_code'] as String,
      region: json['region'] as String,
      title: json['title'] as String,
      title_of_courtesy: json['title_of_courtesy'] as String,
    );

Map<String, dynamic> _$$_EmployeeToJson(_$_Employee instance) =>
    <String, dynamic>{
      'employee_id': instance.employee_id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'photo': instance.photo,
      'birth_date': instance.birth_date,
      'hire_date': instance.hire_date,
      'reports_to': instance.reports_to,
      'notes': instance.notes,
      'address': instance.address,
      'city': instance.city,
      'country': instance.country,
      'extension': instance.extension,
      'home_phone': instance.home_phone,
      'photo_path': instance.photo_path,
      'postal_code': instance.postal_code,
      'region': instance.region,
      'title': instance.title,
      'title_of_courtesy': instance.title_of_courtesy,
    };
