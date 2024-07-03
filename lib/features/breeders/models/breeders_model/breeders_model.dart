import 'dart:convert';

import 'package:bunny_sync/features/breeders/models/breeder_model/breeder_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'breeders_model.g.dart';

@immutable
@JsonSerializable()
class BreedersModel {
  const BreedersModel({
    required this.draw,
    required this.recordsTotal,
    required this.recordsFiltered,
    required this.breeders,
    required this.input,
  });

  factory BreedersModel.fromJson(Map<String, dynamic> json) =>
      _$BreedersModelFromJson(json);

  factory BreedersModel.fromJsonStr(String str) =>
      BreedersModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  final int draw;

  final int recordsTotal;

  final int recordsFiltered;

  @JsonKey(name : 'data')
  final List<BreederModel> breeders;

  final List<dynamic> input;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$BreedersModelToJson(this);
}