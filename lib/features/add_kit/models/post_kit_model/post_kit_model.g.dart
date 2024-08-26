// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_kit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostKitModel _$PostKitModelFromJson(Map<String, dynamic> json) => PostKitModel(
      tatto: json['tatto'] as String?,
      prefix: json['prefix'] as String?,
      name: json['name'] as String?,
      color: json['color'] as String?,
      breed: json['breed'] as String?,
      cage: json['cage'] as String?,
      gender: $enumDecodeNullable(_$GenderTypesEnumMap, json['gender']),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$PostKitModelToJson(PostKitModel instance) =>
    <String, dynamic>{
      'tatto': instance.tatto,
      'prefix': instance.prefix,
      'name': instance.name,
      'color': instance.color,
      'breed': instance.breed,
      'cage': instance.cage,
      'gender': instance.gender,
      'note': instance.note,
    };

const _$GenderTypesEnumMap = {
  GenderTypes.male: 'male',
  GenderTypes.female: 'female',
};
