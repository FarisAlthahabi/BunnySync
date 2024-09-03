// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kit_mortality_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KitMortalityModel _$KitMortalityModelFromJson(Map<String, dynamic> json) =>
    KitMortalityModel(
      maleBreederName: json['breeder_male'] as String,
      maleBreederId: (json['breeder_male_id'] as num).toInt(),
      femaleBreederName: json['breeder_female'] as String,
      femaleBreederId: (json['breeder_female_id'] as num).toInt(),
      litterName: json['litter_name'] as String,
      litterId: (json['litter_id'] as num).toInt(),
      kitName: json['kit_name'] as String,
      updatedAt: DateTime.parse(json['updated_at'] as String),
      reason: json['reason'] as String,
      deathDate: const DateTimeConverter().fromJson(json['die'] as String?),
      dtRowIndex: (json['DT_RowIndex'] as num).toInt(),
    );

Map<String, dynamic> _$KitMortalityModelToJson(KitMortalityModel instance) =>
    <String, dynamic>{
      'breeder_male': instance.maleBreederName,
      'breeder_male_id': instance.maleBreederId,
      'breeder_female': instance.femaleBreederName,
      'breeder_female_id': instance.femaleBreederId,
      'litter_name': instance.litterName,
      'litter_id': instance.litterId,
      'kit_name': instance.kitName,
      'updated_at': instance.updatedAt.toIso8601String(),
      'reason': instance.reason,
      'die': const DateTimeConverter().toJson(instance.deathDate),
      'DT_RowIndex': instance.dtRowIndex,
    };
