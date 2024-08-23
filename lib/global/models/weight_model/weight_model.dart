import 'dart:convert';

import 'package:bunny_sync/global/utils/json_converters/date_time_converter.dart';
import 'package:bunny_sync/global/utils/json_converters/string_converter.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weight_model.g.dart';

@JsonSerializable()
@immutable
class WeightModel{
  const WeightModel({
    required this.id,
    required this.breederId,
    required this.weight,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
    required this.dtRowIndex,
  });

  factory WeightModel.fromJsonStr(String str) =>
      WeightModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory WeightModel.fromJson(Map<String, dynamic> json) =>
      _$WeightModelFromJson(json);

  final int id;

  @JsonKey(name: 'breeder_id')
  final int breederId;

  @StringConverter()
  final String weight;

  @DateTimeConverter()
  final DateTime date;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @JsonKey(name: 'DT_RowIndex')
  final int? dtRowIndex;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$WeightModelToJson(this);
}
