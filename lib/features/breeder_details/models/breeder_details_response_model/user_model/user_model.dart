import 'dart:convert';

import 'package:bunny_sync/features/breeder_details/models/breeder_details_response_model/plan_model/plan_model.dart';
import 'package:bunny_sync/features/breeder_details/models/breeder_details_response_model/user_role_model.dart/user_role_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user_model.g.dart';

@immutable
@JsonSerializable()
class UserModel {
  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    required this.planId,
    required this.trails,
    required this.roles,
    required this.subscriptions,
    required this.plan,
    this.emailVerifiedAt,
  });

  factory UserModel.fromJsonStr(String str) =>
      UserModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  final int id;

  final String name;

  final String email;

  @JsonKey(name: 'email_verified_at')
  final DateTime? emailVerifiedAt;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @JsonKey(name: 'plan_id')
  final int planId;

  final int trails;

  final List<UserRoleModel> roles;

  final List<dynamic> subscriptions;

  final PlanModel plan;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
