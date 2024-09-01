import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'doe_cost_model.g.dart';

@JsonSerializable()
@immutable
class DoeCostModel {
  const DoeCostModel({
    required this.breeders,
    required this.costs,
  });

  factory DoeCostModel.fromJsonStr(String str) =>
      DoeCostModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory DoeCostModel.fromJson(Map<String, dynamic> json) =>
      _$DoeCostModelFromJson(json);

  @JsonKey(name: 'breeder')
  final List<String> breeders;

  @JsonKey(name: 'cost')
  final List<double> costs;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$DoeCostModelToJson(this);
}
