import 'dart:convert';

import 'package:bunny_sync/features/profile/model/plan_model/plan_model.dart';
import 'package:bunny_sync/features/profile/model/subscription_model/subscription_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
@immutable
class UserModel {
  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.registeredAt,
    required this.planId,
    required this.trials,
    required this.subscriptions,
    required this.plan,
  });

  factory UserModel.fromJsonStr(String str) =>
      UserModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  final int id;

  final String name;

  final String email;

  @JsonKey(name: 'created_at')
  final DateTime registeredAt;

  @JsonKey(name: 'plan_id')
  final int planId;

  final int trials;

  final List<SubscriptionModel> subscriptions;

  final PlanModel plan;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    DateTime? registeredAt,
    int? planId,
    int? trials,
    List<SubscriptionModel>? subscriptions,
    PlanModel? plan,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      registeredAt: registeredAt ?? this.registeredAt,
      planId: planId ?? this.planId,
      trials: trials ?? this.trials,
      subscriptions: subscriptions ?? this.subscriptions,
      plan: plan ?? this.plan,
    );
  }
}
