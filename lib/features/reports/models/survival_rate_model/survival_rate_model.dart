import 'dart:convert';

import 'package:bunny_sync/global/utils/json_converters/double_converter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'survival_rate_model.g.dart';

@JsonSerializable()
@immutable
class SurvivalRateModel {
  const SurvivalRateModel({
    required this.breeders,
    required this.count,
  });

  factory SurvivalRateModel.fromJsonStr(String str) =>
      SurvivalRateModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory SurvivalRateModel.fromJson(Map<String, dynamic> json) =>
      _$SurvivalRateModelFromJson(json);

  @JsonKey(name: 'breeder')
  final List<String> breeders;

  @DoubleConverter()
  final List<double> count;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$SurvivalRateModelToJson(this);
}
