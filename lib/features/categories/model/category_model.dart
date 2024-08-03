import 'dart:convert';

import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'category_model.g.dart';

@JsonSerializable()
@immutable
class CategoryModel implements BottomSheetItemModel {
  const CategoryModel({
    required this.id,
    required this.userId,
    required this.name,
    this.transactions = 0,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.dtRowIndex,
  });

  factory CategoryModel.fromJsonStr(String str) =>
      CategoryModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  final int id;

  @JsonKey(name: 'user_id')
  final int userId;

  final String name;

  final double? transactions;

  @JsonKey(name: 'desc')
  final String? description;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @JsonKey(name: 'DT_RowIndex')
  final int? dtRowIndex;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
