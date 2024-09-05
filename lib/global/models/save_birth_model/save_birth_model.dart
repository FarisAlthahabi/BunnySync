import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'save_birth_model.g.dart';

@JsonSerializable()
@immutable
class SaveBirthModel {
  const SaveBirthModel({
    int? breederPairId,
    String? litterId,
    int? liveKits,
    int? deadKits,
  })  : _breederPairId = breederPairId,
        _litterId = litterId,
        _liveKits = liveKits,
        _deadKits = deadKits;

  factory SaveBirthModel.fromJsonStr(String str) =>
      SaveBirthModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory SaveBirthModel.fromJson(Map<String, dynamic> json) =>
      _$SaveBirthModelFromJson(json);

  final int? _breederPairId;
  final String? _litterId;
  final int? _liveKits;
  final int? _deadKits;

  SaveBirthModel copyWith({
    int? Function()? breederPairId,
    String? Function()? litterId,
    int? Function()? liveKits,
    int? Function()? deadKits,
  }) {
    return SaveBirthModel(
      breederPairId: breederPairId != null ? breederPairId() : _breederPairId,
      litterId: litterId != null ? litterId() : _litterId,
      liveKits: liveKits != null ? liveKits() : _liveKits,
      deadKits: deadKits != null ? deadKits() : _deadKits,
    );
  }

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$SaveBirthModelToJson(this);

  @JsonKey(name: 'breederPair')
  int get breederPairId {
    return _breederPairId ?? (throw "Breeder pair can't be empty");
  }

  @JsonKey(name: 'litter_id')
  String get litterId {
    return _litterId ?? (throw "Litter id can't be empty");
  }

  @JsonKey(name: 'live_kits')
  int get liveKits {
    return  _liveKits ?? 0;
  }

  @JsonKey(name: 'dead_kits')
  int get deadKits {
    return _deadKits ?? 0;
  }
}
