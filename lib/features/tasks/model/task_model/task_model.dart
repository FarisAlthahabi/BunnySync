import 'dart:convert';

import 'package:bunny_sync/features/add_ailment/model/recurring_periods_types/recurring_periods_types.dart';
import 'package:bunny_sync/features/add_task/model/task_genres/task_genres.dart';
import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:bunny_sync/global/utils/json_converters/date_time_converter.dart';
import 'package:bunny_sync/global/utils/json_converters/int_nullable_converter.dart';
import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_model.g.dart';

@JsonSerializable()
@immutable
class TaskModel implements BottomSheetItemModel {
  const TaskModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.startDate,
    required this.dueDate,
    required this.type,
    this.createdAt,
    this.updatedAt,
    this.recurring,
    this.note,
    this.breedPairId,
    this.status,
    this.breederId,
    this.litterId,
    this.who,
    this.dtRowIndex,
  });

  factory TaskModel.fromJsonStr(String str) =>
      TaskModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  final int id;

  @JsonKey(name: 'user_id')
  final int userId;

  @IntNullableConverter()
  @JsonKey(name: 'breeder_id')
  final int? breederId;

  @IntNullableConverter()
  @JsonKey(name: 'litter_id')
  final int? litterId;

  @JsonKey(name: 'breed_pair_id')
  final int? breedPairId;

  final String name;

  final String? status;

  @DateTimeConverter()
  @JsonKey(name: 'start_date')
  final DateTime startDate;

  @DateTimeConverter()
  @JsonKey(name: 'due_date')
  final DateTime dueDate;

  @JsonKey(fromJson: TaskGenres.fromJson)
  final TaskGenres type;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @JsonKey(
    fromJson: RecurringPeriodsTypes.fromId,
    toJson: RecurringPeriodsTypes.toId,
  )
  final RecurringPeriodsTypes? recurring;

  final String? note;

  @JsonKey(fromJson: _whoFromJson)
  final String? who;

  @JsonKey(name: 'DT_RowIndex')
  final int? dtRowIndex;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);

  static String? _whoFromJson(dynamic json) {
    if (json == '-') {
      return 'general'.i18n;
    }
    return json as String?;
  }
}
