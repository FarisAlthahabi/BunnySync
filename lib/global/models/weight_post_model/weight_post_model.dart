import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weight_post_model.g.dart';

@JsonSerializable()
@immutable
class WeightPostModel {
  const WeightPostModel({
    double? weight,
    DateTime? date,
  })  : _weight = weight,
        _date = date;

  factory WeightPostModel.fromJsonStr(String str) =>
      WeightPostModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory WeightPostModel.fromJson(Map<String, dynamic> json) =>
      _$WeightPostModelFromJson(json);

  final double? _weight;
  final DateTime? _date;

  WeightPostModel copyWith({
    double? Function()? weight,
    DateTime? Function()? date,
  }) {
    return WeightPostModel(
      weight: weight != null ? weight() : _weight,
      date: date != null ? date() : _date,
    );
  }

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$WeightPostModelToJson(this);

  double get weight {
    return _weight == null || _weight.toString().isEmpty
        ? (throw Exception("weight can't be empty"))
        : _weight;
  }

  DateTime get date {
    return _date ?? (throw Exception("Date can't be empty"));
  }
}
