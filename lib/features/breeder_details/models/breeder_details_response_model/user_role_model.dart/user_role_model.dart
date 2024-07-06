import 'dart:convert';

import 'package:bunny_sync/features/breeder_details/models/breeder_details_response_model/pivot_model/pivot_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user_role_model.g.dart';

@immutable
@JsonSerializable()
class UserRoleModel {

  const UserRoleModel({
    required this.id,
    required this.name,
    required this.guardName,
    required this.pivot,
    this.createdAt,
    this.updatedAt,
  });

  factory UserRoleModel.fromJsonStr(String str) =>
      UserRoleModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory UserRoleModel.fromJson(Map<String, dynamic> json) =>
      _$UserRoleModelFromJson(json);

  final int id;

  final String name;

  @JsonKey(name: 'guard_name')
  final String guardName;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  final PivotModel pivot;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$UserRoleModelToJson(this);
}
