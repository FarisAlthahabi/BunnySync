import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_model.g.dart';

@JsonSerializable()
@immutable
class SearchModel {
  const SearchModel({
    required this.value,
    this.regex = "false",
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);

  factory SearchModel.fromJsonStr(String str) =>
      SearchModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  final String value;

  @JsonKey(defaultValue: 'false')
  final String regex;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$SearchModelToJson(this);
}
