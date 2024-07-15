// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'litter_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LitterEntryModel _$LitterEntryModelFromJson(Map<String, dynamic> json) =>
    LitterEntryModel(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      breedPairId: (json['breed_pair_id'] as num).toInt(),
      litterId: json['litter_id'] as String,
      type: json['type'] as String,
      prefix: json['prefix'] as String,
      breed: json['breed'] as String,
      born: json['born'] as String,
      cage: json['cage'] as String,
      breedText: json['breed_text'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      buck: json['buck'] as String,
      buckImage: json['buck_image'] as String,
      doe: json['doe'] as String,
      doeImage: json['doe_image'] as String,
      age: json['age'] as String,
      kits: (json['kits'] as num).toInt(),
      live: (json['live'] as num).toInt(),
      dead: (json['dead'] as num).toInt(),
      sold: json['sold'] as String,
      dtRowIndex: (json['DT_RowIndex'] as num).toInt(),
      isActive: BunnySyncJsonUtils.isActiveFromJson(
          JsonUtils.readValue(json, 'isActive') as Map<String, dynamic>),
      note: json['note'] as String?,
      tatto: json['tatto'] as String?,
    );

Map<String, dynamic> _$LitterEntryModelToJson(LitterEntryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'breed_pair_id': instance.breedPairId,
      'litter_id': instance.litterId,
      'type': instance.type,
      'prefix': instance.prefix,
      'tatto': instance.tatto,
      'breed': instance.breed,
      'born': instance.born,
      'cage': instance.cage,
      'breed_text': instance.breedText,
      'status': instance.status,
      'note': instance.note,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'buck': instance.buck,
      'buck_image': instance.buckImage,
      'doe': instance.doe,
      'doe_image': instance.doeImage,
      'age': instance.age,
      'kits': instance.kits,
      'live': instance.live,
      'dead': instance.dead,
      'sold': instance.sold,
      'DT_RowIndex': instance.dtRowIndex,
      'isActive': instance.isActive,
    };
