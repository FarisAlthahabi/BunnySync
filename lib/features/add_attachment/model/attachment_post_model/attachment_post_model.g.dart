// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttachmentPostModel _$AttachmentPostModelFromJson(Map<String, dynamic> json) =>
    AttachmentPostModel(
      title: json['title'] as String?,
      file: json['file'] as String?,
    );

Map<String, dynamic> _$AttachmentPostModelToJson(
        AttachmentPostModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'file': JsonUtils.fileToJson(instance.file),
    };
