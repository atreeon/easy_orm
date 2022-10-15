// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Customer _$$_CustomerFromJson(Map<String, dynamic> json) => _$_Customer(
      customer_id: json['customer_id'] as String,
      company_name: json['company_name'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
      contact_name: json['contact_name'] as String,
      contact_title: json['contact_title'] as String,
      country: json['country'] as String,
      fax: json['fax'] as String,
      phone: json['phone'] as String,
      postal_code: json['postal_code'] as String,
      region: json['region'] as String,
    );

Map<String, dynamic> _$$_CustomerToJson(_$_Customer instance) =>
    <String, dynamic>{
      'customer_id': instance.customer_id,
      'company_name': instance.company_name,
      'address': instance.address,
      'city': instance.city,
      'contact_name': instance.contact_name,
      'contact_title': instance.contact_title,
      'country': instance.country,
      'fax': instance.fax,
      'phone': instance.phone,
      'postal_code': instance.postal_code,
      'region': instance.region,
    };
