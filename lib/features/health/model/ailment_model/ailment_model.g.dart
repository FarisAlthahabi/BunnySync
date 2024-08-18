// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ailment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AilmentModel _$AilmentModelFromJson(Map<String, dynamic> json) => AilmentModel(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      displayName: json['name'] as String,
      symptoms: json['symptoms'] as String,
      startDate:
          const DateTimeConverter().fromJson(json['start_date'] as String?),
      status: AilmentStatusTypes.fromJson(json['status'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      treatments: (json['treatments'] as List<dynamic>?)
          ?.map((e) => TreatmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      note: json['note'] as String?,
      breederId: (json['breeder_id'] as num?)?.toInt(),
      kitId: (json['kit_id'] as num?)?.toInt(),
      rabbitName: json['rabbit'] as String?,
      dtRowIndex: (json['DT_RowIndex'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AilmentModelToJson(AilmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'breeder_id': instance.breederId,
      'kit_id': instance.kitId,
      'user_id': instance.userId,
      'name': instance.displayName,
      'symptoms': instance.symptoms,
      'start_date': const DateTimeConverter().toJson(instance.startDate),
      'note': instance.note,
      'status': _$AilmentStatusTypesEnumMap[instance.status]!,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'rabbit': instance.rabbitName,
      'treatments': instance.treatments,
      'DT_RowIndex': instance.dtRowIndex,
    };

const _$AilmentStatusTypesEnumMap = {
  AilmentStatusTypes.active: 'active',
  AilmentStatusTypes.suspended: 'suspended',
  AilmentStatusTypes.cured: 'cured',
};
