import 'dart:convert';

import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/utils/enums/answer_types_enum.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'cage_post_model.g.dart';

@JsonSerializable()
@immutable
class CagePostModel {
  const CagePostModel({
    String? title,
    String? type,
    String? size,
    String? orientation,
    AnswerTypes? hole,
    List<String>? settings,
  })  : _title = title,
        _type = type,
        _size = size,
        _orientation = orientation,
        _hole = hole,
        _settings = settings;

  factory CagePostModel.fromJsonStr(String str) =>
      CagePostModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory CagePostModel.fromJson(Map<String, dynamic> json) =>
      _$CagePostModelFromJson(json);

  final String? _title;

  final String? _type;

  final String? _size;

  final String? _orientation;

  final AnswerTypes? _hole;

  final List<String>? _settings;

  CagePostModel copyWith({
    String? Function()? title,
    String? Function()? type,
    String? Function()? size,
    String? Function()? orientation,
    AnswerTypes? Function()? hole,
    List<String>? Function()? settings,
  }) {
    return CagePostModel(
      title: title != null ? title() : _title,
      type: type != null ? type() : _type,
      size: size != null ? size() : _size,
      orientation: orientation != null ? orientation() : _orientation,
      hole: hole != null ? hole() : _hole,
      settings: settings != null ? settings() : _settings,
    );
  }

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$CagePostModelToJson(this);

  String get title {
    return _title == null || _title.isEmpty
        ? (throw Exception("Title can't be empty"))
        : _title;
  }

  String get type {
    return _type ?? (throw Exception("Type can't be empty"));
  }

  String get size {
    return _size ?? (throw Exception("Size can't be empty"));
  }

  String get orientation {
    return _orientation ?? (throw Exception("Orientation can't be empty"));
  }

  @JsonKey(
    fromJson: AnswerTypes.fromJson,
    toJson: AnswerTypes.toJson,
  )
  AnswerTypes get hole {
    return _hole ?? AnswerTypes.no;
  }

  List<String> get settings {
    if (_settings == null || _settings.isEmpty) {
      return ['unknown'.i18n];
    } else {
      return _settings;
    }
  }
}
