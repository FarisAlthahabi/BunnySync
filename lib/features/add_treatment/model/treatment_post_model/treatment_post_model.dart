import 'dart:convert';

import 'package:bunny_sync/features/add_treatment/model/dosage_per_types/dosage_per_types.dart';
import 'package:bunny_sync/features/add_treatment/model/dosage_types/dosage_types.dart';
import 'package:bunny_sync/features/add_treatment/model/period_types/period_types.dart';
import 'package:bunny_sync/global/utils/json_converters/date_time_converter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'treatment_post_model.g.dart';

@JsonSerializable()
@immutable
class TreatmentPostModel {
  const TreatmentPostModel({
    this.breederId,
    this.kitId,
    int? ailmentId,
    String? title,
    DateTime? startDate,
    this.medication,
    this.method,
    this.type,
    int? dosageCount,
    DosageTypes? dosageType,
    int? dosageCountPer,
    DosagePerTypes? dosageTypePer,
    int? scheduleCount,
    PeriodTypes? scheduleType,
    int? withDrawalCount,
    PeriodTypes? withDrawalType,
    this.note,
  })  : _ailmentId = ailmentId,
        _title = title,
        _startDate = startDate,
        _dosageCount = dosageCount,
        _dosageType = dosageType,
        _dosageCountPer = dosageCountPer,
        _dosageTypePer = dosageTypePer,
        _scheduleCount = scheduleCount,
        _scheduleType = scheduleType,
        _withDrawalCount = withDrawalCount,
        _withDrawalType = withDrawalType;

  factory TreatmentPostModel.fromJsonStr(String str) =>
      TreatmentPostModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory TreatmentPostModel.fromJson(Map<String, dynamic> json) =>
      _$TreatmentPostModelFromJson(json);

  @JsonKey(name: 'breeder')
  final int? breederId;

  @JsonKey(name: 'kits')
  final int? kitId;

  final int? _ailmentId;

  final String? _title;

  final DateTime? _startDate;

  final String? medication;

  final String? method;

  final String? type;

  final int? _dosageCount;

  final DosageTypes? _dosageType;

  final int? _dosageCountPer;

  final DosagePerTypes? _dosageTypePer;

  final int? _scheduleCount;

  final PeriodTypes? _scheduleType;

  final int? _withDrawalCount;

  final PeriodTypes? _withDrawalType;

  final String? note;

  TreatmentPostModel copyWith({
    int? Function()? breederId,
    int? Function()? kitId,
    int? Function()? ailmentId,
    String? Function()? title,
    DateTime? Function()? startDate,
    String? Function()? medication,
    String? Function()? method,
    String? Function()? type,
    int? Function()? dosageCount,
    DosageTypes? Function()? dosageType,
    int? Function()? dosageCountPer,
    DosagePerTypes? Function()? dosageTypePer,
    int? Function()? scheduleCount,
    PeriodTypes? Function()? scheduleType,
    int? Function()? withDrawalCount,
    PeriodTypes? Function()? withDrawalType,
    String? Function()? note,
  }) {
    return TreatmentPostModel(
      breederId: breederId != null ? breederId() : this.breederId,
      kitId: kitId != null ? kitId() : this.kitId,
      ailmentId: ailmentId != null ? ailmentId() : _ailmentId,
      title: title != null ? title() : _title,
      startDate: startDate != null ? startDate() : _startDate,
      method: method != null ? method() : this.method,
      medication: medication != null ? medication() : this.medication,
      type: type != null ? type() : this.type,
      dosageCount: dosageCount != null ? dosageCount() : _dosageCount,
      dosageType: dosageType != null ? dosageType() : _dosageType,
      dosageCountPer:
          dosageCountPer != null ? dosageCountPer() : _dosageCountPer,
      dosageTypePer: dosageTypePer != null ? dosageTypePer() : _dosageTypePer,
      scheduleCount: scheduleCount != null ? scheduleCount() : _scheduleCount,
      scheduleType: scheduleType != null ? scheduleType() : _scheduleType,
      withDrawalCount:
          withDrawalCount != null ? withDrawalCount() : _withDrawalCount,
      withDrawalType:
          withDrawalType != null ? withDrawalType() : _withDrawalType,
      note: note != null ? note() : this.note,
    );
  }

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$TreatmentPostModelToJson(this);

  @JsonKey(name: 'ailments')
  int? get ailmentId {
    return _ailmentId ?? (throw "Ailment can't be empty");
  }

  String? get title {
    return _title ?? (throw "Treatments can't be empty");
  }

  @DateTimeConverter()
  @JsonKey(name: 'start_date')
  DateTime? get startDate {
    return _startDate ?? (throw "Start Date can't be empty");
  }

  @JsonKey(name: 'dosage_count')
  int get dosageCount {
    return _dosageCount ?? (throw "Dosage Count can't be empty");
  }

  @JsonKey(name: 'dosage_type')
  DosageTypes get dosageType =>
      _dosageType ?? (throw "Dosage Type can't be empty");

  @JsonKey(name: 'dosage_count_per')
  int get dosageCountPer {
    return _dosageCountPer ?? (throw "Dosage Count Per can't be empty");
  }

  @JsonKey(name: 'dosage_type_per')
  DosagePerTypes get dosageTypePer =>
      _dosageTypePer ?? (throw "Dosage Type Per can't be empty");

  @JsonKey(name: 'schedule_count')
  int get scheduleCount {
    return _scheduleCount ?? (throw "Schedule Count can't be empty");
  }

  @JsonKey(name: 'schedule_type')
  PeriodTypes get scheduleType =>
      _scheduleType ?? (throw "Schedule Type can't be empty");

  @JsonKey(name: 'withdrawal_count')
  int get withDrawalCount {
    return _withDrawalCount ?? (throw "Withdrawal Count can't be empty");
  }

  @JsonKey(name: 'widthdrawal_type')
  PeriodTypes get withDrawalType =>
      _withDrawalType ?? (throw "Withdrawal Type can't be empty");
}
