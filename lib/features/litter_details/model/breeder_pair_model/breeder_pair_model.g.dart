// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breeder_pair_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreederPairModel _$BreederPairModelFromJson(Map<String, dynamic> json) =>
    BreederPairModel(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      femailBreederId: (json['female_id'] as num).toInt(),
      mailBreederId: (json['male_id'] as num).toInt(),
      type: json['type'] as String,
      date: DateTime.parse(json['date'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      maleBreeder:
          BreederEntryModel.fromJson(json['male'] as Map<String, dynamic>),
      femaleBreeder:
          BreederEntryModel.fromJson(json['female'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BreederPairModelToJson(BreederPairModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'female_id': instance.femailBreederId,
      'male_id': instance.mailBreederId,
      'type': instance.type,
      'date': instance.date.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'male': instance.maleBreeder,
      'female': instance.femaleBreeder,
    };
