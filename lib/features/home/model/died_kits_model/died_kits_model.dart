import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'died_kits_model.g.dart';

@JsonSerializable()
@immutable
class DiedKitsModel {
  const DiedKitsModel({
    required this.diedKitsCount,
    required this.cullKitsCount,
    required this.soldKitsCount,
  });

  factory DiedKitsModel.fromJsonStr(String str) =>
      DiedKitsModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory DiedKitsModel.fromJson(Map<String, dynamic> json) =>
      _$DiedKitsModelFromJson(json);

  @JsonKey(name: 'died')
  final int diedKitsCount;

  @JsonKey(name: 'cull')
  final int cullKitsCount;

  @JsonKey(name: 'sold')
  final int soldKitsCount;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$DiedKitsModelToJson(this);
}
