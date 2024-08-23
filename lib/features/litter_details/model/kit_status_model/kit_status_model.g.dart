// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kit_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KitStatusModel _$KitStatusModelFromJson(Map<String, dynamic> json) =>
    KitStatusModel(
      id: (json['id'] as num).toInt(),
      kitId: (json['kit_id'] as num).toInt(),
      status: json['status'] as String,
      isActive: BunnySyncJsonUtils.isActiveFromJson(
          JsonUtils.readValue(json, 'isActive') as Map<String, dynamic>),
      date: const DateTimeConverter().fromJson(json['date'] as String?),
      foster: (json['foster'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      ledgerId: (json['ledger_id'] as num?)?.toInt(),
      reason: json['reason'] as String?,
      weight: (json['weight'] as num?)?.toDouble(),
      preWeight: (json['pre_weight'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$KitStatusModelToJson(KitStatusModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kit_id': instance.kitId,
      'ledger_id': instance.ledgerId,
      'status': instance.status,
      'isActive': instance.isActive,
      'reason': instance.reason,
      'weight': instance.weight,
      'pre_weight': instance.preWeight,
      'date': const DateTimeConverter().toJson(instance.date),
      'foster': instance.foster,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
