import 'dart:convert';

import 'package:bunny_sync/features/litter_details/model/breeder_pair_model/breeder_pair_model.dart';
import 'package:bunny_sync/features/litter_details/model/kit_model/kit_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'litter_details_model.g.dart';

@JsonSerializable()
@immutable
class LitterDetailsModel {
  const LitterDetailsModel({
    required this.id,
    required this.userId,
    required this.breedPairId,
    required this.litterId,
    required this.type,
    required this.prefix,
    required this.breedDate,
    required this.bronDate,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.kits,
    required this.breederPairModel,
    this.tatto,
    this.note,
    this.cage,
    this.breed,
  });

  factory LitterDetailsModel.fromJsonStr(String str) =>
      LitterDetailsModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory LitterDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$LitterDetailsModelFromJson(json);

  final int id;

  @JsonKey(name: 'user_id')
  final int userId;

  @JsonKey(name: 'breed_pair_id')
  final int breedPairId;

  @JsonKey(name: 'litter_id')
  final String litterId;

  final String type;

  final String? prefix;

  final String? tatto;

  @JsonKey(name: 'breed')
  final DateTime breedDate;

  @JsonKey(name: 'born')
  final DateTime bronDate;

  final String? cage;

  @JsonKey(name: 'breed_text')
  final String? breed;

  final String status;

  final String? note;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  final List<KitModel> kits;

  @JsonKey(name: 'breederpair')
  final BreederPairModel breederPairModel;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$LitterDetailsModelToJson(this);
}
