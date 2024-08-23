// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreedModel _$BreedModelFromJson(Map<String, dynamic> json) => BreedModel(
      maleBreederId: (json['male'] as num?)?.toInt(),
      femaleBreederId: (json['female'] as num?)?.toInt(),
      breedTimeType: BreedTimeTypes.fromJson(json['type'] as String),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$BreedModelToJson(BreedModel instance) =>
    <String, dynamic>{
      'male': instance.maleBreederId,
      'female': instance.femaleBreederId,
      'type': BreedTimeTypes.toJson(instance.breedTimeType),
      'date': instance.date.toIso8601String(),
    };
