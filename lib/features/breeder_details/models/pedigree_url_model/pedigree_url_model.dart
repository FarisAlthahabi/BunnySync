import 'dart:convert';

import 'package:bunny_sync/global/utils/bunny_sync_json_utils.dart';
import 'package:bunny_sync/global/utils/json_utils.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pedigree_url_model.g.dart';

@JsonSerializable()
@immutable
class PedigreeUrlModel {
  const PedigreeUrlModel({
    required this.path,
    required this.pedigreeUrl,
  });

  factory PedigreeUrlModel.fromJsonStr(String str) =>
      PedigreeUrlModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory PedigreeUrlModel.fromJson(Map<String, dynamic> json) =>
      _$PedigreeUrlModelFromJson(json);

  @JsonKey(name: 'url')
  final String path;

  @JsonKey(
    fromJson: BunnySyncJsonUtils.setBreedersImageUrlFromJson,
    readValue: JsonUtils.readValue,
  )
  final String pedigreeUrl;

   String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$PedigreeUrlModelToJson(this);
}
