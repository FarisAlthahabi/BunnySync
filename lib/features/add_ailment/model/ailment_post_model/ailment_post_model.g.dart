// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ailment_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AilmentPostModel _$AilmentPostModelFromJson(Map<String, dynamic> json) =>
    AilmentPostModel(
      type: json['type'] as String?,
      breederId: (json['breeder'] as num?)?.toInt(),
      kitId: (json['kits'] as num?)?.toInt(),
      title: json['title'] as String?,
      symptoms: json['symptoms'] as String?,
      startDate: const DateParser().fromJson(json['start_date'] as String?),
      status: $enumDecodeNullable(_$AilmentStatusTypesEnumMap, json['status']),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$AilmentPostModelToJson(AilmentPostModel instance) =>
    <String, dynamic>{
      'breeder': instance.breederId,
      'kits': instance.kitId,
      'type': instance.type,
      'title': instance.title,
      'symptoms': instance.symptoms,
      'start_date': const DateParser().toJson(instance.startDate),
      'status': _$AilmentStatusTypesEnumMap[instance.status]!,
      'note': instance.note,
    };

const _$AilmentStatusTypesEnumMap = {
  AilmentStatusTypes.active: 'active',
  AilmentStatusTypes.suspended: 'suspended',
  AilmentStatusTypes.cured: 'cured',
};
