// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskPostModel _$TaskPostModelFromJson(Map<String, dynamic> json) =>
    TaskPostModel(
      type: $enumDecodeNullable(_$TaskTypesEnumMap, json['type']),
      who: json['who'] as String?,
      taskType: $enumDecodeNullable(_$TaskGenresEnumMap, json['taskType']),
      name: json['name'] as String?,
      date: const DateTimeConverter().fromJson(json['date'] as String?),
      recurring: $enumDecodeNullable(
          _$RecurringPeriodsTypesEnumMap, json['recurring']),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$TaskPostModelToJson(TaskPostModel instance) =>
    <String, dynamic>{
      'who': instance.who,
      'taskType': _$TaskGenresEnumMap[instance.taskType],
      'recurring': RecurringPeriodsTypes.toId(instance.recurring),
      'type': _$TaskTypesEnumMap[instance.type]!,
      'name': instance.name,
      'date': const DateTimeConverter().toJson(instance.date),
      'note': instance.note,
    };

const _$TaskTypesEnumMap = {
  TaskTypes.breeder: 'breeder',
  TaskTypes.litter: 'litter',
  TaskTypes.general: 'general',
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

const _$RecurringPeriodsTypesEnumMap = {
  RecurringPeriodsTypes.once: 'once',
  RecurringPeriodsTypes.everyWeek: 'everyWeek',
  RecurringPeriodsTypes.every2Weeks: 'every2Weeks',
  RecurringPeriodsTypes.everyMonth: 'everyMonth',
};
