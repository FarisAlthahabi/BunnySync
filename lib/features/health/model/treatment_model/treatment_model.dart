import 'dart:convert';

import 'package:bunny_sync/global/utils/json_converters/date_parser.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'treatment_model.g.dart';

@JsonSerializable()
@immutable
class TreatmentModel {
  const TreatmentModel({
    required this.id,
    required this.userId,
    required this.ailmentId,
    required this.name,
    required this.startDate,
    required this.medication,
    required this.method,
    required this.type,
    required this.dosageCount,
    required this.dosageType,
    required this.dosageCountPer,
    required this.dosageTypePer,
    required this.scheduleCount,
    required this.scheduleType,
    required this.withDrawalCount,
    required this.withDrawalType,
    required this.note,
    required this.createdAt,
    required this.updatedAt,
    this.rabbitName,
    this.ailment,
    this.symptoms,
    this.dtRowIndex,
  });

  factory TreatmentModel.fromJsonStr(String str) =>
      TreatmentModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory TreatmentModel.fromJson(Map<String, dynamic> json) =>
      _$TreatmentModelFromJson(json);

  final int id;

  @JsonKey(name: 'user_id')
  final int userId;

  @JsonKey(name: 'ailment_id')
  final int ailmentId;

  final String name;

  @DateParser()
  @JsonKey(name: 'start_date')
  final DateTime startDate;

  final String medication;

  final String method;

  final String type;

   @JsonKey(name: 'dosage_count')
  final int dosageCount;

   @JsonKey(name: 'dosage_type')
  final String dosageType;

   @JsonKey(name: 'dosage_count_per')
  final int dosageCountPer;

   @JsonKey(name: 'dosage_type_per')
  final String dosageTypePer;

   @JsonKey(name: 'schedule_count')
  final int scheduleCount;

  @JsonKey(name: 'schedule_type')
  final String scheduleType;

  @JsonKey(name: 'withdrawal_count')
  final int withDrawalCount;

  @JsonKey(name: 'withdrawal_type')
  final String withDrawalType;

  final String note;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @JsonKey(name: 'rabbit')
  final String? rabbitName;

  final String? ailment;

  final String? symptoms;

  @JsonKey(name: 'DT_RowIndex')
  final int? dtRowIndex;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$TreatmentModelToJson(this);
}
