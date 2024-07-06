import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'detail_model.g.dart';

@JsonSerializable()
@immutable
class DetailModel {
  const DetailModel({
    required this.id,
    required this.breederId,
    required this.broken,
    required this.createdAt,
    required this.updatedAt,
    this.fatherId,
    this.motherId,
    this.born,
    this.genotypeName,
    this.genotype,
    this.acquired,
  });

  factory DetailModel.fromJsonStr(String str) =>
      DetailModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory DetailModel.fromJson(Map<String, dynamic> json) =>
      _$DetailModelFromJson(json);

  final int id;

  @JsonKey(name: 'breeder_id')
  final int breederId;

  @JsonKey(name: 'father_id')
  final int? fatherId;

  @JsonKey(name: 'mother_id')
  final int? motherId;

  final String? born;

  @JsonKey(name: 'genotype_name')
  final String? genotypeName;

  final String? genotype;

  final String? acquired;

  final int broken;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$DetailModelToJson(this);
}
