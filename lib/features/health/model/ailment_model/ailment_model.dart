import 'dart:convert';

import 'package:bunny_sync/features/health/model/treatment_model/treatment_model.dart';
import 'package:bunny_sync/global/utils/json_converters/date_parser.dart';
import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ailment_model.g.dart';

@JsonSerializable()
@immutable
class AilmentModel implements BottomSheetItemModel, DropDownItemModel {
  const AilmentModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.symptoms,
    required this.startDate,
    required this.note,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.treatments,
    this.breederId,
    this.kitId,
    this.rabbitName,
    this.dtRowIndex,
  });

  factory AilmentModel.fromJsonStr(String str) =>
      AilmentModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory AilmentModel.fromJson(Map<String, dynamic> json) =>
      _$AilmentModelFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'breeder_id')
  final int? breederId;

  @JsonKey(name: 'kit_id')
  final int? kitId;

  @JsonKey(name: 'user_id')
  final int userId;

  @override
  final String name;

  final String symptoms;

  @DateParser()
  @JsonKey(name: 'start_date')
  final DateTime startDate;

  final String note;

  final String status;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @JsonKey(name: 'rabbit')
  final String? rabbitName;

  final List<TreatmentModel>? treatments;

  @JsonKey(name: 'DT_RowIndex')
  final int? dtRowIndex;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$AilmentModelToJson(this);
}
