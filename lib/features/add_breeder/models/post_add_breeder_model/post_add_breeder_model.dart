import 'dart:convert';

import 'package:bunny_sync/global/localization/strings.dart';
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
    String? breed,
  })  : _name = name,
        _prefix = prefix,
        _cage = cage,
        _gender = gender,
        _color = color,
        _tatto = tatto,
        _date = date,
        _weight = weight,
        _breed = breed;

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
  @JsonKey(name: "breed")
  final String? _breed;

  Map<String, dynamic> toJson() => _$PostAddBreederModelToJson(this);

  String? validateName() {
    if (_name == null || _name.isEmpty) {
      return Strings.nameEmpty;
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
      breed: breed != null ? breed() : _breed,
      weight: weight != null ? weight() : _weight,
    );
  }

  String get name {
    return _name ?? (throw Exception('name is null'));
  }

  String get prefix {
    return _prefix ?? (throw Exception('prefix is null'));
  }

  String get cage {
    return _cage ?? (throw Exception('cage is null'));
  }

  String get gender {
    return _gender ?? (throw Exception('gender is null'));
  }

  String get color {
    return _color ?? (throw Exception('color is null'));
  }

  DateTime get date {
    return _date ?? (throw Exception('date is null'));
  }

  String get tatto {
    return _tatto ?? (throw Exception('tatto is null'));
  }

  String get breed {
    return _breed ?? (throw Exception('breed is null'));
  }

  double get weight {
    return _weight ?? (throw Exception('weight is null'));
  }
}
