// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_add_breeder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostAddBreederModel _$PostAddBreederModelFromJson(Map<String, dynamic> json) =>
    PostAddBreederModel(
      name: json['name'] as String?,
      prefix: json['prefix'] as String?,
      cage: json['cage'] as String?,
      gender: json['gender'] as String?,
      color: json['color'] as String?,
      tatto: json['tatto'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      weight: (json['weight'] as num?)?.toDouble(),
      breed: json['breed'] as String?,
    );

Map<String, dynamic> _$PostAddBreederModelToJson(
        PostAddBreederModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'prefix': instance.prefix,
      'cage': instance.cage,
      'gender': instance.gender,
      'color': instance.color,
      'date': instance.date.toIso8601String(),
      'tatto': instance.tatto,
      'breed': instance.breed,
      'weight': instance.weight,
    };
