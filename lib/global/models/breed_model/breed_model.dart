import 'dart:convert';

import 'package:bunny_sync/features/breeders/models/breed_time_types/breed_time_types.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'breed_model.g.dart';

@JsonSerializable()
@immutable
class BreedModel {
  const BreedModel({
    int? maleBreederId,
    int? femaleBreederId,
    BreedTimeTypes? breedTimeType,
    DateTime? date,
  })  : _maleBreederId = maleBreederId,
        _femaleBreederId = femaleBreederId,
        _breedTimeType = breedTimeType,
        _date = date;

  factory BreedModel.fromJsonStr(String str) =>
      BreedModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory BreedModel.fromJson(Map<String, dynamic> json) =>
      _$BreedModelFromJson(json);

  final int? _maleBreederId;
  final int? _femaleBreederId;
  final BreedTimeTypes? _breedTimeType;
  final DateTime? _date;

  BreedModel copyWith({
    int? Function()? maleBreederId,
    int? Function()? femaleBreederId,
    BreedTimeTypes? Function()? breedTimeType,
    DateTime? Function()? date,
  }) {
    return BreedModel(
      maleBreederId: maleBreederId != null ? maleBreederId() : _maleBreederId,
      femaleBreederId:
          femaleBreederId != null ? femaleBreederId() : _femaleBreederId,
      breedTimeType: breedTimeType != null ? breedTimeType() : _breedTimeType,
      date: date != null ? date() : _date,
    );
  }

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$BreedModelToJson(this);

  @JsonKey(name: 'male')
  int get maleBreederId {
    return _maleBreederId ?? (throw Exception("Male Breeder can't be empty"));
  }

  @JsonKey(name: 'female')
  int get femaleBreederId {
    return _femaleBreederId ??
        (throw Exception("Female Breeder can't be empty"));
  }

  @JsonKey(
    name: 'type',
    fromJson: BreedTimeTypes.fromJson,
    toJson: BreedTimeTypes.toJson,
  )
  BreedTimeTypes get breedTimeType {
    return _breedTimeType ?? (throw Exception("Type can't be empty"));
  }

  DateTime get date {
    return _date ?? (throw Exception("Date can't be empty"));
  }
}
