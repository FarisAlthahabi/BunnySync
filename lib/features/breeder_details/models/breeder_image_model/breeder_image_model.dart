import 'dart:convert';

import 'package:bunny_sync/global/utils/bunny_sync_json_utils.dart';
import 'package:bunny_sync/global/utils/json_converters/int_converter.dart';
import 'package:bunny_sync/global/utils/json_utils.dart';
import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'breeder_image_model.g.dart';

@JsonSerializable()
@immutable
class BreederImageModel implements BottomSheetItemModel{
  const BreederImageModel({
    required this.id,
    required this.breederId,
    required this.path,
    required this.createdAt,
    required this.updatedAt,
    required this.imageUrl,
  });

  factory BreederImageModel.fromJsonStr(String str) =>
      BreederImageModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory BreederImageModel.fromJson(Map<String, dynamic> json) =>
      _$BreederImageModelFromJson(json);

  final int id;

  @IntConverter()
  @JsonKey(name: 'breeder_id')
  final int breederId;

  final String path;

  @JsonKey(
    fromJson: BunnySyncJsonUtils.setImageUrlFromJson,
    readValue: JsonUtils.readValue,
  )
  final String imageUrl;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$BreederImageModelToJson(this);
}
