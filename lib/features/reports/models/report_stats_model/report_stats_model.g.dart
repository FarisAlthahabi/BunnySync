// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportStatsModel _$ReportStatsModelFromJson(Map<String, dynamic> json) =>
    ReportStatsModel(
      activeBreeders: ActiveBreedersModel.fromJson(
          json['activeBreeders'] as Map<String, dynamic>),
      activeLittersCount: (json['activeLitters'] as num).toInt(),
      kitsToDateCount: (json['kitsToDate'] as num).toInt(),
      diedKits:
          DiedKitsModel.fromJson(json['diedKits'] as Map<String, dynamic>),
      kitsCount: (json['kits'] as num).toInt(),
      income: (json['income'] as num).toInt(),
      expense: (json['expense'] as num).toInt(),
      sold: (json['sold'] as num).toInt(),
      diedCulled: (json['died_culled'] as num).toInt(),
    );

Map<String, dynamic> _$ReportStatsModelToJson(ReportStatsModel instance) =>
    <String, dynamic>{
      'activeBreeders': instance.activeBreeders,
      'activeLitters': instance.activeLittersCount,
      'kitsToDate': instance.kitsToDateCount,
      'diedKits': instance.diedKits,
      'kits': instance.kitsCount,
      'income': instance.income,
      'expense': instance.expense,
      'sold': instance.sold,
      'died_culled': instance.diedCulled,
    };
