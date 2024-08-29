import 'package:bunny_sync/features/home/model/active_breeders_model/active_breeders_model.dart';
import 'package:bunny_sync/features/home/model/died_kits_model/died_kits_model.dart';
import 'package:json_annotation/json_annotation.dart';

class ReportStatsModel {
  final ActiveBreedersModel activeBreeders;

  @JsonKey(name: 'activeLitters')
  final int activeLittersCount;

  @JsonKey(name: 'kitsToDate')
  final int kitsToDateCount;

  final DiedKitsModel diedKits;
}
