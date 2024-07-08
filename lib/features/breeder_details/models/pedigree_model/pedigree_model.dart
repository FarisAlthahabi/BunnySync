import 'dart:convert';

import 'package:bunny_sync/features/breeder_details/models/pedigree_model/pedigree_status_model/pedigree_status_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'pedigree_model.g.dart';

@JsonSerializable()
@immutable
class PedigreeModel {
  const PedigreeModel({
    required this.id,
    required this.userId,
    required this.uuid,
    required this.categoryBreederId,
    required this.name,
    required this.prefix,
    required this.cage,
    required this.gender,
    required this.color,
    required this.tatto,
    required this.createdAt,
    required this.updatedAt,
    required this.images,
    required this.status,
    this.breed,
  });

  factory PedigreeModel.fromJsonStr(String str) =>
      PedigreeModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory PedigreeModel.fromJson(Map<String, dynamic> json) =>
      _$PedigreeModelFromJson(json);

  final int id;

  @JsonKey(name: 'user_id')
  final int userId;

  final String uuid;

  @JsonKey(name: 'category_breeder_id')
  final int? categoryBreederId;

  final String name;

  final String prefix;

  final String cage;

  final String gender;

  final String color;

  final String tatto;

  final String? breed;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  final List<dynamic> images;

  final PedigreeStatusModel status;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$PedigreeModelToJson(this);
}
