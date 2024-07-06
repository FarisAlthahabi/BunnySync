
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'plan_model.g.dart';

@immutable
@JsonSerializable()
class PlanModel {
  const PlanModel({
    required this.id,
    required this.name,
    required this.monthlyId,
    required this.yearlyId,
    required this.shortDescription,
    required this.features,
    required this.options,
    required this.archived,
    this.createdAt,
    this.updatedAt,
  });

  factory PlanModel.fromJsonStr(String str) =>
      PlanModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory PlanModel.fromJson(Map<String, dynamic> json) =>
      _$PlanModelFromJson(json);

  final int id;

  final String name;

  @JsonKey(name: 'monthly_id')
  final String monthlyId;

  @JsonKey(name: 'yearly_id')
  final String yearlyId;

  @JsonKey(name: 'short_description')
  final String shortDescription;

  final String features;

  final String options;

  final int archived;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$PlanModelToJson(this);
}
