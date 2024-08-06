import 'dart:convert';

import 'package:bunny_sync/global/utils/enums/answer_types_enum.dart';
import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cage_model.g.dart';

@JsonSerializable()
@immutable
class CageModel implements BottomSheetItemModel {
  const CageModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.type,
    required this.size,
    required this.orientation,
    required this.hole,
    required this.settings,
    required this.createdAt,
    required this.updatedAt,
    this.table,
    this.settingsTable,
    this.dtRowIndex,
  });

  factory CageModel.fromJsonStr(String str) =>
      CageModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory CageModel.fromJson(Map<String, dynamic> json) =>
      _$CageModelFromJson(json);

  final int id;

  @JsonKey(name: 'user_id')
  final int userId;

  final String name;

  final String type;

  final String size;

  final String orientation;

  @JsonKey(
    fromJson: AnswerTypes.fromJson,
    toJson: AnswerTypes.toJson,
  )
  final AnswerTypes hole;

  final String settings;

  final int? table;

  @JsonKey(name: 'settings_table')
  final int? settingsTable;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @JsonKey(name: 'DT_RowIndex')
  final int? dtRowIndex;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$CageModelToJson(this);
}
