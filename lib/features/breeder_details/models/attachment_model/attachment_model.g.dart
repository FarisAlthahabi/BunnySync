// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttachmentModel _$AttachmentModelFromJson(Map<String, dynamic> json) =>
    AttachmentModel(
      id: (json['id'] as num).toInt(),
      breederId: const IntConverter().fromJson(json['breeder_id']),
      title: json['title'] as String,
      path: json['path'] as String,
      url: BunnySyncJsonUtils.setBreedersFileUrlFromJson(
          JsonUtils.readValue(json, 'url') as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      desc: json['desc'] as String?,
      dtRowIndex: (json['DT_RowIndex'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AttachmentModelToJson(AttachmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'breeder_id': const IntConverter().toJson(instance.breederId),
      'title': instance.title,
      'path': instance.path,
      'url': instance.url,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'desc': instance.desc,
      'DT_RowIndex': instance.dtRowIndex,
    };
