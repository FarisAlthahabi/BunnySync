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
      startDate:
          const DateTimeConverter().fromJson(json['start_date'] as String?),
      medication: json['medication'] as String,
      method: json['method'] as String,
      type: json['type'] as String,
      dosageCount: (json['dosage_count'] as num).toInt(),
      dosageType: DosageTypes.fromJson(json['dosage_type'] as String),
      dosageCountPer: (json['dosage_count_per'] as num).toInt(),
      dosageTypePer: DosagePerTypes.fromJson(json['dosage_type_per'] as String),
      scheduleCount: (json['schedule_count'] as num).toInt(),
      scheduleType: PeriodTypes.fromJson(json['schedule_type'] as String),
      withDrawalCount: (json['withdrawal_count'] as num).toInt(),
      withDrawalType: PeriodTypes.fromJson(json['widthdrawal_type'] as String),
      note: json['note'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      breederId: (json['breeder_id'] as num?)?.toInt(),
      kitId: (json['kit_id'] as num?)?.toInt(),
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
      'start_date': const DateTimeConverter().toJson(instance.startDate),
      'medication': instance.medication,
      'method': instance.method,
      'type': instance.type,
      'dosage_count': instance.dosageCount,
      'dosage_type': _$DosageTypesEnumMap[instance.dosageType]!,
      'dosage_count_per': instance.dosageCountPer,
      'dosage_type_per': _$DosagePerTypesEnumMap[instance.dosageTypePer]!,
      'schedule_count': instance.scheduleCount,
      'schedule_type': _$PeriodTypesEnumMap[instance.scheduleType]!,
      'withdrawal_count': instance.withDrawalCount,
      'widthdrawal_type': _$PeriodTypesEnumMap[instance.withDrawalType]!,
      'note': instance.note,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'breeder_id': instance.breederId,
      'kit_id': instance.kitId,
      'rabbit': instance.rabbitName,
      'ailment': instance.ailment,
      'symptoms': instance.symptoms,
      'DT_RowIndex': instance.dtRowIndex,
    };

const _$DosageTypesEnumMap = {
  DosageTypes.ml: 'ml',
  DosageTypes.litter: 'litter',
  DosageTypes.oz: 'oz',
};

const _$DosagePerTypesEnumMap = {
  DosagePerTypes.lbs: 'lbs',
  DosagePerTypes.oz: 'oz',
  DosagePerTypes.kg: 'kg',
  DosagePerTypes.grams: 'grams',
};

const _$PeriodTypesEnumMap = {
  PeriodTypes.days: 'days',
  PeriodTypes.weeks: 'weeks',
  PeriodTypes.months: 'months',
  PeriodTypes.years: 'years',
};
