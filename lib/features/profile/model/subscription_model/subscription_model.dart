import 'dart:convert';

import 'package:bunny_sync/features/profile/model/subscription_item_model/subscription_item_model.dart';
import 'package:bunny_sync/global/utils/bunny_sync_json_utils.dart';
import 'package:bunny_sync/global/utils/json_utils.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subscription_model.g.dart';

@JsonSerializable()
@immutable
class SubscriptionModel {
  const SubscriptionModel({
    required this.id,
    required this.billableId,
    required this.billableType,
    required this.type,
    required this.status,
    required this.subscriptionDate,
    required this.subscriptionItems,
    required this.isActive,
    this.trailEndDate,
    this.pausedDate,
    this.endDate,
  });

  factory SubscriptionModel.fromJsonStr(String str) =>
      SubscriptionModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionModelFromJson(json);

  final int id;

  @JsonKey(name: 'billable_id')
  final int billableId;

  @JsonKey(name: 'billable_type')
  final String billableType;

  final String type;

  final String status;

  @JsonKey(name: 'trial_ends_at')
  final DateTime? trailEndDate;

  @JsonKey(name: 'paused_at')
  final DateTime? pausedDate;

  @JsonKey(name: 'ends_at')
  final DateTime? endDate;

  @JsonKey(name: 'created_at')
  final DateTime subscriptionDate;

  @JsonKey(name: 'items')
  final List<SubscriptionItemModel> subscriptionItems;

  @JsonKey(
    fromJson: BunnySyncJsonUtils.isActiveFromJson,
    readValue: JsonUtils.readValue,
  )
  final bool isActive;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$SubscriptionModelToJson(this);
}
