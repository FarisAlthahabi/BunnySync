import 'dart:convert';

import 'package:bunny_sync/features/profile/model/options_model/options_model.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'plan_model.g.dart';

@JsonSerializable()
@immutable
class PlanModel {
  const PlanModel({
    required this.id,
    required this.name,
    required this.monthlyId,
    required this.yearlyId,
    required this.description,
    required this.features,
    required this.options,
    required this.archived,
    this.chooseDate,
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
  final String description;

  // @JsonKey(
  //   fromJson: BunnySyncJsonUtils.featuresFromJson,
  //   readValue: JsonUtils.readValue,
  // )
  final List<String> features;

  // @JsonKey(
  //   fromJson: BunnySyncJsonUtils.optionsFromJson,
  //   readValue: JsonUtils.readValue,
  // )
  final OptionsModel options;

  final int archived;

  @JsonKey(name: 'created_at')
  final DateTime? chooseDate;

   String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$PlanModelToJson(this);

}
