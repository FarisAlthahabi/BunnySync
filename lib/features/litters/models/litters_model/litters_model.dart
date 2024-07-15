import 'dart:convert';

import 'package:bunny_sync/features/litters/models/litter_entry_model/litter_entry_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'litters_model.g.dart';

@JsonSerializable()
@immutable
class LittersModel {
  const LittersModel({
    required this.draw,
    required this.recordsTotal,
    required this.recordsFiltered,
    required this.litters,
    required this.input,
  });

  factory LittersModel.fromJsonStr(String str) =>
      LittersModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory LittersModel.fromJson(Map<String, dynamic> json) =>
      _$LittersModelFromJson(json);

  final int draw;

  final int recordsTotal;

  final int recordsFiltered;

  @JsonKey(name: 'data')
  final List<LitterEntryModel> litters;

  final List<dynamic> input;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$LittersModelToJson(this);
}
