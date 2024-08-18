// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treatment_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TreatmentPostModel _$TreatmentPostModelFromJson(Map<String, dynamic> json) =>
    TreatmentPostModel(
      breederId: (json['breeder'] as num?)?.toInt(),
      kitId: (json['kits'] as num?)?.toInt(),
      ailmentId: (json['ailments'] as num?)?.toInt(),
      title: json['title'] as String?,
      startDate:
          const DateTimeConverter().fromJson(json['start_date'] as String?),
      medication: json['medication'] as String?,
      method: json['method'] as String?,
      type: json['type'] as String?,
      dosageCount: (json['dosage_count'] as num?)?.toInt(),
      dosageType:
          $enumDecodeNullable(_$DosageTypesEnumMap, json['dosage_type']),
      dosageCountPer: (json['dosage_count_per'] as num?)?.toInt(),
      dosageTypePer:
          $enumDecodeNullable(_$DosagePerTypesEnumMap, json['dosage_type_per']),
      scheduleCount: (json['schedule_count'] as num?)?.toInt(),
      scheduleType:
          $enumDecodeNullable(_$PeriodTypesEnumMap, json['schedule_type']),
      withDrawalCount: (json['withdrawal_count'] as num?)?.toInt(),
      withDrawalType:
          $enumDecodeNullable(_$PeriodTypesEnumMap, json['widthdrawal_type']),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$TreatmentPostModelToJson(TreatmentPostModel instance) =>
    <String, dynamic>{
      'breeder': instance.breederId,
      'kits': instance.kitId,
      'medication': instance.medication,
      'method': instance.method,
      'type': instance.type,
      'note': instance.note,
      'ailments': instance.ailmentId,
      'title': instance.title,
      'start_date': _$JsonConverterToJson<String?, DateTime>(
          instance.startDate, const DateTimeConverter().toJson),
      'dosage_count': instance.dosageCount,
      'dosage_type': _$DosageTypesEnumMap[instance.dosageType]!,
      'dosage_count_per': instance.dosageCountPer,
      'dosage_type_per': _$DosagePerTypesEnumMap[instance.dosageTypePer]!,
      'schedule_count': instance.scheduleCount,
      'schedule_type': _$PeriodTypesEnumMap[instance.scheduleType]!,
      'withdrawal_count': instance.withDrawalCount,
      'widthdrawal_type': _$PeriodTypesEnumMap[instance.withDrawalType]!,
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

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
