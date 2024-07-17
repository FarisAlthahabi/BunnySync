// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breeder_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreederImageModel _$BreederImageModelFromJson(Map<String, dynamic> json) =>
    BreederImageModel(
      id: (json['id'] as num).toInt(),
      breederId: (json['breeder_id'] as num).toInt(),
      path: json['path'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$BreederImageModelToJson(BreederImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'breeder_id': instance.breederId,
      'path': instance.path,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
