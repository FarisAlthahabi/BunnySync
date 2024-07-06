
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'status_model.g.dart';

@JsonSerializable()
@immutable
class StatusModel {
  const StatusModel({
    required this.id,
    required this.breederId,
    required this.status,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
    this.ledgerId,
    this.reason,
    this.preWeight,
    this.weight,
  });

  factory StatusModel.fromJsonStr(String str) =>
      StatusModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory StatusModel.fromJson(Map<String, dynamic> json) =>
      _$StatusModelFromJson(json);

  final int id;

  @JsonKey(name: 'breeder_id')
  final int breederId;

  @JsonKey(name: 'ledger_id')
  final int? ledgerId;

  final String status;

  final String? reason;

  @JsonKey(name: 'pre_weight')
  final double? preWeight;

  final double? weight;

  final DateTime date;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$StatusModelToJson(this);
}
