import 'dart:convert';

import 'package:bunny_sync/features/profile/model/modules_model/modules_model.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'options_model.g.dart';

@JsonSerializable()
@immutable
class OptionsModel {
  const OptionsModel({
    required this.modules,
  });

  const OptionsModel.empty() : modules = const ModulesModel.empty();

  factory OptionsModel.fromJsonStr(String str) =>
      OptionsModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory OptionsModel.fromJson(Map<String, dynamic> json) =>
      _$OptionsModelFromJson(json);

  final ModulesModel modules;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$OptionsModelToJson(this);
}
