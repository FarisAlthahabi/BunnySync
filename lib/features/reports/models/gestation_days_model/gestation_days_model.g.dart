// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gestation_days_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GestationDaysModel _$GestationDaysModelFromJson(Map<String, dynamic> json) =>
    GestationDaysModel(
      breeders:
          (json['breeder'] as List<dynamic>).map((e) => e as String).toList(),
      days: (json['days'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$GestationDaysModelToJson(GestationDaysModel instance) =>
    <String, dynamic>{
      'breeder': instance.breeders,
      'days': instance.days,
    };
