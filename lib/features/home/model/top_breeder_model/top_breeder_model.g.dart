// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_breeder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopBreederModel _$TopBreederModelFromJson(Map<String, dynamic> json) =>
    TopBreederModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      live: (json['live'] as num).toInt(),
      image: BunnySyncJsonUtils.setBreedersFileUrlFromJson(
          JsonUtils.readValue(json, 'image') as Map<String, dynamic>),
    );

Map<String, dynamic> _$TopBreederModelToJson(TopBreederModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'live': instance.live,
      'image': instance.image,
    };
