import 'dart:convert';

import 'package:bunny_sync/global/utils/bunny_sync_json_utils.dart';
import 'package:bunny_sync/global/utils/json_utils.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'top_breeder_model.g.dart';

@JsonSerializable()
@immutable
class TopBreederModel {
  const TopBreederModel({
    required this.id,
    required this.name,
    required this.live,
    required this.image,
  });

  factory TopBreederModel.fromJsonStr(String str) =>
      TopBreederModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory TopBreederModel.fromJson(Map<String, dynamic> json) =>
      _$TopBreederModelFromJson(json);

  final int id;

  final String name;

  final int live;

  @JsonKey(
    fromJson: BunnySyncJsonUtils.setBreedersFileUrlFromJson,
    readValue: JsonUtils.readValue,
  )
  @JsonKey(name: 'breeder_images_path')
  final String image;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$TopBreederModelToJson(this);
}
