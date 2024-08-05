import 'dart:convert';

import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/utils/json_converters/date_parser.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'treatment_post_model.g.dart';

@JsonSerializable()
@immutable
class TreatmentPostModel {
  const TreatmentPostModel({
    int? ailmentId,
    String? title,
    DateTime? startDate,
    String? medication,
    String? method,
    String? type,
    int? dosageCount,
    String? dosageType,
    int? dosageCountPer,
    String? dosageTypePer,
    int? scheduleCount,
    String? scheduleType,
    int? withDrawalCount,
    String? withDrawalType,
    String? note,
  })  : _ailmentId = ailmentId,
        _title = title,
        _startDate = startDate,
        _medication = medication,
        _method = method,
        _type = type,
        _dosageCount = dosageCount,
        _dosageType = dosageType,
        _dosageCountPer = dosageCountPer,
        _dosageTypePer = dosageTypePer,
        _scheduleCount = scheduleCount,
        _scheduleType = scheduleType,
        _withDrawalCount = withDrawalCount,
        _withDrawalType = withDrawalType,
        _note = note;

  factory TreatmentPostModel.fromJsonStr(String str) =>
      TreatmentPostModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory TreatmentPostModel.fromJson(Map<String, dynamic> json) =>
      _$TreatmentPostModelFromJson(json);

  final int? _ailmentId;

  final String? _title;

  final DateTime? _startDate;

  final String? _medication;

  final String? _method;

  final String? _type;

  final int? _dosageCount;

  final String? _dosageType;

  final int? _dosageCountPer;

  final String? _dosageTypePer;

  final int? _scheduleCount;

  final String? _scheduleType;

  final int? _withDrawalCount;

  final String? _withDrawalType;

  final String? _note;

  TreatmentPostModel copyWith({
    int? Function()? ailmentId,
    String? Function()? title,
    DateTime? Function()? startDate,
    String? Function()? medication,
    String? Function()? method,
    String? Function()? type,
    int? Function()? dosageCount,
    String? Function()? dosageType,
    int? Function()? dosageCountPer,
    String? Function()? dosageTypePer,
    int? Function()? scheduleCount,
    String? Function()? scheduleType,
    int? Function()? withDrawalCount,
    String? Function()? withDrawalType,
    String? Function()? note,
  }) {
    return TreatmentPostModel(
      ailmentId: ailmentId != null ? ailmentId() : _ailmentId,
      title: title != null ? title() : _title,
      startDate: startDate != null ? startDate() : _startDate,
      method: method != null ? method() : _method,
      medication: medication != null ? medication() : _medication,
      type: type != null ? type() : _type,
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
      note: note != null ? note() : _note,
    );
  }

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$TreatmentPostModelToJson(this);

  @JsonKey(name: 'ailments')
  int? get ailmentId {
    return _ailmentId ?? (throw Exception("Ailment can't be empty"));
  }

  String? get title {
    return _title ?? (throw Exception("Treatments can't be empty"));
  }

  @DateParser()
  @JsonKey(name: 'start_date')
  DateTime? get startDate {
    return _startDate ?? (throw Exception("Start Date can't be empty"));
  }

  String get medication {
    if (_medication == null || _medication.isEmpty) {
      return 'unknown'.i18n;
    } else {
      return _medication;
    }
  }

  String get method {
    if (_method == null || _method.isEmpty) {
      return 'unknown'.i18n;
    } else {
      return _method;
    }
  }

  String get type {
    if (_type == null || _type.isEmpty) {
      return 'unknown'.i18n;
    } else {
      return _type;
    }
  }

  @JsonKey(name: 'dosage_count')
  int get dosageCount {
    return _dosageCount ?? 0; 
  }

  @JsonKey(name: 'dosage_type')
  String get dosageType {
    if (_dosageType == null || _dosageType.isEmpty) {
      return 'unknown'.i18n;
    } else {
      return _dosageType;
    }
  }

  @JsonKey(name: 'dosage_count_per')
  int get dosageCountPer {
    return _dosageCountPer ?? 0; 
  }

  @JsonKey(name: 'dosage_type_per')
  String get dosageTypePer {
    if (_dosageTypePer == null || _dosageTypePer.isEmpty) {
      return 'unknown'.i18n;
    } else {
      return _dosageTypePer;
    }
  }

  @JsonKey(name: 'schedule_count')
   int get scheduleCount {
    return _scheduleCount ?? 0; 
  }

  @JsonKey(name: 'schedule_type')
  String get scheduleType {
    if (_scheduleType == null || _scheduleType.isEmpty) {
      return 'unknown'.i18n;
    } else {
      return _scheduleType;
    }
  }

  @JsonKey(name: 'withdrawal_count')
   int get withDrawalCount {
    return _withDrawalCount ?? 0; 
  }

  @JsonKey(name: 'widthdrawal_type')
  String get withDrawalType {
    if (_withDrawalType == null || _withDrawalType.isEmpty) {
      return 'unknown'.i18n;
    } else {
      return _withDrawalType;
    }
  }

  String get note {
    if (_note == null || _note.isEmpty) {
      return 'no_note'.i18n;
    } else {
      return _note;
    }
  }
}
