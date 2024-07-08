// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pedigree_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PedigreeModel _$PedigreeModelFromJson(Map<String, dynamic> json) =>
    PedigreeModel(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      uuid: json['uuid'] as String,
      categoryBreederId: (json['category_breeder_id'] as num?)?.toInt(),
      name: json['name'] as String,
      prefix: json['prefix'] as String,
      cage: json['cage'] as String,
      gender: json['gender'] as String,
      color: json['color'] as String,
      tatto: json['tatto'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      images: json['images'] as List<dynamic>,
      status:
          PedigreeStatusModel.fromJson(json['status'] as Map<String, dynamic>),
      breed: json['breed'] as String?,
    );

Map<String, dynamic> _$PedigreeModelToJson(PedigreeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'uuid': instance.uuid,
      'category_breeder_id': instance.categoryBreederId,
      'name': instance.name,
      'prefix': instance.prefix,
      'cage': instance.cage,
      'gender': instance.gender,
      'color': instance.color,
      'tatto': instance.tatto,
      'breed': instance.breed,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'images': instance.images,
      'status': instance.status,
    };
