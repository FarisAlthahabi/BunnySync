import 'dart:convert';

import 'package:bunny_sync/global/utils/json_utils.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attachment_post_model.g.dart';

@JsonSerializable()
@immutable
class AttachmentPostModel {
  const AttachmentPostModel({
    String? title,
    String? file,
  })  : _title = title,
        _file = file;

  factory AttachmentPostModel.fromJsonStr(String str) =>
      AttachmentPostModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory AttachmentPostModel.fromJson(Map<String, dynamic> json) =>
      _$AttachmentPostModelFromJson(json);

  final String? _title;
  final String? _file;

  AttachmentPostModel copyWith({
    String? Function()? title,
    String? Function()? file,
  }) {
    return AttachmentPostModel(
      title: title != null ? title() : _title,
      file: file != null ? file() : _file,
    );
  }

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$AttachmentPostModelToJson(this);

  String get title {
    return _title == null || _title.isEmpty
        ? (throw "Title can't be empty")
        : _title;
  }

  @JsonKey(toJson: JsonUtils.fileToJson)
  String get file {
    return _file == null || _file.isEmpty
        ? (throw "File can't be empty")
        : _file;
  }
}
