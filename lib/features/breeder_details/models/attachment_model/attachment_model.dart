import 'dart:convert';

import 'package:bunny_sync/global/utils/bunny_sync_json_utils.dart';
import 'package:bunny_sync/global/utils/json_converters/int_converter.dart';
import 'package:bunny_sync/global/utils/json_utils.dart';
import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'attachment_model.g.dart';

@JsonSerializable()
@immutable
class AttachmentModel implements BottomSheetItemModel {
  const AttachmentModel({
    required this.id,
    required this.breederId,
    required this.title,
    required this.path,
    required this.url,
    required this.createdAt,
    required this.updatedAt,
    this.desc,
    this.dtRowIndex,
  });

  factory AttachmentModel.fromJsonStr(String str) =>
      AttachmentModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory AttachmentModel.fromJson(Map<String, dynamic> json) =>
      _$AttachmentModelFromJson(json);

  final int id;

  @IntConverter()
  @JsonKey(name: 'breeder_id')
  final int breederId;

  final String title;

  final String path;

  @JsonKey(
    fromJson: BunnySyncJsonUtils.setFileUrlFromJson,
    readValue: JsonUtils.readValue,
  )
  final String url;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  final String? desc;

  @JsonKey(name: 'DT_RowIndex')
  final int? dtRowIndex;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$AttachmentModelToJson(this);
}
