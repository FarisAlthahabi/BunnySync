// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'live_and_dead_model.g.dart';

@JsonSerializable()
@immutable
class LiveAndDeadModel {
  const LiveAndDeadModel({
    required this.breeders,
    required this.live,
    required this.died,
  });

  factory LiveAndDeadModel.fromJsonStr(String str) =>
      LiveAndDeadModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory LiveAndDeadModel.fromJson(Map<String, dynamic> json) =>
      _$LiveAndDeadModelFromJson(json);

  @JsonKey(name: 'breeder')
  final List<String> breeders;

  final List<int> live;

  final List<int> died;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$LiveAndDeadModelToJson(this);
}
