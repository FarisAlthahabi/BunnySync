import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'category_model.g.dart';

@JsonSerializable()
@immutable
class CategoryModel {
  const CategoryModel({
    required this.id,
    required this.userId,
    required this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.transactions,
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

  @JsonKey(name: 'desc')
  final String? description;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  final double? transactions;

  @JsonKey(name: 'DT_RowIndex')
  final int? dtRowIndex;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
