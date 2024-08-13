import 'dart:convert';

import 'package:bunny_sync/global/utils/bunny_sync_json_utils.dart';
import 'package:bunny_sync/global/utils/json_utils.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subscription_item_model.g.dart';

@JsonSerializable()
@immutable
class SubscriptionItemModel {
  const SubscriptionItemModel({
    required this.id,
    required this.subscriptionId,
    required this.productId,
    required this.priceId,
    required this.status,
    required this.quantity,
    required this.subscriptionDate,
    required this.isActive,
  });

  factory SubscriptionItemModel.fromJsonStr(String str) =>
      SubscriptionItemModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory SubscriptionItemModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionItemModelFromJson(json);

  final int id;

  @JsonKey(name: 'subscription_id')
  final int subscriptionId;

  @JsonKey(name: 'product_id')
  final String productId;

  @JsonKey(name: 'price_id')
  final String priceId;

  final String status;

  final int quantity;

  @JsonKey(name: 'created_at')
  final DateTime subscriptionDate;

  @JsonKey(
    fromJson: BunnySyncJsonUtils.isActiveFromJson,
    readValue: JsonUtils.readValue,
  )
  final bool isActive;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$SubscriptionItemModelToJson(this);
}
