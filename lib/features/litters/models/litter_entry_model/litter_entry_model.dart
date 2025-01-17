import 'dart:convert';

import 'package:bunny_sync/features/litter_details/model/kit_model/kit_model.dart';
import 'package:bunny_sync/features/weight/models/weightable_model/weightable_model.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/utils/bunny_sync_json_utils.dart';
import 'package:bunny_sync/global/utils/enums/entity_types.dart';
import 'package:bunny_sync/global/utils/json_converters/string_converter.dart';
import 'package:bunny_sync/global/utils/json_utils.dart';
import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'litter_entry_model.g.dart';

@JsonSerializable()
@immutable
class LitterEntryModel
    implements DropDownItemModel, BottomSheetItemModel, WeightableModel {
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
    this.allKits = const [],
    this.prefix,
    this.cage,
    this.breedText,
    this.note,
    this.tatto,
  }) : entityType = EntityTypes.litter;

  factory LitterEntryModel.fromJsonStr(String str) =>
      LitterEntryModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory LitterEntryModel.fromJson(Map<String, dynamic> json) =>
      _$LitterEntryModelFromJson(json);

  @override
  final EntityTypes entityType;

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

  @JsonKey(name: 'all_kits', defaultValue: [])
  final List<KitModel> allKits;

  @JsonKey(
    fromJson: BunnySyncJsonUtils.isActiveFromJson,
    readValue: JsonUtils.readValue,
  )
  final bool isActive;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$LitterEntryModelToJson(this);

  @override
  String get displayName => litterId;

  @override
  String? get weight => null;

  @override
  List<WeightableModel> get subEntities => allKits;

  @override
  String get httpEndpoint => 'litters/kits/$id/data';

  @override
  String get emptySubEntitiesMessage => 'kits_empty'.i18n;

  @override
  String updateHttpEndpoint({int? weightId}) {
    return 'litters/$id/save-weigh';
  }
  
  @override
  String get addHttpEndpoint => 'litters/$id/save-weigh';
}
