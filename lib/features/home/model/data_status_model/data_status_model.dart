
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data_status_model.g.dart';

@JsonSerializable()
@immutable
class DataStatusModel {
  const DataStatusModel({
    required this.active,
    required this.died,
    required this.kitBreeder,
    required this.sold,
    required this.cull,
    required this.archive,
    required this.butcher,
  });

  factory DataStatusModel.fromJsonStr(String str) =>
      DataStatusModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory DataStatusModel.fromJson(Map<String, dynamic> json) =>
      _$DataStatusModelFromJson(json);

  final int active;

  final int died;

  final int kitBreeder;

  final int sold;

  final int cull;

  final int archive;

  final int butcher;

   String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$DataStatusModelToJson(this);
}
