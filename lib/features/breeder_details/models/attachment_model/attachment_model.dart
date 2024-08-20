import 'dart:convert';

import 'package:bunny_sync/global/utils/bunny_sync_json_utils.dart';
import 'package:bunny_sync/global/utils/json_utils.dart';
import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'attachment_model.g.dart';

@JsonSerializable()
@immutable
class AttachmentModel implements BottomSheetItemModel{
  const AttachmentModel({
    required this.id,
    required this.breederId,
    required this.title,
    this.desc,
    required this.path,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
    this.dtRowIndex,
  });

  factory AttachmentModel.fromJsonStr(String str) =>
      AttachmentModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory AttachmentModel.fromJson(Map<String, dynamic> json) =>
      _$AttachmentModelFromJson(json);

  final int id;

  @JsonKey(name: 'breeder_id')
  final int breederId;

  final String title;

  final String? desc;

  final String path;

  @JsonKey(
    fromJson: BunnySyncJsonUtils.setBreedersImageUrlFromJson,
    readValue: JsonUtils.readValue,
  )
  final String imageUrl;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @JsonKey(name: 'DT_RowIndex')
  final int? dtRowIndex;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$AttachmentModelToJson(this);
}
