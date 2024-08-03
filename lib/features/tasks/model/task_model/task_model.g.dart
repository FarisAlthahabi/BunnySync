// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => TaskModel(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      name: json['name'] as String,
      startDate: DateTime.parse(json['start_date'] as String),
      dueDate: const DateParser().fromJson(json['due_date'] as String?),
      type: json['type'] as String,
      recurring: json['recurring'] as String,
      note: json['note'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      breedPairId: (json['breed_pair_id'] as num?)?.toInt(),
      status: json['status'] as String?,
      breederId: (json['breeder_id'] as num?)?.toInt(),
      litterId: (json['litter_id'] as num?)?.toInt(),
      who: json['who'] as String?,
      dtRowIndex: (json['DT_RowIndex'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TaskModelToJson(TaskModel instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'breeder_id': instance.breederId,
      'litter_id': instance.litterId,
      'breed_pair_id': instance.breedPairId,
      'name': instance.name,
      'status': instance.status,
      'start_date': instance.startDate.toIso8601String(),
      'due_date': const DateParser().toJson(instance.dueDate),
      'type': instance.type,
      'recurring': instance.recurring,
      'note': instance.note,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'who': instance.who,
      'DT_RowIndex': instance.dtRowIndex,
    };
