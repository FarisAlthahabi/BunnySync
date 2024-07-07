import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'pedigree_status_model.g.dart';

@JsonSerializable()
@immutable
class PedigreeStatusModel {
  const PedigreeStatusModel({
    required this.breederId,
    required this.status,
    this.reason,
  });

  factory PedigreeStatusModel.fromJsonStr(String str) =>
      PedigreeStatusModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory PedigreeStatusModel.fromJson(Map<String, dynamic> json) =>
      _$PedigreeStatusModelFromJson(json);

  @JsonKey(name: 'breeder_id')
  final int breederId;

  final String status;

  final String? reason;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$PedigreeStatusModelToJson(this);
}
