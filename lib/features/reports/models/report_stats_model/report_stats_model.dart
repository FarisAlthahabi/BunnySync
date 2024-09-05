import 'dart:convert';

import 'package:bunny_sync/features/home/model/active_breeders_model/active_breeders_model.dart';
import 'package:bunny_sync/features/home/model/died_kits_model/died_kits_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'report_stats_model.g.dart';

@JsonSerializable()
@immutable
class ReportStatsModel {
  const ReportStatsModel({
    required this.activeBreeders,
    required this.activeLittersCount,
    required this.kitsToDateCount,
    required this.diedKits,
    required this.kitsCount,
    required this.income,
    required this.expense,
    required this.sold,
    required this.diedCulled,
  });

  factory ReportStatsModel.fromJsonStr(String str) =>
      ReportStatsModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory ReportStatsModel.fromJson(Map<String, dynamic> json) =>
      _$ReportStatsModelFromJson(json);

  final ActiveBreedersModel activeBreeders;

  @JsonKey(name: 'activeLitters')
  final int activeLittersCount;

  @JsonKey(name: 'kitsToDate')
  final int kitsToDateCount;

  final DiedKitsModel diedKits;

  @JsonKey(name: 'kits')
  final int kitsCount;

  final int income;

  final int expense;

  final int sold;

  @JsonKey(name: 'died_culled')
  final int diedCulled;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$ReportStatsModelToJson(this);
}
