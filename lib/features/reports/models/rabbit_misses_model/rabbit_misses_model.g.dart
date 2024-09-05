// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rabbit_misses_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RabbitMissesModel _$RabbitMissesModelFromJson(Map<String, dynamic> json) =>
    RabbitMissesModel(
      breeders:
          (json['breeder'] as List<dynamic>).map((e) => e as String).toList(),
      missed: (json['missed'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$RabbitMissesModelToJson(RabbitMissesModel instance) =>
    <String, dynamic>{
      'breeder': instance.breeders,
      'missed': instance.missed,
    };
