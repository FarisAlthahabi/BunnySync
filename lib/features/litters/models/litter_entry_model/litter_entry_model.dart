import 'dart:convert';

import 'package:bunny_sync/global/utils/bunny_sync_json_utils.dart';
import 'package:bunny_sync/global/utils/json_converters/string_converter.dart';
import 'package:bunny_sync/global/utils/json_utils.dart';
import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'litter_entry_model.g.dart';

@JsonSerializable()
@immutable
class LitterEntryModel implements DropDownItemModel {
  const LitterEntryModel({
    required this.id,
    required this.userId,
    required this.breedPairId,
    required this.litterId,
    required this.type,
    required this.breed,
    required this.born,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.buck,
    required this.buckImage,
    required this.doe,
    required this.doeImage,
    required this.age,
    required this.kits,
    required this.live,
    required this.dead,
    required this.sold,
    required this.dtRowIndex,
    required this.isActive,
    this.prefix,
    this.cage,
    this.breedText,
    this.note,
    this.tatto,
  });

  factory LitterEntryModel.fromJsonStr(String str) =>
      LitterEntryModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory LitterEntryModel.fromJson(Map<String, dynamic> json) =>
      _$LitterEntryModelFromJson(json);

  @override
  final int id;

  @JsonKey(name: 'user_id')
  final int userId;

  @JsonKey(name: 'breed_pair_id')
  final int breedPairId;

  @JsonKey(name: 'litter_id')
  final String litterId;

  final String type;

  final String? prefix;

  final String? tatto;

  final String breed;

  final String born;

  final String? cage;

  @JsonKey(name: 'breed_text')
  final String? breedText;

  final String status;

  final String? note;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  final String buck;

  @JsonKey(name: 'buck_image')
  final String buckImage;

  final String doe;

  @JsonKey(name: 'doe_image')
  final String doeImage;

  final String age;

  final int kits;

  final int live;

  final int dead;

  @StringConverter()
  final String sold;

  @JsonKey(name: 'DT_RowIndex')
  final int dtRowIndex;

  @JsonKey(
    fromJson: BunnySyncJsonUtils.isActiveFromJson,
    readValue: JsonUtils.readValue,
  )
  final bool isActive;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$LitterEntryModelToJson(this);
  
  @override
  String get name => litterId;
}
