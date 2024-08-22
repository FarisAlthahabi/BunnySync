import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'save_butcher_model.g.dart';

@JsonSerializable()
@immutable
class SaveButcherModel {
  const SaveButcherModel({
    DateTime? date,
    double? preWeight,
    double? weight,
    double? price,
  })  : _date = date,
        _preWeight = preWeight,
        _weight = weight,
        _price = price;

        factory SaveButcherModel.fromJsonStr(String str) =>
      SaveButcherModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory SaveButcherModel.fromJson(Map<String, dynamic> json) =>
      _$SaveButcherModelFromJson(json);

  final DateTime? _date;
  final double? _preWeight;
  final double? _weight;
  final double? _price;

  SaveButcherModel copyWith({
    DateTime? Function()? date,
    double? Function()? preWeight,
    double? Function()? weight,
    double? Function()? price,
  }) {
    return SaveButcherModel(
      date: date != null ? date() : _date,
      preWeight: preWeight != null ? preWeight() : _preWeight,
      weight: weight != null ? weight() : _weight,
      price: price != null ? price() : _price,
    );
  }

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$SaveButcherModelToJson(this);

  DateTime get date {
    return _date ?? (throw Exception("Date can't be empty"));
  }
  double? get preWeight {
    return _preWeight ;
  }

  double? get weight {
    return _preWeight;
  }

  double? get price {
    return _price;
  }
}
