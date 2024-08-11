import 'dart:convert';
import 'package:bunny_sync/features/home/model/active_breeders_model/active_breeders_model.dart';
import 'package:bunny_sync/features/home/model/data_status_model/data_status_model.dart';
import 'package:bunny_sync/features/home/model/died_kits_model/died_kits_model.dart';
import 'package:bunny_sync/features/home/model/top_breeder_model/top_breeder_model.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'dashboard_model.g.dart';

@JsonSerializable()
@immutable
class DashboardModel {
  const DashboardModel({
    required this.activeBreeders,
    required this.activeLitters,
    required this.kitsToDate,
    required this.diedKits,
    required this.income,
    required this.expense,
    required this.activeCount,
    required this.diedCount,
    required this.kitBreederCount,
    required this.soldCount,
    required this.cullCount,
    required this.archiveCount,
    required this.butcherCount,
    required this.dataStatus,
    required this.kitPercentage,
    required this.topBreeders,
  });

  factory DashboardModel.fromJsonStr(String str) =>
      DashboardModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory DashboardModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardModelFromJson(json);
      
  final ActiveBreedersModel activeBreeders;

  final List<int> activeLitters;

  final int kitsToDate;

  final DiedKitsModel diedKits;

  final int income;
  
  final int expense;

  @JsonKey(name: 'countActive')
  final int activeCount;

  @JsonKey(name: 'countDied')
  final int diedCount;

  @JsonKey(name: 'countKitBreeder')
  final int kitBreederCount;

  @JsonKey(name: 'countSold')
  final int soldCount;

  @JsonKey(name: 'countCull')
  final int cullCount;

  @JsonKey(name: 'countArchive')
  final int archiveCount;

  @JsonKey(name: 'countButcher')
  final int butcherCount;

  final DataStatusModel dataStatus;

  final String kitPercentage;

  @JsonKey(name: 'topBreeder')
  final List<TopBreederModel> topBreeders;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$DashboardModelToJson(this);
}
