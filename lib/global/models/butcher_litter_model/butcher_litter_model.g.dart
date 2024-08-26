// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'butcher_litter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ButcherLitterModel _$ButcherLitterModelFromJson(Map<String, dynamic> json) =>
    ButcherLitterModel(
      butcherType: _$JsonConverterFromJson<String, bool>(
              json['typeButcher'], const BoolOnOffConverter().fromJson) ??
          true,
      date: const DateTimeConverter().fromJson(json['date'] as String?),
      preWeight: json['preWeight'],
      weight: json['weight'],
      price: json['price'],
    );

Map<String, dynamic> _$ButcherLitterModelToJson(ButcherLitterModel instance) =>
    <String, dynamic>{
      'typeButcher': const BoolOnOffConverter().toJson(instance.butcherType),
      'date': const DateTimeConverter().toJson(instance.date),
      'price': ButcherLitterModel.valueToJson(instance.price),
      'preWeight': ButcherLitterModel.valueToJson(instance.preWeight),
      'weight': ButcherLitterModel.valueToJson(instance.weight),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
