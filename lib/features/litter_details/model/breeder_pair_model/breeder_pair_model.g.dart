// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breeder_pair_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreederPairModel _$BreederPairModelFromJson(Map<String, dynamic> json) =>
    BreederPairModel(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      femaleBreederId: (json['female_id'] as num).toInt(),
      maleBreederId: (json['male_id'] as num).toInt(),
      type: json['type'] as String,
      date: const DateTimeConverter().fromJson(json['date'] as String?),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      maleBreeder: json['male'] == null
          ? null
          : BreederEntryModel.fromJson(json['male'] as Map<String, dynamic>),
      femaleBreeder: json['female'] == null
          ? null
          : BreederEntryModel.fromJson(json['female'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BreederPairModelToJson(BreederPairModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'female_id': instance.femaleBreederId,
      'male_id': instance.maleBreederId,
      'type': instance.type,
      'date': const DateTimeConverter().toJson(instance.date),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'male': instance.maleBreeder,
      'female': instance.femaleBreeder,
    };
