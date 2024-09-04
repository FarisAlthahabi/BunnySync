import 'dart:convert';

import 'package:bunny_sync/features/add_ailment/model/recurring_periods_types/recurring_periods_types.dart';
import 'package:bunny_sync/features/add_task/model/task_genres/task_genres.dart';
import 'package:bunny_sync/features/add_task/model/task_types/task_types.dart';
import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:bunny_sync/global/utils/json_converters/date_time_converter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'task_post_model.g.dart';

@JsonSerializable()
@immutable
class TaskPostModel {
  const TaskPostModel({
    TaskTypes? type,
    this.who,
    this.taskType,
    String? name,
    DateTime? date,
    this.recurring,
    String? note,
  })  : _type = type,
        _name = name,
        _date = date,
        _note = note;

  factory TaskPostModel.fromJsonStr(String str) =>
      TaskPostModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory TaskPostModel.fromJson(Map<String, dynamic> json) =>
      _$TaskPostModelFromJson(json);

  final TaskTypes? _type;

  final String? who;

  final TaskGenres? taskType;

  final String? _name;

  final DateTime? _date;

  @JsonKey(toJson: RecurringPeriodsTypes.toId)
  final RecurringPeriodsTypes? recurring;

  final String? _note;

  TaskPostModel copyWith({
    TaskTypes? Function()? type,
    String? Function()? who,
    TaskGenres? Function()? taskType,
    String? Function()? name,
    DateTime? Function()? date,
    RecurringPeriodsTypes? Function()? recurring,
    String? Function()? note,
  }) {
    return TaskPostModel(
      type: type != null ? type() : _type,
      who: who != null ? who() : this.who,
      taskType: taskType != null ? taskType() : this.taskType,
      name: name != null ? name() : _name,
      date: date != null ? date() : _date,
      recurring: recurring != null ? recurring() : this.recurring,
      note: note != null ? note() : _note,
    );
  }

  String? validateName() {
    if (_name == null || _name.isEmpty) {
      return 'name_empty'.i18n;
    }
    return null;
  }

  String? validateTaskType() {
    if (taskType == null) {
      return 'taskType_empty'.i18n;
    }
    return null;
  }

  String? validateRecurring() {
    if (recurring == null) {
      return 'recurring_empty'.i18n;
    }
    return null;
  }

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$TaskPostModelToJson(this);

  TaskTypes get type {
    return _type ?? (throw 'Type is required');
  }

  String get name {
    return _name ?? (throw 'Name is required');
  }

  @DateTimeConverter()
  DateTime get date {
    if (_date == null || _date.toString().isEmpty) {
      return DateTime.now();
    } else {
      return _date;
    }
  }

  String? get note {
    if (_note == null || _note.isEmpty) {
      return null;
    } else {
      return _note;
    }
  }
}
