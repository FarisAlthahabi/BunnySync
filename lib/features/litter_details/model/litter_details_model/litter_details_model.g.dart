// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'litter_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LitterDetailsModel _$LitterDetailsModelFromJson(Map<String, dynamic> json) =>
    LitterDetailsModel(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      breedPairId: (json['breed_pair_id'] as num).toInt(),
      litterId: json['litter_id'] as String,
      type: json['type'] as String,
      prefix: json['prefix'] as String,
      tatto: json['tatto'] as String,
      breedDate: DateTime.parse(json['breed'] as String),
      bronDate: DateTime.parse(json['born'] as String),
      status: json['status'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      kits: (json['kits'] as List<dynamic>)
          .map((e) => KitModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      breederPairModel: BreederPairModel.fromJson(
          json['breederpair'] as Map<String, dynamic>),
      note: json['note'] as String?,
      cage: json['cage'] as String?,
      breed: json['breed_text'] as String?,
    );

Map<String, dynamic> _$LitterDetailsModelToJson(LitterDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'breed_pair_id': instance.breedPairId,
      'litter_id': instance.litterId,
      'type': instance.type,
      'prefix': instance.prefix,
      'tatto': instance.tatto,
      'breed': instance.breedDate.toIso8601String(),
      'born': instance.bronDate.toIso8601String(),
      'cage': instance.cage,
      'breed_text': instance.breed,
      'status': instance.status,
      'note': instance.note,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'kits': instance.kits,
      'breederpair': instance.breederPairModel,
    };
