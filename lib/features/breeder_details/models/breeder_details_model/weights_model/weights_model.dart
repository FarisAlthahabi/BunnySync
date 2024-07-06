import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'weights_model.g.dart';

@JsonSerializable()
@immutable
class WeightsModel {
  const WeightsModel({
    required this.id,
    required this.breederId,
    required this.weight,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WeightsModel.fromJsonStr(String str) =>
      WeightsModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory WeightsModel.fromJson(Map<String, dynamic> json) =>
      _$WeightsModelFromJson(json);

  final int id;

  @JsonKey(name: 'breeder_id')
  final int breederId;

  final double weight;

  final DateTime date;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

   String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$WeightsModelToJson(this);
}
