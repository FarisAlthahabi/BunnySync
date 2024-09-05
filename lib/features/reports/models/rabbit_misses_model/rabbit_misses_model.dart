import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'rabbit_misses_model.g.dart';

@JsonSerializable()
@immutable
class RabbitMissesModel {
  const RabbitMissesModel({
    required this.breeders,
    required this.missed,
  });

  factory RabbitMissesModel.fromJsonStr(String str) =>
      RabbitMissesModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory RabbitMissesModel.fromJson(Map<String, dynamic> json) =>
      _$RabbitMissesModelFromJson(json);

  @JsonKey(name: 'breeder')
  final List<String> breeders;

  final List<int> missed;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$RabbitMissesModelToJson(this);
}
