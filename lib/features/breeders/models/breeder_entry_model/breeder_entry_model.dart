import 'dart:convert';

import 'package:bunny_sync/global/utils/enums/gender_types_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'breeder_entry_model.g.dart';

@immutable
@JsonSerializable()
class BreederEntryModel extends Equatable {
  const BreederEntryModel({
    required this.id,
    required this.userId,
    required this.uuid,
    required this.name,
    required this.updatedAt,
    required this.createdAt,
    this.weight,
    this.litters,
    this.kits,
    this.age,
    this.status,
    this.photo,
    this.dtRowIndex,
    this.prefix,
    this.cage,
    this.gender,
    this.color,
    this.tatto,
    this.breed,
    this.categoryBreederId,
  });

  factory BreederEntryModel.fromJsonStr(String str) =>
      BreederEntryModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory BreederEntryModel.fromJson(Map<String, dynamic> json) =>
      _$BreederEntryModelFromJson(json);

  final int id;

  @JsonKey(name: 'user_id')
  final int userId;

  final String uuid;

  final String name;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  final String? prefix;

  final String? cage;

  final GenderTypes? gender;

  final String? color;

  final String? tatto;

  final String? breed;

  @JsonKey(name: 'category_breeder_id')
  final int? categoryBreederId;

  final String? weight;

  final String? litters;

  final String? kits;

  final String? age;

  final String? status;

  final String? photo;

  @JsonKey(name: 'DT_RowIndex')
  final int? dtRowIndex;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$BreederEntryModelToJson(this);

  BreederEntryModel merge(BreederEntryModel? model) {
    return BreederEntryModel(
      id: model?.id ?? id,
      userId: model?.userId ?? userId,
      uuid: model?.uuid ?? uuid,
      name: model?.name ?? name,
      updatedAt: model?.updatedAt ?? updatedAt,
      createdAt: model?.createdAt ?? createdAt,
      weight: model?.weight ?? weight,
      litters: model?.litters ?? litters,
      kits: model?.kits ?? kits,
      age: model?.age ?? age,
      status: model?.status ?? status,
      photo: model?.photo ?? photo,
      dtRowIndex: model?.dtRowIndex ?? dtRowIndex,
      prefix: model?.prefix ?? prefix,
      cage: model?.cage ?? cage,
      gender: model?.gender ?? gender,
      color: model?.color ?? color,
      tatto: model?.tatto ?? tatto,
      breed: model?.breed ?? breed,
      categoryBreederId: model?.categoryBreederId ?? categoryBreederId,
    );
  }

  @override
  List<Object?> get props => [id];
}
