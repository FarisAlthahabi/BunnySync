import 'dart:convert';

import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'note_model.g.dart';

@JsonSerializable()
@immutable
class NoteModel implements BottomSheetItemModel {
  const NoteModel({
    required this.id,
    required this.title,
    required this.note,
    required this.createdAt,
    required this.updatedAt,
    this.breederId,
    this.litterId,
    this.dtRowIndex,
  });

  factory NoteModel.fromJsonStr(String str) =>
      NoteModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory NoteModel.fromJson(Map<String, dynamic> json) =>
      _$NoteModelFromJson(json);

  final int id;

  @JsonKey(name: 'breeder_id')
  final int? breederId;

  @JsonKey(name: 'litter_id')
  final int? litterId;

  final String title;

  final String note;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @JsonKey(name: 'DT_RowIndex')
  final int? dtRowIndex;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$NoteModelToJson(this);
}
