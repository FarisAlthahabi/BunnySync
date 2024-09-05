// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_and_dead_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveAndDeadModel _$LiveAndDeadModelFromJson(Map<String, dynamic> json) =>
    LiveAndDeadModel(
      breeders:
          (json['breeder'] as List<dynamic>).map((e) => e as String).toList(),
      live: (json['live'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      died: (json['died'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$LiveAndDeadModelToJson(LiveAndDeadModel instance) =>
    <String, dynamic>{
      'breeder': instance.breeders,
      'live': instance.live,
      'died': instance.died,
    };
