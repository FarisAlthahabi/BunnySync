// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pedigree_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PedigreeStatusModel _$PedigreeStatusModelFromJson(Map<String, dynamic> json) =>
    PedigreeStatusModel(
      breederId: (json['breeder_id'] as num).toInt(),
      status: json['status'] as String,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$PedigreeStatusModelToJson(
        PedigreeStatusModel instance) =>
    <String, dynamic>{
      'breeder_id': instance.breederId,
      'status': instance.status,
      'reason': instance.reason,
    };
