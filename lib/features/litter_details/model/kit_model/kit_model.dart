import 'dart:convert';

import 'package:bunny_sync/features/litter_details/model/kit_status_model/kit_status_model.dart';
import 'package:bunny_sync/global/utils/enums/gender_types_enum.dart';
import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'kit_model.g.dart';

@JsonSerializable()
@immutable
class KitModel extends Equatable implements DropDownItemModel {
  const KitModel({
    required this.id,
    required this.userId,
    required this.litterId,
    required this.code,
    required this.createdAt,
    required this.updatedAt,
    this.kitName,
    this.prefix,
    this.color,
    this.breed,
    this.cage,
    this.gender,
    this.note,
    this.status,
  });

  factory KitModel.fromJsonStr(String str) =>
      KitModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory KitModel.fromJson(Map<String, dynamic> json) =>
      _$KitModelFromJson(json);

  @override
  final int id;

  @JsonKey(name: 'user_id', defaultValue: -1)
  final int userId;

  @JsonKey(name: 'litter_id')
  final int litterId;

  final String code;

  @JsonKey(name: 'name')
  final String? kitName;

  final String? prefix;

  final String? color;

  final String? breed;

  final String? cage;

  final GenderTypes? gender;

  final String? note;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  final KitStatusModel? status;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$KitModelToJson(this);

  @override
  String get displayName => code;

  @override
  List<Object?> get props => [id];
}
