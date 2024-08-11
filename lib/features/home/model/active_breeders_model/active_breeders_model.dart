import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'active_breeders_model.g.dart';

@immutable
@JsonSerializable()
class ActiveBreedersModel {
  const ActiveBreedersModel({
    required this.maleBreedersCount,
    required this.femaleBreedersCount,
    required this.allBreedersCount,
  });

  factory ActiveBreedersModel.fromJsonStr(String str) =>
      ActiveBreedersModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory ActiveBreedersModel.fromJson(Map<String, dynamic> json) =>
      _$ActiveBreedersModelFromJson(json);

  @JsonKey(name: 'male')
  final int maleBreedersCount;

  @JsonKey(name: 'female')
  final int femaleBreedersCount;

  @JsonKey(name: 'breeders')
  final int allBreedersCount;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$ActiveBreedersModelToJson(this);
}
