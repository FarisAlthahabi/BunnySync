// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bunny_sync/features/breeder_details/models/breeder_details_model/breeder_details_model.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'breeder_details_response_model.g.dart';

@JsonSerializable()
@immutable
class BreederDetailsResponseModel {
  const BreederDetailsResponseModel({
    required this.breeder,
    required this.weight,
    required this.age,
    required this.kitsCount,
    required this.littersCount,
  });

  factory BreederDetailsResponseModel.fromJsonStr(String str) =>
      BreederDetailsResponseModel.fromJson(
        jsonDecode(str) as Map<String, dynamic>,
      );

  factory BreederDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BreederDetailsResponseModelFromJson(json);

  final BreederDetailsModel breeder;

  final String weight;

  final String age;

  @JsonKey(name: 'kitsToDate')
  final int kitsCount;

  @JsonKey(name: 'litters')
  final int littersCount;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$BreederDetailsResponseModelToJson(this);
}
