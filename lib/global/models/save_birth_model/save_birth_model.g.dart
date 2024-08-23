// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_birth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveBirthModel _$SaveBirthModelFromJson(Map<String, dynamic> json) =>
    SaveBirthModel(
      breederPairId: (json['breederPair'] as num?)?.toInt(),
      litterId: json['litter_id'] as String?,
      liveKits: (json['live_kits'] as num?)?.toInt(),
      deadKits: (json['dead_kits'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SaveBirthModelToJson(SaveBirthModel instance) =>
    <String, dynamic>{
      'breederPair': instance.breederPairId,
      'litter_id': instance.litterId,
      'live_kits': instance.liveKits,
      'dead_kits': instance.deadKits,
    };
