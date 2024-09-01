// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survival_rate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurvivalRateModel _$SurvivalRateModelFromJson(Map<String, dynamic> json) =>
    SurvivalRateModel(
      breeders:
          (json['breeder'] as List<dynamic>).map((e) => e as String).toList(),
      count: (json['count'] as List<dynamic>)
          .map((e) => const DoubleConverter().fromJson(e as String))
          .toList(),
    );

Map<String, dynamic> _$SurvivalRateModelToJson(SurvivalRateModel instance) =>
    <String, dynamic>{
      'breeder': instance.breeders,
      'count': instance.count.map(const DoubleConverter().toJson).toList(),
    };
