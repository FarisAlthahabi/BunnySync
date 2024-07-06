// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weights_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeightsModel _$WeightsModelFromJson(Map<String, dynamic> json) => WeightsModel(
      id: (json['id'] as num).toInt(),
      breederId: (json['breeder_id'] as num).toInt(),
      weight: (json['weight'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$WeightsModelToJson(WeightsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'breeder_id': instance.breederId,
      'weight': instance.weight,
      'date': instance.date.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
