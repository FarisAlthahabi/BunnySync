// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'butcher_litter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ButcherLitterModel _$ButcherLitterModelFromJson(Map<String, dynamic> json) =>
    ButcherLitterModel(
      butcherType: _$JsonConverterFromJson<String, bool>(
          json['typeButcher'], const BoolOnOffConverter().fromJson),
      date: const DateTimeConverter().fromJson(json['date'] as String?),
      preWeight: (json['preWeight'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
      price: (json['price'] as num?)?.toDouble(),
      preWeights: json['preWeights'] as Map<String, dynamic>?,
      weights: json['weights'] as Map<String, dynamic>?,
      prices: json['prices'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ButcherLitterModelToJson(ButcherLitterModel instance) =>
    <String, dynamic>{
      'typeButcher': const BoolOnOffConverter().toJson(instance.butcherType),
      'date': const DateTimeConverter().toJson(instance.date),
      'price': instance.price,
      'preWeight': instance.preWeight,
      'weight': instance.weight,
      'prices': ButcherLitterModel.mapToJson(instance.prices),
      'preWeights': ButcherLitterModel.mapToJson(instance.preWeights),
      'weights': ButcherLitterModel.mapToJson(instance.weights),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
