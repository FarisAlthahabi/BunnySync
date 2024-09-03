import 'dart:convert';

import 'package:bunny_sync/global/utils/json_converters/date_time_converter.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kit_mortality_model.g.dart';

@JsonSerializable()
@immutable
class KitMortalityModel {
  const KitMortalityModel({
    required this.maleBreederName,
    required this.maleBreederId,
    required this.femaleBreederName,
    required this.femaleBreederId,
    required this.litterName,
    required this.litterId,
    required this.kitName,
    required this.updatedAt,
    required this.reason,
    required this.deathDate,
    required this.dtRowIndex,
  });

  factory KitMortalityModel.fromJsonStr(String str) =>
      KitMortalityModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory KitMortalityModel.fromJson(Map<String, dynamic> json) =>
      _$KitMortalityModelFromJson(json);

  @JsonKey(name: 'breeder_male')
  final String maleBreederName;

  @JsonKey(name: 'breeder_male_id')
  final int maleBreederId;

  @JsonKey(name: 'breeder_female')
  final String femaleBreederName;

  @JsonKey(name: 'breeder_female_id')
  final int femaleBreederId;

  @JsonKey(name: 'litter_name')
  final String litterName;

  @JsonKey(name: 'litter_id')
  final int litterId;

  @JsonKey(name: 'kit_name')
  final String kitName;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  final String reason;

  @DateTimeConverter()
  @JsonKey(name: 'die')
  final DateTime deathDate;

  @JsonKey(name: 'DT_RowIndex')
  final int dtRowIndex;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$KitMortalityModelToJson(this);
}
