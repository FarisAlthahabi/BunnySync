import 'dart:convert';

import 'package:bunny_sync/features/add_task/model/task_types/task_types.dart';
import 'package:bunny_sync/features/ledger/models/ledger_types.dart';
import 'package:bunny_sync/global/utils/json_converters/date_time_converter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'ledger_post_model.g.dart';

@immutable
@JsonSerializable()
class LedgerPostModel {
  const LedgerPostModel({
    String? title,
    num? amount,
    LedgerTypes? type,
    TaskTypes? taskType,
    int? who,
    int? customerId,
    int? categoryId,
    DateTime? date,
    String? note,
    String? file,
  })  : _title = title,
        _amount = amount,
        _type = type,
        _taskType = taskType,
        _who = who,
        _customerId = customerId,
        _categoryId = categoryId,
        _date = date,
        _note = note,
        _file = file;

  factory LedgerPostModel.fromJson(Map<String, dynamic> json) =>
      _$LedgerPostModelFromJson(json);

  factory LedgerPostModel.fromJsonStr(String str) =>
      LedgerPostModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  final String? _title;

  final num? _amount;

  final LedgerTypes? _type;

  final TaskTypes? _taskType;

  final int? _who;

  final int? _customerId;

  final int? _categoryId;

  final DateTime? _date;

  final String? _note;

  final String? _file;

  Map<String, dynamic> toJson() => _$LedgerPostModelToJson(this);

  String toJsonStr() => jsonEncode(toJson());

  String? validateWho() {
    if (taskType?.isBreeder == true || taskType?.isLitter == true) {
      return who == null ? 'Who is required' : null;
    }
    return null;
  }

  String get title => _title ?? (throw 'Name is required');

  num get amount => _amount ?? (throw 'Amount is required');

  LedgerTypes get type => _type ?? (throw 'Type is required');

  @JsonKey(name: 'category')
  int get categoryId => _categoryId ?? (throw 'Ledger category is required');

  TaskTypes? get taskType => _taskType;

  int? get who => _who;

  @JsonKey(name: 'customer')
  int? get customerId => _customerId;

  @DateTimeConverter()
  DateTime get date => _date ?? (throw 'Date is required');

  String? get note => _note;

  String? get file => _file;

  LedgerPostModel copyWith({
    String? Function()? title,
    num? Function()? amount,
    LedgerTypes? Function()? type,
    TaskTypes? Function()? taskType,
    int? Function()? who,
    int? Function()? customerId,
    int? Function()? categoryId,
    DateTime? Function()? date,
    String? Function()? note,
    String? Function()? file,
  }) {
    return LedgerPostModel(
      title: title != null ? title() : _title,
      amount: amount != null ? amount() : _amount,
      type: type != null ? type() : _type,
      taskType: taskType != null ? taskType() : _taskType,
      who: who != null ? who() : _who,
      customerId: customerId != null ? customerId() : _customerId,
      categoryId: categoryId != null ? categoryId() : _categoryId,
      date: date != null ? date() : _date,
      note: note != null ? note() : _note,
      file: file != null ? file() : _file,
    );
  }
}
