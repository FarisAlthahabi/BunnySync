import 'package:bunny_sync/global/utils/enums/gender_types_enum.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'post_kit_model.g.dart';

@immutable
@JsonSerializable()
class PostKitModel {
  const PostKitModel({
    String? tatto,
    String? prefix,
    String? name,
    String? color,
    String? breed,
    String? cage,
    GenderTypes? gender,
    String? note,
  })  : _tatto = tatto,
        _prefix = prefix,
        _name = name,
        _color = color,
        _breed = breed,
        _cage = cage,
        _gender = gender,
        _note = note;

  factory PostKitModel.fromJson(Map<String, dynamic> json) =>
      _$PostKitModelFromJson(json);

  final String? _tatto;
  final String? _prefix;
  final String? _name;
  final String? _color;
  final String? _breed;
  final String? _cage;
  final GenderTypes? _gender;
  final String? _note;

  Map<String, dynamic> toJson() => _$PostKitModelToJson(this);

  PostKitModel copyWith({
    String? tatto,
    String? prefix,
    String? name,
    String? color,
    String? breed,
    String? cage,
    GenderTypes? gender,
    String? note,
  }) {
    return PostKitModel(
      tatto: tatto ?? _tatto,
      prefix: prefix ?? _prefix,
      name: name ?? _name,
      color: color ?? _color,
      breed: breed ?? _breed,
      cage: cage ?? _cage,
      gender: gender ?? _gender,
      note: note ?? _note,
    );
  }

  String get tatto => _tatto ?? (throw 'Tatto is required');

  String? get prefix => _prefix;

  String? get name => _name;

  String? get color => _color;

  String? get breed => _breed;

  String? get cage => _cage;

  String get gender => _gender?.name ?? (throw 'Gender is required');

  String? get note => _note;
}
