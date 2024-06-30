// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_breeder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewBreederModel _$NewBreederModelFromJson(Map<String, dynamic> json) =>
    NewBreederModel(
      user_id: (json['user_id'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      category_breeder_id: (json['category_breeder_id'] as num?)?.toInt(),
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      prefix: json['prefix'] as String,
      cage: json['cage'] as String,
      gender: json['gender'] as String,
      color: json['color'] as String,
      tatto: json['tatto'] as String,
      breed: json['breed'] as String,
      updated_at: DateTime.parse(json['updated_at'] as String),
      created_at: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$NewBreederModelToJson(NewBreederModel instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'id': instance.id,
      'category_breeder_id': instance.category_breeder_id,
      'uuid': instance.uuid,
      'name': instance.name,
      'prefix': instance.prefix,
      'cage': instance.cage,
      'gender': instance.gender,
      'color': instance.color,
      'tatto': instance.tatto,
      'breed': instance.breed,
      'updated_at': instance.updated_at.toIso8601String(),
      'created_at': instance.created_at.toIso8601String(),
    };
