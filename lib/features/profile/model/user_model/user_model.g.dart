// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      registeredAt: DateTime.parse(json['created_at'] as String),
      planId: (json['plan_id'] as num).toInt(),
      trials: (json['trials'] as num).toInt(),
      subscriptions: (json['subscriptions'] as List<dynamic>)
          .map((e) => SubscriptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      plan: PlanModel.fromJson(json['plan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'created_at': instance.registeredAt.toIso8601String(),
      'plan_id': instance.planId,
      'trials': instance.trials,
      'subscriptions': instance.subscriptions,
      'plan': instance.plan,
    };
