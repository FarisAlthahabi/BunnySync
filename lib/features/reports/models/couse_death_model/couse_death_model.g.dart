// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'couse_death_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouseDeathModel _$CouseDeathModelFromJson(Map<String, dynamic> json) =>
    CouseDeathModel(
      reason:
          (json['reason'] as List<dynamic>).map((e) => e as String).toList(),
      count: (json['count'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$CouseDeathModelToJson(CouseDeathModel instance) =>
    <String, dynamic>{
      'reason': instance.reason,
      'count': instance.count,
    };
