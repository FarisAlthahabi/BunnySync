// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_sell_litter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveSellLitterModel _$SaveSellLitterModelFromJson(Map<String, dynamic> json) =>
    SaveSellLitterModel(
      sellType: _$JsonConverterFromJson<String, bool>(
              json['typeBuy'], const BoolOnOffConverter().fromJson) ??
          true,
      date: const DateTimeConverter().fromJson(json['date'] as String?),
      customerId: (json['customer'] as num?)?.toInt(),
      prices: json['prices'],
    );

Map<String, dynamic> _$SaveSellLitterModelToJson(
        SaveSellLitterModel instance) =>
    <String, dynamic>{
      'typeBuy': const BoolOnOffConverter().toJson(instance.sellType),
      'date': const DateTimeConverter().toJson(instance.date),
      'customer': instance.customerId,
      'prices': SaveSellLitterModel.pricesToJson(instance.prices),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
