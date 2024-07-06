// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailModel _$DetailModelFromJson(Map<String, dynamic> json) => DetailModel(
      id: (json['id'] as num).toInt(),
      breederId: (json['breeder_id'] as num).toInt(),
      broken: (json['broken'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      fatherId: (json['father_id'] as num?)?.toInt(),
      motherId: (json['mother_id'] as num?)?.toInt(),
      born: json['born'] as String?,
      genotypeName: json['genotype_name'] as String?,
      genotype: json['genotype'] as String?,
      acquired: json['acquired'] as String?,
    );

Map<String, dynamic> _$DetailModelToJson(DetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'breeder_id': instance.breederId,
      'father_id': instance.fatherId,
      'mother_id': instance.motherId,
      'born': instance.born,
      'genotype_name': instance.genotypeName,
      'genotype': instance.genotype,
      'acquired': instance.acquired,
      'broken': instance.broken,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
