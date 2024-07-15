// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'litter_details_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LitterDetailsResponseModel _$LitterDetailsResponseModelFromJson(
        Map<String, dynamic> json) =>
    LitterDetailsResponseModel(
      litter:
          LitterDetailsModel.fromJson(json['litter'] as Map<String, dynamic>),
      fosterKits: (json['fosterKits'] as List<dynamic>)
          .map((e) => KitModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      age: json['age'] as String,
      totalWeight: (json['totalWeight'] as num).toDouble(),
      averegeWeight: (json['averegeWeight'] as num?)?.toDouble(),
      activeLittersCount: (json['getStatusActive'] as num).toInt(),
      diedLittersCount: (json['getStatusDied'] as num).toInt(),
      survivalRate: (json['survivalRate'] as num).toInt(),
    );

Map<String, dynamic> _$LitterDetailsResponseModelToJson(
        LitterDetailsResponseModel instance) =>
    <String, dynamic>{
      'litter': instance.litter,
      'fosterKits': instance.fosterKits,
      'age': instance.age,
      'totalWeight': instance.totalWeight,
      'averegeWeight': instance.averegeWeight,
      'getStatusActive': instance.activeLittersCount,
      'getStatusDied': instance.diedLittersCount,
      'survivalRate': instance.survivalRate,
    };
