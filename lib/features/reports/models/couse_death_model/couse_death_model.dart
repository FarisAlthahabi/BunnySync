import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'couse_death_model.g.dart';

@JsonSerializable()
@immutable
class CouseDeathModel {
  const CouseDeathModel({
    required this.reason,
    required this.count,
  });

  factory CouseDeathModel.fromJsonStr(String str) =>
      CouseDeathModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory CouseDeathModel.fromJson(Map<String, dynamic> json) =>
      _$CouseDeathModelFromJson(json);

  final List<String> reason;

  final List<int> count;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$CouseDeathModelToJson(this);
}
