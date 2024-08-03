import 'dart:convert';

import 'package:bunny_sync/global/utils/json_converters/date_parser.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_model.g.dart';

@JsonSerializable()
@immutable
class TaskModel {
  const TaskModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.startDate,
    required this.dueDate,
    required this.type,
    required this.recurring,
    required this.note,
    required this.createdAt,
    required this.updatedAt,
    this.breedPairId,
    this.status,
    this.breederId,
    this.litterId,
    this.who,
    this.dtRowIndex,
  });

  factory TaskModel.fromJsonStr(String str) =>
      TaskModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  final int id;

  @JsonKey(name: 'user_id')
  final int userId;

  @JsonKey(name: 'breeder_id')
  final int? breederId;

  @JsonKey(name: 'litter_id')
  final int? litterId;

  @JsonKey(name: 'breed_pair_id')
  final int? breedPairId;

  final String name;

  final String? status;

  @JsonKey(name: 'start_date')
  final DateTime startDate;

  @DateParser()
  @JsonKey(name: 'due_date')
  final DateTime dueDate;

  final String type;

  final String recurring;

  final String note;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  final String? who;

  @JsonKey(name: 'DT_RowIndex')
  final int? dtRowIndex;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);
}
