import 'dart:convert';

import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';
import 'package:bunny_sync/global/widgets/radio_selector_widget.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'breeder_by_gender_model.g.dart';

@immutable
@JsonSerializable()
class BreederByGenderModel
    implements DropDownItemModel, RadioSelectorItemModel {
  const BreederByGenderModel({
    required this.id,
    required this.name,
  });
  factory BreederByGenderModel.fromJsonStr(String str) =>
      BreederByGenderModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory BreederByGenderModel.fromJson(Map<String, dynamic> json) =>
      _$BreederByGenderModelFromJson(json);

  @override
  final int id;
  @override
  final String name;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$BreederByGenderModelToJson(this);

  @override
  // TODO: implement displayName
  String get displayName => name ;

  @override
  dynamic get value => this;
}
