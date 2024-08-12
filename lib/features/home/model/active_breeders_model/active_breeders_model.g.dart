// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_breeders_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveBreedersModel _$ActiveBreedersModelFromJson(Map<String, dynamic> json) =>
    ActiveBreedersModel(
      maleBreedersCount: (json['male'] as num).toInt(),
      femaleBreedersCount: (json['female'] as num).toInt(),
      allBreedersCount: (json['breeders'] as num).toInt(),
    );

Map<String, dynamic> _$ActiveBreedersModelToJson(
        ActiveBreedersModel instance) =>
    <String, dynamic>{
      'male': instance.maleBreedersCount,
      'female': instance.femaleBreedersCount,
      'breeders': instance.allBreedersCount,
    };
