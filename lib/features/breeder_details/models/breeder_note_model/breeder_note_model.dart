
import 'dart:convert';

import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'breeder_note_model.g.dart';

@JsonSerializable()
@immutable
class BreederNoteModel implements GlobalModel {
  const BreederNoteModel({
    required this.id,
    required this.breederId,
    required this.title,
    required this.note,
    required this.createdAt,
    required this.updatedAt,
    required this.dtRowIndex,
  });

  factory BreederNoteModel.fromJsonStr(String str) =>
      BreederNoteModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory BreederNoteModel.fromJson(Map<String, dynamic> json) =>
      _$BreederNoteModelFromJson(json);

  final int id;

  @JsonKey(name: 'breeder_id')
  final int breederId;

  final String title;

  final String note;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @JsonKey(name: 'DT_RowIndex')
  final int dtRowIndex;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$BreederNoteModelToJson(this);
}
