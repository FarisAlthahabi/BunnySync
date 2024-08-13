// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) =>
    CustomerModel(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      status: json['status'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      type: CustomerTypes.fromJson(json['type'] as String),
      companyName: json['company_name'] as String,
      phone: json['phone'] as String,
      note: json['note'] as String,
      street: json['street'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      zipCode: json['zip_code'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      date: const DateTimeNullableConverter().fromJson(json['date'] as String?),
      dtRowIndex: (json['DT_RowIndex'] as num?)?.toInt(),
      state: json['state'] as String?,
    );

Map<String, dynamic> _$CustomerModelToJson(CustomerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'status': instance.status,
      'email': instance.email,
      'name': instance.name,
      'type': _$CustomerTypesEnumMap[instance.type]!,
      'company_name': instance.companyName,
      'phone': instance.phone,
      'note': instance.note,
      'street': instance.street,
      'city': instance.city,
      'country': instance.country,
      'zip_code': instance.zipCode,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'date': const DateTimeNullableConverter().toJson(instance.date),
      'DT_RowIndex': instance.dtRowIndex,
      'state': instance.state,
    };

const _$CustomerTypesEnumMap = {
  CustomerTypes.lead: 'lead',
  CustomerTypes.vendor: 'vendor',
  CustomerTypes.customer: 'customer',
};
