// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataStatusModel _$DataStatusModelFromJson(Map<String, dynamic> json) =>
    DataStatusModel(
      active: (json['active'] as num).toInt(),
      died: (json['died'] as num).toInt(),
      kitBreeder: (json['kitBreeder'] as num).toInt(),
      sold: (json['sold'] as num).toInt(),
      cull: (json['cull'] as num).toInt(),
      archive: (json['archive'] as num).toInt(),
      butcher: (json['butcher'] as num).toInt(),
    );

Map<String, dynamic> _$DataStatusModelToJson(DataStatusModel instance) =>
    <String, dynamic>{
      'active': instance.active,
      'died': instance.died,
      'kitBreeder': instance.kitBreeder,
      'sold': instance.sold,
      'cull': instance.cull,
      'archive': instance.archive,
      'butcher': instance.butcher,
    };
