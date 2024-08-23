// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_butcher_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveButcherModel _$SaveButcherModelFromJson(Map<String, dynamic> json) =>
    SaveButcherModel(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      preWeight: (json['preWeight'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
      price: (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SaveButcherModelToJson(SaveButcherModel instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'preWeight': instance.preWeight,
      'weight': instance.weight,
      'price': instance.price,
    };
