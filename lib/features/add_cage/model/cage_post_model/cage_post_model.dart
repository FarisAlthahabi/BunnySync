import 'dart:convert';

import 'package:bunny_sync/features/add_cage/model/cage_orientation_types/cage_orientation_types.dart';
import 'package:bunny_sync/features/add_cage/model/cage_placement_types/cage_placement_types.dart';
import 'package:bunny_sync/features/add_cage/model/cage_size_types/cage_size_types.dart';
import 'package:bunny_sync/global/utils/enums/answer_types.dart';
import 'package:bunny_sync/global/utils/enums/rabbit_types.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'cage_post_model.g.dart';

@JsonSerializable()
@immutable
class CagePostModel {
  const CagePostModel({
    String? title,
    RabbitTypes? type,
    CageSizeTypes? size,
    CageOrientationTypes? orientation,
    AnswerTypes? hole,
    List<CagePlacementTypes>? settings,
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

  final RabbitTypes? _type;

  final CageSizeTypes? _size;

  final CageOrientationTypes? _orientation;

  final AnswerTypes? _hole;

  final List<CagePlacementTypes>? _settings;

  CagePostModel copyWith({
    String? Function()? title,
    RabbitTypes? Function()? type,
    CageSizeTypes? Function()? size,
    CageOrientationTypes? Function()? orientation,
    AnswerTypes? Function()? hole,
    List<CagePlacementTypes>? Function()? settings,
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
        ? (throw "Title can't be empty")
        : _title;
  }

  RabbitTypes get type {
    return _type ?? (throw "Type can't be empty");
  }

  @JsonKey(toJson: CageSizeTypes.cageToJson)
  CageSizeTypes get size {
    return _size ?? (throw "Size can't be empty");
  }

  CageOrientationTypes get orientation {
    return _orientation ?? (throw "Orientation can't be empty");
  }

  @JsonKey(fromJson: AnswerTypes.fromJson)
  AnswerTypes get hole {
    return _hole ?? AnswerTypes.no;
  }

  @JsonKey(toJson: CagePlacementTypes.toListJson)
  List<CagePlacementTypes> get settings {
    if (_settings == null || _settings.isEmpty) {
      return [];
    } else {
      return _settings;
    }
  }
}
