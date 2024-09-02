// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weight_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeightPostModel _$WeightPostModelFromJson(Map<String, dynamic> json) =>
    WeightPostModel(
      weightType: _$JsonConverterFromJson<String, bool>(
          json['typeWeigh'], const BoolOnOffConverter().fromJson),
      date: const DateTimeConverter().fromJson(json['date'] as String?),
      weights: (json['weights'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      weight: (json['weight'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WeightPostModelToJson(WeightPostModel instance) =>
    <String, dynamic>{
      'typeWeigh': const BoolOnOffConverter().toJson(instance.weightType),
      'date': const DateTimeConverter().toJson(instance.date),
      'weights': WeightPostModel.weightsToJson(instance.weights),
      'weight': instance.weight,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
