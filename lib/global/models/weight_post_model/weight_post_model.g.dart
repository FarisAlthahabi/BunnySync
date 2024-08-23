// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weight_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeightPostModel _$WeightPostModelFromJson(Map<String, dynamic> json) =>
    WeightPostModel(
      weight: (json['weight'] as num?)?.toDouble(),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$WeightPostModelToJson(WeightPostModel instance) =>
    <String, dynamic>{
      'weight': instance.weight,
      'date': instance.date.toIso8601String(),
    };
