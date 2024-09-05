// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cause_death_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CauseDeathModel _$CauseDeathModelFromJson(Map<String, dynamic> json) =>
    CauseDeathModel(
      reason:
          (json['reason'] as List<dynamic>).map((e) => e as String).toList(),
      count: (json['count'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$CauseDeathModelToJson(CauseDeathModel instance) =>
    <String, dynamic>{
      'reason': instance.reason,
      'count': instance.count,
    };
