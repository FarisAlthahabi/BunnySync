// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doe_cost_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoeCostModel _$DoeCostModelFromJson(Map<String, dynamic> json) => DoeCostModel(
      breeders:
          (json['breeder'] as List<dynamic>).map((e) => e as String).toList(),
      costs: (json['cost'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$DoeCostModelToJson(DoeCostModel instance) =>
    <String, dynamic>{
      'breeder': instance.breeders,
      'cost': instance.costs,
    };
