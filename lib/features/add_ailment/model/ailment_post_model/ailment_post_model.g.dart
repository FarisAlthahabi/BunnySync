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
      status: json['status'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$AilmentPostModelToJson(AilmentPostModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'breeder': instance.breederId,
      'kits': instance.kitId,
      'title': instance.title,
      'symptoms': instance.symptoms,
      'start_date': const DateParser().toJson(instance.startDate),
      'status': instance.status,
      'note': instance.note,
    };
