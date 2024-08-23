import 'dart:convert';

import 'package:bunny_sync/global/utils/bunny_sync_json_utils.dart';
import 'package:bunny_sync/global/utils/json_converters/date_time_converter.dart';
import 'package:bunny_sync/global/utils/json_utils.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kit_status_model.g.dart';

@JsonSerializable()
@immutable
class KitStatusModel {
  const KitStatusModel({
    required this.id,
    required this.kitId,
    required this.status,
    required this.isActive,
    required this.date,
    required this.foster,
    required this.createdAt,
    required this.updatedAt,
    this.ledgerId,
    this.reason,
    this.weight,
    this.preWeight,
  });

  factory KitStatusModel.fromJsonStr(String str) =>
      KitStatusModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory KitStatusModel.fromJson(Map<String, dynamic> json) =>
      _$KitStatusModelFromJson(json);

  final int id;

  @JsonKey(name: 'kit_id')
  final int kitId;

  @JsonKey(name: 'ledger_id')
  final int? ledgerId;

  final String status;

  @JsonKey(
    fromJson: BunnySyncJsonUtils.isActiveFromJson,
    readValue: JsonUtils.readValue,
  )
  final bool isActive;

  final String? reason;

  final double? weight;

  @JsonKey(name: 'pre_weight')
  final double? preWeight;

  @DateTimeConverter()
  final DateTime date;

  final int foster;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$KitStatusModelToJson(this);
}
