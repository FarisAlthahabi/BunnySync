// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breeders_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreedersModel _$BreedersModelFromJson(Map<String, dynamic> json) =>
    BreedersModel(
      draw: (json['draw'] as num).toInt(),
      recordsTotal: (json['recordsTotal'] as num).toInt(),
      recordsFiltered: (json['recordsFiltered'] as num).toInt(),
      breeders: (json['data'] as List<dynamic>)
          .map((e) => BreederModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      input: json['input'] as List<dynamic>,
    );

Map<String, dynamic> _$BreedersModelToJson(BreedersModel instance) =>
    <String, dynamic>{
      'draw': instance.draw,
      'recordsTotal': instance.recordsTotal,
      'recordsFiltered': instance.recordsFiltered,
      'data': instance.breeders,
      'input': instance.input,
    };
