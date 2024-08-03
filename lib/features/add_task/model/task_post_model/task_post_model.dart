import 'dart:convert';

import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'task_post_model.g.dart';

@JsonSerializable()
@immutable
class TaskPostModel {
  const TaskPostModel({
    String? type,
    String? who,
    String? taskType,
    String? name,
    DateTime? date,
    String? recurring,
    String? note,
  })  : _type = type,
        _who = who,
        _taskType = taskType,
        _name = name,
        _date = date,
        _recurring = recurring,
        _note = note;

  factory TaskPostModel.fromJsonStr(String str) =>
      TaskPostModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory TaskPostModel.fromJson(Map<String, dynamic> json) =>
      _$TaskPostModelFromJson(json);

  final String? _type;

  final String? _who;

  final String? _taskType;

  final String? _name;

  final DateTime? _date;

  final String? _recurring;

  final String? _note;

  TaskPostModel copyWith({
    String? Function()? type,
    String? Function()? who,
    String? Function()? taskType,
    String? Function()? name,
    DateTime? Function()? date,
    String? Function()? recurring,
    String? Function()? note,
  }) {
    return TaskPostModel(
      type: type != null ? type() : _type,
      who: who != null ? who() : _who,
      taskType: taskType != null ? taskType() : _taskType,
      name: name != null ? name() : _name,
      date: date != null ? date() : _date,
      recurring: recurring != null ? recurring() : _recurring,
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
    if (_taskType == null || _taskType.isEmpty) {
      return 'taskType_empty'.i18n;
    }
    return null;
  }

  String? validateRecurring() {
    if (_recurring == null || _recurring.isEmpty) {
      return 'recurring_empty'.i18n;
    }
    return null;
  }


  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$TaskPostModelToJson(this);

  String get type {
    if (_type == null || _type.isEmpty) {
      return 'unknown'.i18n;
    } else {
      return _type;
    }
  }

  String get who {
    if (_who == null || _who.isEmpty) {
      return 'unknown'.i18n;
    } else {
      return _who;
    }
  }

  String get taskType {
    return _taskType ?? (throw Exception('Task type is null'));
  }

  String get name {
    return _name ?? (throw Exception('Name is null'));
  }

  DateTime get date {
    if (_date == null || _date.toString().isEmpty) {
      return DateTime.now();
    } else {
      return _date;
    }
  }

String get recurring {
    return _recurring ?? (throw Exception('recurring is null'));
  }

  String get note {
    if (_note == null || _note.isEmpty) {
      return 'there_is_no_note'.i18n;
    } else {
      return _note;
    }
  }
}
