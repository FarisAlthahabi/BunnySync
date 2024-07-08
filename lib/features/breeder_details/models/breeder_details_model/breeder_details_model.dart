import 'dart:convert';
import 'package:bunny_sync/features/breeder_details/models/breeder_details_model/detail_model/detail_model.dart';
import 'package:bunny_sync/features/breeder_details/models/breeder_details_model/status_model/status_model.dart';
import 'package:bunny_sync/global/utils/enums/gender_types_enum.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'breeder_details_model.g.dart';

@JsonSerializable()
@immutable
class BreederDetailsModel {
  const BreederDetailsModel({
    required this.id,
    required this.userId,
    required this.uuid,
    required this.name,
    required this.prefix,
    required this.cage,
    required this.gender,
    required this.color,
    required this.tatto,
    required this.updatedAt,
    required this.createdAt,
    required this.status,
    required this.detail,
    this.breed,
    this.categoryBreederId,
  });

  factory BreederDetailsModel.fromJsonStr(String str) =>
      BreederDetailsModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory BreederDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$BreederDetailsModelFromJson(json);

  final int id;

  @JsonKey(name: 'user_id')
  final int userId;

  @JsonKey(name: 'category_breeder_id')
  final int? categoryBreederId;

  final String uuid;

  final String name;

  final String prefix;

  final String cage;

  final GenderTypes gender;

  final String color;

  final String tatto;

  final String? breed;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  final StatusModel status;

  final DetailModel detail;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$BreederDetailsModelToJson(this);
}
