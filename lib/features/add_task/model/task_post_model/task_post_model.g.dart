// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskPostModel _$TaskPostModelFromJson(Map<String, dynamic> json) =>
    TaskPostModel(
      type: json['type'] as String?,
      who: json['who'] as String?,
      taskType: json['taskType'] as String?,
      name: json['name'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      recurring: json['recurring'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$TaskPostModelToJson(TaskPostModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'who': instance.who,
      'taskType': instance.taskType,
      'name': instance.name,
      'date': instance.date.toIso8601String(),
      'recurring': instance.recurring,
      'note': instance.note,
    };
