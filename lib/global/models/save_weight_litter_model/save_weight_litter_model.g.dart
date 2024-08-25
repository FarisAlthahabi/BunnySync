// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_weight_litter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveWeightLitterModel _$SaveWeightLitterModelFromJson(
        Map<String, dynamic> json) =>
    SaveWeightLitterModel(
      weightType: _$JsonConverterFromJson<String, bool>(
              json['typeWeigh'], const BoolOnOffConverter().fromJson) ??
          true,
      date: const DateTimeConverter().fromJson(json['date'] as String?),
      weights: json['weights'],
    );

Map<String, dynamic> _$SaveWeightLitterModelToJson(
        SaveWeightLitterModel instance) =>
    <String, dynamic>{
      'typeWeigh': const BoolOnOffConverter().toJson(instance.weightType),
      'date': const DateTimeConverter().toJson(instance.date),
      'weights': SaveWeightLitterModel.weightsToJson(instance.weights),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
