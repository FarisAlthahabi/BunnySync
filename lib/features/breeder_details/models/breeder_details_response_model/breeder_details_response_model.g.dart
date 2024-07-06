// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breeder_details_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreederDetailsResponseModel _$BreederDetailsResponseModelFromJson(
        Map<String, dynamic> json) =>
    BreederDetailsResponseModel(
      breeder:
          BreederDetailsModel.fromJson(json['breeder'] as Map<String, dynamic>),
      weight: json['weight'] as String,
      age: json['age'] as String,
      kitsCount: (json['liveKits'] as num).toInt(),
      littersCount: (json['litters'] as num).toInt(),
    );

Map<String, dynamic> _$BreederDetailsResponseModelToJson(
        BreederDetailsResponseModel instance) =>
    <String, dynamic>{
      'breeder': instance.breeder,
      'weight': instance.weight,
      'age': instance.age,
      'liveKits': instance.kitsCount,
      'litters': instance.littersCount,
    };
