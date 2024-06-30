import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'new_breeder_model.g.dart';
@immutable
@JsonSerializable()
class NewBreederModel {
  const NewBreederModel({
    required this.user_id,
    required this.id,
    this.category_breeder_id,
    required this.uuid,
    required this.name,
    required this.prefix,
    required this.cage,
    required this.gender,
    required this.color,
    required this.tatto,
    required this.breed,
    required this.updated_at,
    required this.created_at,
  });

  factory NewBreederModel.fromJsonStr(String str) =>
      NewBreederModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory NewBreederModel.fromJson(Map<String, dynamic> json) =>
      _$NewBreederModelFromJson(json);
  final int user_id;
  final int id;
  final int? category_breeder_id;
  final String uuid;
  final String name;
  final String prefix;
  final String cage;
  final String gender;
  final String color;
  final String tatto;
  final String breed;
  final DateTime updated_at;
  final DateTime created_at;

      Map<String, dynamic> toJson() => _$NewBreederModelToJson(this);
}
