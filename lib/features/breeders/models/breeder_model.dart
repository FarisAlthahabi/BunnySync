import 'dart:convert';

import 'package:bunny_sync/global/utils/enums/gender_types_enum.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'breeder_model.g.dart';

@immutable
@JsonSerializable()
class BreederModel {

  const BreederModel({
    required this.id,
    required this.userId,
    required this.uuid,
    required this.name,
    required this.updatedAt,
    required this.createdAt,
    this.prefix,
    this.cage,
    this.gender,
    this.color,
    this.tatto,
    this.breed,
  });

  factory BreederModel.fromJsonStr(String str) =>
      BreederModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory BreederModel.fromJson(Map<String, dynamic> json) =>
      _$BreederModelFromJson(json);

  final int id;

  @JsonKey(name: 'user_id')
  final int userId;

  final String uuid;

  final String name;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  final String? prefix;

  final String? cage;

  final GenderTypes? gender;

  final String? color;

  final String? tatto;

  final String? breed;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$BreederModelToJson(this);
}
