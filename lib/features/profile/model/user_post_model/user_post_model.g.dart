// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPostModel _$UserPostModelFromJson(Map<String, dynamic> json) =>
    UserPostModel(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      address: json['address'] as String?,
      phoneNumber: json['phone'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      pets: json['pets'] as bool?,
      show: json['show'] as bool?,
      wool: json['wool'] as bool?,
      pelts: json['pelts'] as bool?,
      meat: json['meat'] as bool?,
      type: $enumDecodeNullable(_$ProfileTypesEnumMap, json['type']),
      search: json['search'] as String?,
    );

Map<String, dynamic> _$UserPostModelToJson(UserPostModel instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'address': instance.address,
      'phone': instance.phoneNumber,
      'city': instance.city,
      'state': instance.state,
      'pets': instance.pets,
      'show': instance.show,
      'wool': instance.wool,
      'pelts': instance.pelts,
      'meat': instance.meat,
      'type': _$ProfileTypesEnumMap[instance.type]!,
      'search': instance.search,
    };

const _$ProfileTypesEnumMap = {
  ProfileTypes.existingCustomer: 'existingCustomer',
  ProfileTypes.otherPerson: 'otherPerson',
  ProfileTypes.google: 'google',
  ProfileTypes.facebook: 'facebook',
  ProfileTypes.socialMedia: 'socialMedia',
  ProfileTypes.article: 'article',
  ProfileTypes.advertisment: 'advertisment',
  ProfileTypes.convention: 'convention',
  ProfileTypes.sale: 'sale',
  ProfileTypes.other: 'other',
};
