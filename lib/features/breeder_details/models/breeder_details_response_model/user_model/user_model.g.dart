// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      planId: (json['plan_id'] as num).toInt(),
      trails: (json['trails'] as num).toInt(),
      roles: (json['roles'] as List<dynamic>)
          .map((e) => UserRoleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      subscriptions: json['subscriptions'] as List<dynamic>,
      plan: PlanModel.fromJson(json['plan'] as Map<String, dynamic>),
      emailVerifiedAt: json['email_verified_at'] == null
          ? null
          : DateTime.parse(json['email_verified_at'] as String),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt?.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'plan_id': instance.planId,
      'trails': instance.trails,
      'roles': instance.roles,
      'subscriptions': instance.subscriptions,
      'plan': instance.plan,
    };
