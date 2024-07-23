import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'add_note_model.g.dart';

@JsonSerializable()
@immutable
class AddNoteModel {
  const AddNoteModel({
    String? title,
    String? note,
  })  : _title = title,
        _note = note;

  factory AddNoteModel.fromJsonStr(String str) =>
      AddNoteModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory AddNoteModel.fromJson(Map<String, dynamic> json) =>
      _$AddNoteModelFromJson(json);

  final String? _title;

  final String? _note;

  AddNoteModel copyWith({
    String? Function()? title,
    String? Function()? note,
  }) {
    return AddNoteModel(
      title: title != null ? title() : _title,
      note: note != null ? note() : _note,
    );
  }

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$AddNoteModelToJson(this);

  String get title {
    return _title ?? (throw Exception('title is null'));
  }

  String get note {
    return _note ?? (throw Exception('note is null'));
  }
}
