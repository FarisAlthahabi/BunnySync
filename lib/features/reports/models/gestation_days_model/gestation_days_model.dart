import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'gestation_days_model.g.dart';

@JsonSerializable()
@immutable
class GestationDaysModel {
  const GestationDaysModel({
    required this.breeders,
    required this.days,
  });

  factory GestationDaysModel.fromJsonStr(String str) =>
      GestationDaysModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory GestationDaysModel.fromJson(Map<String, dynamic> json) =>
      _$GestationDaysModelFromJson(json);

  @JsonKey(name: 'breeder')
  final List<String> breeders;

  final List<int> days;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$GestationDaysModelToJson(this);
}
