import 'dart:convert';

import 'package:bunny_sync/features/add_treatment/model/dosage_per_types/dosage_per_types.dart';
import 'package:bunny_sync/features/add_treatment/model/dosage_types/dosage_types.dart';
import 'package:bunny_sync/features/add_treatment/model/period_types/period_types.dart';
import 'package:bunny_sync/global/utils/json_converters/date_time_converter.dart';
import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'treatment_model.g.dart';

@JsonSerializable()
@immutable
class TreatmentModel implements BottomSheetItemModel {
  const TreatmentModel({
    required this.id,
    required this.userId,
    required this.ailmentId,
    required this.name,
    required this.startDate,
    required this.dosageCount,
    required this.dosageType,
    required this.dosageCountPer,
    required this.dosageTypePer,
    required this.scheduleCount,
    required this.scheduleType,
    required this.withDrawalCount,
    required this.withDrawalType,
    required this.createdAt,
    required this.updatedAt,
    this.note,
    this.medication,
    this.method,
    this.type,
    this.breederId,
    this.kitId,
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

  @DateTimeConverter()
  @JsonKey(name: 'start_date')
  final DateTime startDate;

  @JsonKey(name: 'dosage_count')
  final int dosageCount;

  @JsonKey(
    name: 'dosage_type',
    fromJson: DosageTypes.fromJson,
  )
  final DosageTypes dosageType;

  @JsonKey(name: 'dosage_count_per')
  final int dosageCountPer;

  @JsonKey(
    name: 'dosage_type_per',
    fromJson: DosagePerTypes.fromJson,
  )
  final DosagePerTypes dosageTypePer;

  @JsonKey(name: 'schedule_count')
  final int scheduleCount;

  @JsonKey(
    name: 'schedule_type',
    fromJson: PeriodTypes.fromJson,
  )
  final PeriodTypes scheduleType;

  @JsonKey(name: 'withdrawal_count')
  final int withDrawalCount;

  @JsonKey(
    name: 'widthdrawal_type',
    fromJson: PeriodTypes.fromJson,
  )
  final PeriodTypes withDrawalType;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  final String? note;

  final String? medication;

  final String? method;

  final String? type;

  @JsonKey(name: 'breeder_id')
  final int? breederId;

  @JsonKey(name: 'kit_id')
  final int? kitId;

  @JsonKey(name: 'rabbit')
  final String? rabbitName;

  final String? ailment;

  final String? symptoms;

  @JsonKey(name: 'DT_RowIndex')
  final int? dtRowIndex;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$TreatmentModelToJson(this);
}
