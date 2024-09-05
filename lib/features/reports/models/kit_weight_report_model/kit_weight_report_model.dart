import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'kit_weight_report_model.g.dart';

@JsonSerializable()
@immutable
class KitWeightReportModel {
  const KitWeightReportModel({
    required this.breeders,
    required this.avgWeight,
  });

  factory KitWeightReportModel.fromJsonStr(String str) =>
      KitWeightReportModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory KitWeightReportModel.fromJson(Map<String, dynamic> json) =>
      _$KitWeightReportModelFromJson(json);

  @JsonKey(name: 'breeder')
  final List<String> breeders;

  final List<double> avgWeight;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$KitWeightReportModelToJson(this);
}
