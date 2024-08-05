// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treatment_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TreatmentPostModel _$TreatmentPostModelFromJson(Map<String, dynamic> json) =>
    TreatmentPostModel(
      ailmentId: (json['ailments'] as num?)?.toInt(),
      title: json['title'] as String?,
      startDate: const DateParser().fromJson(json['start_date'] as String?),
      medication: json['medication'] as String?,
      method: json['method'] as String?,
      type: json['type'] as String?,
      dosageCount: (json['dosage_count'] as num?)?.toInt(),
      dosageType: json['dosage_type'] as String?,
      dosageCountPer: (json['dosage_count_per'] as num?)?.toInt(),
      dosageTypePer: json['dosage_type_per'] as String?,
      scheduleCount: (json['schedule_count'] as num?)?.toInt(),
      scheduleType: json['schedule_type'] as String?,
      withDrawalCount: (json['withdrawal_count'] as num?)?.toInt(),
      withDrawalType: json['widthdrawal_type'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$TreatmentPostModelToJson(TreatmentPostModel instance) =>
    <String, dynamic>{
      'ailments': instance.ailmentId,
      'title': instance.title,
      'start_date': _$JsonConverterToJson<String?, DateTime>(
          instance.startDate, const DateParser().toJson),
      'medication': instance.medication,
      'method': instance.method,
      'type': instance.type,
      'dosage_count': instance.dosageCount,
      'dosage_type': instance.dosageType,
      'dosage_count_per': instance.dosageCountPer,
      'dosage_type_per': instance.dosageTypePer,
      'schedule_count': instance.scheduleCount,
      'schedule_type': instance.scheduleType,
      'withdrawal_count': instance.withDrawalCount,
      'widthdrawal_type': instance.withDrawalType,
      'note': instance.note,
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
