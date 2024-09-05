// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breeder_mortality_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreederMortalityModel _$BreederMortalityModelFromJson(
        Map<String, dynamic> json) =>
    BreederMortalityModel(
      name: json['name'] as String,
      age: (json['age'] as num).toDouble(),
      reason: json['reason'] as String,
      deathDate: const DateTimeConverter().fromJson(json['die'] as String?),
      dtRowIndex: (json['DT_RowIndex'] as num).toInt(),
    );

Map<String, dynamic> _$BreederMortalityModelToJson(
        BreederMortalityModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'reason': instance.reason,
      'die': const DateTimeConverter().toJson(instance.deathDate),
      'DT_RowIndex': instance.dtRowIndex,
    };
