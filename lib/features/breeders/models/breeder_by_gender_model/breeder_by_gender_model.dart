import 'dart:convert';

import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'breeder_by_gender_model.g.dart';

@immutable
@JsonSerializable()
class BreederByGenderModel implements DropDownItemModel {
  const BreederByGenderModel({
    required this.id,
    required this.displayName,
  });
  factory BreederByGenderModel.fromJsonStr(String str) =>
      BreederByGenderModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory BreederByGenderModel.fromJson(Map<String, dynamic> json) =>
      _$BreederByGenderModelFromJson(json);

  @override
  final int id;

  @override
  @JsonKey(name: 'name')
  final String displayName;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$BreederByGenderModelToJson(this);
}
