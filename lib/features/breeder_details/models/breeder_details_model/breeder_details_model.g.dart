// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breeder_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreederDetailsModel _$BreederDetailsModelFromJson(Map<String, dynamic> json) =>
    BreederDetailsModel(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      prefix: json['prefix'] as String,
      cage: json['cage'] as String,
      gender: $enumDecode(_$GenderTypesEnumMap, json['gender']),
      color: json['color'] as String,
      tatto: json['tatto'] as String,
      updatedAt: DateTime.parse(json['updated_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      status: StatusModel.fromJson(json['status'] as Map<String, dynamic>),
      detail: DetailModel.fromJson(json['detail'] as Map<String, dynamic>),
      breed: json['breed'] as String?,
      categoryBreederId: (json['category_breeder_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BreederDetailsModelToJson(
        BreederDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'category_breeder_id': instance.categoryBreederId,
      'uuid': instance.uuid,
      'name': instance.name,
      'prefix': instance.prefix,
      'cage': instance.cage,
      'gender': _$GenderTypesEnumMap[instance.gender]!,
      'color': instance.color,
      'tatto': instance.tatto,
      'breed': instance.breed,
      'updated_at': instance.updatedAt.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'status': instance.status,
      'detail': instance.detail,
    };

const _$GenderTypesEnumMap = {
  GenderTypes.male: 'male',
  GenderTypes.female: 'female',
};
