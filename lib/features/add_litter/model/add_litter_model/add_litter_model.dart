import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'add_litter_model.g.dart';

@JsonSerializable()
@immutable
class AddLitterModel {

  const AddLitterModel({
    required this.type,
    required this.maleBreederId,
    required this.femaleBreederId,
    required this.prefix,
    required this.litterId,
    required this.breedDate,
    required this.bornDate,
    required this.breed,
    required this.cage,
    required this.liveKits,
    required this.deadKits,
  });

  factory AddLitterModel.fromJsonStr(String str) =>
      AddLitterModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory AddLitterModel.fromJson(Map<String, dynamic> json) =>
      _$AddLitterModelFromJson(json);

  final String type;

  @JsonKey(name: 'male')
  final int maleBreederId;

  @JsonKey(name: 'female')
  final int femaleBreederId;

  final String prefix;

  @JsonKey(name: 'litter_id')
  final String litterId;

  @JsonKey(name: 'breed_date')
  final DateTime breedDate;

  @JsonKey(name: 'born_date')
  final DateTime bornDate;

  final String breed;

  final String cage;

  @JsonKey(name: 'live_kits')
  final int liveKits;

  @JsonKey(name: 'dead_kits')
 final int deadKits;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$AddLitterModelToJson(this);
}
