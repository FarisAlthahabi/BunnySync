import 'dart:convert';

import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'breeder_pair_model.g.dart';

@JsonSerializable()
@immutable
class BreederPairModel {
  const BreederPairModel({
    required this.id,
    required this.userId,
    required this.femailBreederId,
    required this.mailBreederId,
    required this.type,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
    required this.maleBreeder,
    required this.femaleBreeder,
  });

  factory BreederPairModel.fromJsonStr(String str) =>
      BreederPairModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory BreederPairModel.fromJson(Map<String, dynamic> json) =>
      _$BreederPairModelFromJson(json);

  final int id;

  @JsonKey(name: 'user_id')
  final int userId;

  @JsonKey(name: 'female_id')
  final int femailBreederId;

  @JsonKey(name: 'male_id')
  final int mailBreederId;

  final String type;

  final DateTime date;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @JsonKey(name: 'male')
  final BreederEntryModel maleBreeder;

  @JsonKey(name: 'female')
  final BreederEntryModel femaleBreeder;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$BreederPairModelToJson(this);
}
