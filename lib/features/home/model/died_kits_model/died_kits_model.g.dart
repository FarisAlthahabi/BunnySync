// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'died_kits_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiedKitsModel _$DiedKitsModelFromJson(Map<String, dynamic> json) =>
    DiedKitsModel(
      diedKitsCount: (json['died'] as num).toInt(),
      cullKitsCount: (json['cull'] as num).toInt(),
      soldKitsCount: (json['sold'] as num).toInt(),
    );

Map<String, dynamic> _$DiedKitsModelToJson(DiedKitsModel instance) =>
    <String, dynamic>{
      'died': instance.diedKitsCount,
      'cull': instance.cullKitsCount,
      'sold': instance.soldKitsCount,
    };
