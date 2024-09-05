import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'cause_death_model.g.dart';

@JsonSerializable()
@immutable
class CauseDeathModel {
  const CauseDeathModel({
    required this.reason,
    required this.count,
  });

  factory CauseDeathModel.fromJsonStr(String str) =>
      CauseDeathModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory CauseDeathModel.fromJson(Map<String, dynamic> json) =>
      _$CauseDeathModelFromJson(json);

  final List<String> reason;

  final List<int> count;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$CauseDeathModelToJson(this);
}
