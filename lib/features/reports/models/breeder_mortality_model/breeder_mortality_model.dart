import 'dart:convert';

import 'package:bunny_sync/global/utils/json_converters/date_time_converter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'breeder_mortality_model.g.dart';
// TODO : still fixing this model for breeder mortality

@JsonSerializable()
@immutable
class BreederMortalityModel {
  const BreederMortalityModel({
    required this.name,
    required this.age,
    required this.reason,
    required this.deathDate,
    required this.dtRowIndex,
  });

  factory BreederMortalityModel.fromJsonStr(String str) =>
      BreederMortalityModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory BreederMortalityModel.fromJson(Map<String, dynamic> json) =>
      _$BreederMortalityModelFromJson(json);

  final String name;

  final double age;

  final String reason;
  
  @DateTimeConverter()
  @JsonKey(name: 'die')
  final DateTime deathDate;

   @JsonKey(name: 'DT_RowIndex')
  final int dtRowIndex;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$BreederMortalityModelToJson(this);
}
