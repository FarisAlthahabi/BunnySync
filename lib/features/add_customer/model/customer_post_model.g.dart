// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerPostModel _$CustomerPostModelFromJson(Map<String, dynamic> json) =>
    CustomerPostModel(
      email: json['email'] as String?,
      name: json['contact_name'] as String?,
      type: json['type'] as String?,
      companyName: json['company_name'] as String?,
      phone: json['phone'] as String?,
      note: json['note'] as String?,
      street: json['street'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      zipCode: json['zip_code'] as String?,
    );

Map<String, dynamic> _$CustomerPostModelToJson(CustomerPostModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'contact_name': instance.name,
      'type': instance.type,
      'company_name': instance.companyName,
      'phone': instance.phone,
      'note': instance.note,
      'street': instance.street,
      'city': instance.city,
      'country': instance.country,
      'state': instance.state,
      'zip_code': instance.zipCode,
    };
