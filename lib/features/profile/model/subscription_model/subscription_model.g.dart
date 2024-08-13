// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionModel _$SubscriptionModelFromJson(Map<String, dynamic> json) =>
    SubscriptionModel(
      id: (json['id'] as num).toInt(),
      billableId: (json['billable_id'] as num).toInt(),
      billableType: json['billable_type'] as String,
      type: json['type'] as String,
      status: json['status'] as String,
      subscriptionDate: DateTime.parse(json['created_at'] as String),
      subscriptionItems: (json['items'] as List<dynamic>)
          .map((e) => SubscriptionItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isActive: BunnySyncJsonUtils.isActiveFromJson(
          JsonUtils.readValue(json, 'isActive') as Map<String, dynamic>),
      trailEndDate: json['trial_ends_at'] == null
          ? null
          : DateTime.parse(json['trial_ends_at'] as String),
      pausedDate: json['paused_at'] == null
          ? null
          : DateTime.parse(json['paused_at'] as String),
      endDate: json['ends_at'] == null
          ? null
          : DateTime.parse(json['ends_at'] as String),
    );

Map<String, dynamic> _$SubscriptionModelToJson(SubscriptionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'billable_id': instance.billableId,
      'billable_type': instance.billableType,
      'type': instance.type,
      'status': instance.status,
      'trial_ends_at': instance.trailEndDate?.toIso8601String(),
      'paused_at': instance.pausedDate?.toIso8601String(),
      'ends_at': instance.endDate?.toIso8601String(),
      'created_at': instance.subscriptionDate.toIso8601String(),
      'items': instance.subscriptionItems,
      'isActive': instance.isActive,
    };
