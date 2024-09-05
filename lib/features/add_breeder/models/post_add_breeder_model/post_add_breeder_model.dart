import 'dart:convert';

import 'package:bunny_sync/global/localization/localization.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'post_add_breeder_model.g.dart';

@JsonSerializable()
@immutable
class PostAddBreederModel {
  const PostAddBreederModel({
    String? name,
    String? prefix,
    String? cage,
    String? gender,
    String? color,
    String? tatto,
    DateTime? date,
    double? weight,
  })  : _name = name,
        _prefix = prefix,
        _cage = cage,
        _gender = gender,
        _color = color,
        _tatto = tatto,
        _date = date,
        _weight = weight;

  factory PostAddBreederModel.fromJsonStr(String str) =>
      PostAddBreederModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory PostAddBreederModel.fromJson(Map<String, dynamic> json) =>
      _$PostAddBreederModelFromJson(json);

  @JsonKey(name: "name")
  final String? _name;
  @JsonKey(name: "prefix")
  final String? _prefix;
  @JsonKey(name: "cage")
  final String? _cage;
  @JsonKey(name: "gender")
  final String? _gender;
  @JsonKey(name: "color")
  final String? _color;
  @JsonKey(name: "tatto")
  final String? _tatto;
  @JsonKey(name: "date")
  final DateTime? _date;
  @JsonKey(name: "weight")
  final double? _weight;

  Map<String, dynamic> toJson() => _$PostAddBreederModelToJson(this);

  String? validateName() {
    if (_name == null || _name.isEmpty) {
      return 'name_empty'.i18n;
    }
    return null;
  }

  PostAddBreederModel copyWith({
    String? Function()? categoryId,
    String? Function()? name,
    String? Function()? prefix,
    String? Function()? cage,
    String? Function()? gender,
    String? Function()? color,
    String? Function()? tatto,
    DateTime? Function()? date,
    String? Function()? breed,
    double? Function()? weight,
  }) {
    return PostAddBreederModel(
      name: name != null ? name() : _name,
      prefix: prefix != null ? prefix() : _prefix,
      cage: cage != null ? cage() : _cage,
      gender: gender != null ? gender() : _gender,
      color: color != null ? color() : _color,
      tatto: tatto != null ? tatto() : _tatto,
      date: date != null ? date() : _date,
      weight: weight != null ? weight() : _weight,
    );
  }

  String get name {
    return _name ?? (throw "name can't be empty");
  }

  String get prefix {
    return _prefix ?? (throw "prefix can't be empty");
  }

  String get cage {
    return _cage ?? (throw "cage can't be empty");
  }

  String get gender {
    return _gender ?? (throw "gender can't be empty");
  }

  String get color {
    return _color ?? (throw "color can't be empty");
  }

  DateTime get date {
    return _date ?? (throw "date can't be empty");
  }

  String get tatto {
    return _tatto ?? (throw "tatto can't be empty");
  }

  double get weight {
    return _weight ?? (throw "weight can't be empty");
  }
}
