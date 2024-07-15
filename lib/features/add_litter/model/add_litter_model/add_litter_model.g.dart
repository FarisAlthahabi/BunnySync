// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_litter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddLitterModel _$AddLitterModelFromJson(Map<String, dynamic> json) =>
    AddLitterModel(
      type: json['type'] as String?,
      maleBreederId: (json['male'] as num?)?.toInt(),
      femaleBreederId: (json['female'] as num?)?.toInt(),
      prefix: json['prefix'] as String?,
      litterId: json['litter_id'] as String?,
      breedDate: json['breed_date'] == null
          ? null
          : DateTime.parse(json['breed_date'] as String),
      bornDate: json['born_date'] == null
          ? null
          : DateTime.parse(json['born_date'] as String),
      breed: json['breed'] as String?,
      cage: json['cage'] as String?,
      liveKits: (json['live_kits'] as num?)?.toInt(),
      deadKits: (json['dead_kits'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddLitterModelToJson(AddLitterModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'male': instance.maleBreederId,
      'female': instance.femaleBreederId,
      'prefix': instance.prefix,
      'litter_id': instance.litterId,
      'breed_date': instance.breedDate?.toIso8601String(),
      'born_date': instance.bornDate?.toIso8601String(),
      'breed': instance.breed,
      'cage': instance.cage,
      'live_kits': instance.liveKits,
      'dead_kits': instance.deadKits,
    };
