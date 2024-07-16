import 'dart:convert';

import 'package:bunny_sync/global/utils/bunny_sync_json_utils.dart';
import 'package:bunny_sync/global/utils/enums/gender_types_enum.dart';
import 'package:bunny_sync/global/utils/json_converters/string_converter.dart';
import 'package:bunny_sync/global/utils/json_utils.dart';
import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'breeder_entry_model.g.dart';

@immutable
@JsonSerializable()
class BreederEntryModel extends Equatable implements DropDownItemModel {
  const BreederEntryModel({
    required this.id,
    required this.userId,
    required this.uuid,
    required this.name,
    required this.updatedAt,
    required this.createdAt,
    required this.gender,
    required this.isActive,
    this.weight,
    this.litters,
    this.kits,
    this.age,
    this.status,
    this.photo,
    this.dtRowIndex,
    this.prefix,
    this.cage,
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

  final GenderTypes gender;

  @JsonKey(
    fromJson: BunnySyncJsonUtils.isActiveFromJson,
    readValue: JsonUtils.readValue,
  )
  final bool isActive;

  final String? prefix;

  final String? cage;

  final String? color;

  final String? tatto;

  final String? breed;

  @JsonKey(name: 'category_breeder_id')
  final int? categoryBreederId;

  final String? weight;

  @StringConverter()
  final String? litters;

  @StringConverter()
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
      isActive: model?.isActive ?? isActive,
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

  BreederEntryModel copyWith({
    int? id,
    int? userId,
    String? uuid,
    String? name,
    DateTime? updatedAt,
    DateTime? createdAt,
    bool? isActive,
    String? weight,
    String? litters,
    String? kits,
    String? age,
    String? status,
    String? photo,
    int? dtRowIndex,
    String? prefix,
    GenderTypes? gender,
    String? color,
    String? tatto,
    String? breed,
    int? categoryBreederId,
    String? cage,
  }) {
    return BreederEntryModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      isActive: isActive ?? this.isActive,
      weight: weight ?? this.weight,
      litters: litters ?? this.litters,
      kits: kits ?? this.kits,
      age: age ?? this.age,
      status: status ?? this.status,
      photo: photo ?? this.photo,
      dtRowIndex: dtRowIndex ?? this.dtRowIndex,
      prefix: prefix ?? this.prefix,
      cage: cage ?? this.cage,
      gender: gender ?? this.gender,
      color: color ?? this.color,
      tatto: tatto ?? this.tatto,
      breed: breed ?? this.breed,
      categoryBreederId: categoryBreederId ?? this.categoryBreederId,
    );
  }

  @override
  List<Object?> get props => [id];

}
