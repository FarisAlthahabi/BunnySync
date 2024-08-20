import 'dart:convert';

import 'package:bunny_sync/features/add_task/model/task_types/task_types.dart';
import 'package:bunny_sync/features/ledger/models/ledger_types.dart';
import 'package:bunny_sync/global/utils/json_converters/date_time_converter.dart';
import 'package:bunny_sync/global/utils/json_converters/string_converter.dart';
import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'ledger_model.g.dart';

@immutable
@JsonSerializable()
class LedgerModel implements BottomSheetItemModel {
  const LedgerModel({
    required this.id,
    required this.userId,
    required this.categoryId,
    required this.name,
    required this.date,
    required this.type,
    required this.status,
    required this.amount,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
    this.notes,
    this.breederId,
    this.litterId,
    this.customerId,
    this.customerName,
    this.dtRowIndex,
  });

  factory LedgerModel.fromJson(Map<String, dynamic> json) =>
      _$LedgerModelFromJson(json);

  factory LedgerModel.fromJsonStr(String str) =>
      LedgerModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  final int id;

  @JsonKey(name: 'user_id')
  final int userId;

  @JsonKey(name: 'category_id')
  final int categoryId;

  final String name;

  @DateTimeConverter()
  final DateTime date;

  @JsonKey(fromJson: LedgerTypes.fromJson)
  final LedgerTypes type;

  final String? status;

  @StringConverter()
  final String amount;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  final String? notes;

  @JsonKey(fromJson: TaskTypes.fromJson)
  final TaskTypes category;

  @JsonKey(name: 'breeder_id')
  final int? breederId;

  @JsonKey(name: 'litter_id')
  final int? litterId;

  @JsonKey(name: 'customer_id')
  final int? customerId;

  @JsonKey(name: 'customer')
  final String? customerName;

  @JsonKey(name: 'DT_RowIndex')
  final int? dtRowIndex;

  Map<String, dynamic> toJson() => _$LedgerModelToJson(this);

  String toJsonStr() => jsonEncode(toJson());
}
