// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatusModel _$StatusModelFromJson(Map<String, dynamic> json) => StatusModel(
      id: (json['id'] as num).toInt(),
      breederId: (json['breeder_id'] as num).toInt(),
      status: json['status'] as String,
      date: DateTime.parse(json['date'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      ledgerId: (json['ledger_id'] as num?)?.toInt(),
      reason: json['reason'] as String?,
      preWeight: (json['pre_weight'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$StatusModelToJson(StatusModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'breeder_id': instance.breederId,
      'ledger_id': instance.ledgerId,
      'status': instance.status,
      'reason': instance.reason,
      'pre_weight': instance.preWeight,
      'weight': instance.weight,
      'date': instance.date.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
