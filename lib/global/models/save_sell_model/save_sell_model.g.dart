// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_sell_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveSellModel _$SaveSellModelFromJson(Map<String, dynamic> json) =>
    SaveSellModel(
      price: (json['price'] as num?)?.toDouble(),
      customerId: (json['customer'] as num?)?.toInt(),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$SaveSellModelToJson(SaveSellModel instance) =>
    <String, dynamic>{
      'price': instance.price,
      'customer': instance.customerId,
      'date': instance.date.toIso8601String(),
    };
