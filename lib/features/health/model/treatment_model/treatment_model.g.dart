// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treatment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TreatmentModel _$TreatmentModelFromJson(Map<String, dynamic> json) =>
    TreatmentModel(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      ailmentId: (json['ailment_id'] as num).toInt(),
      name: json['name'] as String,
      startDate: const DateParser().fromJson(json['start_date'] as String?),
      medication: json['medication'] as String,
      method: json['method'] as String,
      type: json['type'] as String,
      dosageCount: (json['dosage_count'] as num).toInt(),
      dosageType: json['dosage_type'] as String,
      dosageCountPer: (json['dosage_count_per'] as num).toInt(),
      dosageTypePer: json['dosage_type_per'] as String,
      scheduleCount: (json['schedule_count'] as num).toInt(),
      scheduleType: json['schedule_type'] as String,
      widthDrawalCount: (json['withdrawal_count'] as num).toInt(),
      widthDrawalType: json['withdrawal_type'] as String,
      note: json['note'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      rabbitName: json['rabbit'] as String?,
      ailment: json['ailment'] as String?,
      symptoms: json['symptoms'] as String?,
      dtRowIndex: (json['DT_RowIndex'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TreatmentModelToJson(TreatmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'ailment_id': instance.ailmentId,
      'name': instance.name,
      'start_date': const DateParser().toJson(instance.startDate),
      'medication': instance.medication,
      'method': instance.method,
      'type': instance.type,
      'dosage_count': instance.dosageCount,
      'dosage_type': instance.dosageType,
      'dosage_count_per': instance.dosageCountPer,
      'dosage_type_per': instance.dosageTypePer,
      'schedule_count': instance.scheduleCount,
      'schedule_type': instance.scheduleType,
      'withdrawal_count': instance.widthDrawalCount,
      'withdrawal_type': instance.widthDrawalType,
      'note': instance.note,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'rabbit': instance.rabbitName,
      'ailment': instance.ailment,
      'symptoms': instance.symptoms,
      'DT_RowIndex': instance.dtRowIndex,
    };
