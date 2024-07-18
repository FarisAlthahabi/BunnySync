// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KitModel _$KitModelFromJson(Map<String, dynamic> json) => KitModel(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num?)?.toInt() ?? -1,
      litterId: (json['litter_id'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      code: json['code'] as String?,
      name: json['name'] as String?,
      prefix: json['prefix'] as String?,
      color: json['color'] as String?,
      breed: json['breed'] as String?,
      cage: json['cage'] as String?,
      gender: $enumDecodeNullable(_$GenderTypesEnumMap, json['gender']),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$KitModelToJson(KitModel instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'litter_id': instance.litterId,
      'name': instance.name,
      'prefix': instance.prefix,
      'code': instance.code,
      'color': instance.color,
      'breed': instance.breed,
      'cage': instance.cage,
      'gender': _$GenderTypesEnumMap[instance.gender],
      'note': instance.note,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

const _$GenderTypesEnumMap = {
  GenderTypes.male: 'male',
  GenderTypes.female: 'female',
};
