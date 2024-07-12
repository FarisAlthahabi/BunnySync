import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'add_litter_model.g.dart';

@JsonSerializable()
@immutable
class AddLitterModel {
  const AddLitterModel({
    String? type,
    int? maleBreederId,
    int? femaleBreederId,
    String? prefix,
    String? litterId,
    DateTime? breedDate,
    DateTime? bornDate,
    String? breed,
    String? cage,
    int? liveKits,
    int? deadKits,
  })  : _type = type,
        _maleBreederId = maleBreederId,
        _femaleBreederId = femaleBreederId,
        _prefix = prefix,
        _litterId = litterId,
        _breedDate = breedDate,
        _bornDate = bornDate,
        _breed = breed,
        _cage = cage,
        _liveKits = liveKits,
        _deadKits = deadKits;

  factory AddLitterModel.fromJsonStr(String str) =>
      AddLitterModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory AddLitterModel.fromJson(Map<String, dynamic> json) =>
      _$AddLitterModelFromJson(json);

  final String? _type;
  final int? _maleBreederId;
  final int? _femaleBreederId;
  final String? _prefix;
  final String? _litterId;
  final DateTime? _breedDate;
  final DateTime? _bornDate;
  final String? _breed;
  final String? _cage;
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
      type: type != null ? type() : _type,
      prefix: prefix != null ? prefix() : _prefix,
      cage: cage != null ? cage() : _cage,
      breed: breed != null ? breed() : _breed,
      breedDate: breedDate != null ? breedDate() : _breedDate,
      bornDate: bornDate != null ? bornDate() : _bornDate,
      liveKits: liveKits != null ? liveKits() : _liveKits,
      deadKits: deadKits != null ? deadKits() : _deadKits,
      maleBreederId: maleBreederId != null ? maleBreederId() : _maleBreederId,
      femaleBreederId: femaleBreederId != null ? femaleBreederId() : _femaleBreederId,
      litterId: litterId != null ? litterId() : _litterId,
    );
  }

  String get type {
    return _type ?? (throw Exception('Type is null'));
  }

  String get cage {
    return _cage ?? (throw Exception('Cage is null'));
  }

  String get prefix {
    return _prefix ?? (throw Exception('Prefix is null'));
  }

  String get breed {
    return _breed ?? (throw Exception('Breed is null'));
  }

  @JsonKey(name: 'litter_id')
  String get litterId {
    return _litterId ?? (throw Exception('Litter id is null'));
  }

  @JsonKey(name: 'live_kits')
  int get liveKits {
    return _liveKits ?? (throw Exception('Live kits is null'));
  }

  @JsonKey(name: 'dead_kits')
  int get deadKits {
    return _deadKits ?? (throw Exception('Dead kits is null'));
  }

  @JsonKey(name: 'female')
  int get maleBreederId {
    return _maleBreederId ?? (throw Exception('Male breeder id is null'));
  }

  @JsonKey(name: 'male')
  int get femaleBreederId {
    return _femaleBreederId ?? (throw Exception('Female breeder id is null'));
  }

  @JsonKey(name: 'breed_date')
  DateTime get breedDate {
    return _breedDate ?? (throw Exception('Breed date is null'));
  }

  @JsonKey(name: 'born_date')
  DateTime get bornDate {
    return _bornDate ?? (throw Exception('Born date is null'));
  }

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$AddLitterModelToJson(this);
}
