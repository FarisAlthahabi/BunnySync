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

  LitterDetailsModel copyWith({
    int? id,
    int? userId,
    int? breedPairId,
    String? litterId,
    String? type,
    String? prefix,
    DateTime? breedDate,
    DateTime? bronDate,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<KitModel>? kits,
    BreederPairModel? breederPairModel,
    String? tatto,
    String? note,
    String? cage,
    String? breed,
  }) {
    return LitterDetailsModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      breedPairId: breedPairId ?? this.breedPairId,
      litterId: litterId ?? this.litterId,
      type: type ?? this.type,
      prefix: prefix ?? this.prefix,
      breedDate: breedDate ?? this.breedDate,
      bronDate: bronDate ?? this.bronDate,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      kits: kits ?? this.kits,
      breederPairModel: breederPairModel ?? this.breederPairModel,
      tatto: tatto ?? this.tatto,
      note: note ?? this.note,
      cage: cage ?? this.cage,
      breed: breed ?? this.breed,
    );
  }
}
