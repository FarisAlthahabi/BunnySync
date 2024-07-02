// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breeder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreederModel _$BreederModelFromJson(Map<String, dynamic> json) => BreederModel(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      updatedAt: DateTime.parse(json['updated_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      prefix: json['prefix'] as String?,
      cage: json['cage'] as String?,
      gender: $enumDecodeNullable(_$GenderTypesEnumMap, json['gender']),
      color: json['color'] as String?,
      tatto: json['tatto'] as String?,
      breed: json['breed'] as String?,
      categoryBreederId: (json['category_breeder_id'] as num?)?.toInt(),
      weight: json['weight'] as String,
      litters: json['litters'] as String,
      kits: json['kits'] as String,
      age: json['age'] as String,
      status: json['status'] as String,
      photo: json['photo'] as String,
      dtRowIndex: (json['DT_RowIndex'] as num).toInt(),
    );

Map<String, dynamic> _$BreederModelToJson(BreederModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'uuid': instance.uuid,
      'name': instance.name,
      'updated_at': instance.updatedAt.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'prefix': instance.prefix,
      'cage': instance.cage,
      'gender': _$GenderTypesEnumMap[instance.gender],
      'color': instance.color,
      'tatto': instance.tatto,
      'breed': instance.breed,
      'category_breeder_id': instance.categoryBreederId,
      'weight': instance.weight,
      'litters': instance.litters,
      'kits': instance.kits,
      'age': instance.age,
      'status': instance.status,
      'photo': instance.photo,
      'DT_RowIndex': instance.dtRowIndex,
    };

const _$GenderTypesEnumMap = {
  GenderTypes.male: 'male',
  GenderTypes.female: 'female',
};
