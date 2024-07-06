import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'pivot_model.g.dart';

@immutable
@JsonSerializable()

class PivotModel {
  const PivotModel({
    required this.userId,
    required this.roleId,
  });

  factory PivotModel.fromJsonStr(String str) =>
      PivotModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory PivotModel.fromJson(Map<String, dynamic> json) =>
      _$PivotModelFromJson(json);

  @JsonKey(name: 'user_id')
  final int userId;

  @JsonKey(name: 'role_id')
  final int roleId;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$PivotModelToJson(this);
}
