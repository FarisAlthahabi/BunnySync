import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'add_litter_model.g.dart';

@JsonSerializable()
@immutable
class AddLitterModel {
  const AddLitterModel({
    this.type,
    this.maleBreederId,
    this.femaleBreederId,
    this.prefix,
    this.litterId,
    this.breedDate,
    this.bornDate,
    this.breed,
    this.cage,
    int? liveKits,
    int? deadKits,
  })  : _liveKits = liveKits,
        _deadKits = deadKits;

  factory AddLitterModel.fromJsonStr(String str) =>
      AddLitterModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory AddLitterModel.fromJson(Map<String, dynamic> json) =>
      _$AddLitterModelFromJson(json);

  final String? type;

  @JsonKey(name: 'male')
  final int? maleBreederId;

  @JsonKey(name: 'female')
  final int? femaleBreederId;

  final String? prefix;

  @JsonKey(name: 'litter_id')
  final String? litterId;

  @JsonKey(name: 'breed_date')
  final DateTime? breedDate;

  @JsonKey(name: 'born_date')
  final DateTime? bornDate;

  final String? breed;

  final String? cage;

  final int? _liveKits;

  final int? _deadKits;

  AddLitterModel copyWith({
    String? Function()? type,
    String? Function()? litterId,
    String? Function()? prefix,
    String? Function()? cage,
    int? Function()? maleBreederId,
    int? Function()? femaleBreederId,
    int? Function()? liveKits,
    DateTime? Function()? breedDate,
    DateTime? Function()? bornDate,
    String? Function()? breed,
    int? Function()? deadKits,
  }) {
    return AddLitterModel(
      type: type != null ? type() : this.type,
      prefix: prefix != null ? prefix() : this.prefix,
      cage: cage != null ? cage() : this.cage,
      breed: breed != null ? breed() : this.breed,
      breedDate: breedDate != null ? breedDate() : this.breedDate,
      bornDate: bornDate != null ? bornDate() : this.bornDate,
      liveKits: liveKits != null ? liveKits() : _liveKits,
      deadKits: deadKits != null ? deadKits() : _deadKits,
      maleBreederId:
          maleBreederId != null ? maleBreederId() : this.maleBreederId,
      femaleBreederId:
          femaleBreederId != null ? femaleBreederId() : this.femaleBreederId,
      litterId: litterId != null ? litterId() : this.litterId,
    );
  }

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$AddLitterModelToJson(this);

  @JsonKey(name: 'live_kits')
  int get liveKits => _liveKits ?? 0;

  @JsonKey(name: 'dead_kits')
  int get deadKits => _deadKits ?? 0;
}
