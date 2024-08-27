// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => TaskModel(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      name: json['name'] as String,
      startDate:
          const DateTimeConverter().fromJson(json['start_date'] as String?),
      dueDate: const DateTimeConverter().fromJson(json['due_date'] as String?),
      type: TaskGenres.fromJson(json['type'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      recurring: RecurringPeriodsTypes.fromId(json['recurring'] as String?),
      note: json['note'] as String?,
      breedPairId: (json['breed_pair_id'] as num?)?.toInt(),
      status: json['status'] as String?,
      breederId: const IntNullableConverter().fromJson(json['breeder_id']),
      litterId: const IntNullableConverter().fromJson(json['litter_id']),
      who: TaskModel._whoFromJson(json['who']),
      dtRowIndex: (json['DT_RowIndex'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TaskModelToJson(TaskModel instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'breeder_id': const IntNullableConverter().toJson(instance.breederId),
      'litter_id': const IntNullableConverter().toJson(instance.litterId),
      'breed_pair_id': instance.breedPairId,
      'name': instance.name,
      'status': instance.status,
      'start_date': const DateTimeConverter().toJson(instance.startDate),
      'due_date': const DateTimeConverter().toJson(instance.dueDate),
      'type': _$TaskGenresEnumMap[instance.type]!,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'recurring': RecurringPeriodsTypes.toId(instance.recurring),
      'note': instance.note,
      'who': instance.who,
      'DT_RowIndex': instance.dtRowIndex,
    };

const _$TaskGenresEnumMap = {
  TaskGenres.breed: 'breed',
  TaskGenres.pregnancyCheck: 'pregnancyCheck',
  TaskGenres.birth: 'birth',
  TaskGenres.weight: 'weight',
  TaskGenres.nestBox: 'nestBox',
  TaskGenres.medical: 'medical',
  TaskGenres.calendar: 'calendar',
  TaskGenres.heart: 'heart',
  TaskGenres.ribbon: 'ribbon',
  TaskGenres.eye: 'eye',
  TaskGenres.flag: 'flag',
  TaskGenres.paw: 'paw',
  TaskGenres.trophy: 'trophy',
};
