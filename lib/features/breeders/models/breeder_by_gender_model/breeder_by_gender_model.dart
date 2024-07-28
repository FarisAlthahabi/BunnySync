import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'breeder_by_gender_model.g.dart';

@immutable
@JsonSerializable()
class BreederByGenderModel {
  const BreederByGenderModel({
    required this.id,
    required this.name,
  });
  factory BreederByGenderModel.fromJsonStr(String str) =>
      BreederByGenderModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory BreederByGenderModel.fromJson(Map<String, dynamic> json) =>
      _$BreederByGenderModelFromJson(json);

  final int id;
  final String name;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$BreederByGenderModelToJson(this);
}
