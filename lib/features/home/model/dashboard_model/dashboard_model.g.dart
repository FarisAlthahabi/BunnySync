// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardModel _$DashboardModelFromJson(Map<String, dynamic> json) =>
    DashboardModel(
      activeBreeders: ActiveBreedersModel.fromJson(
          json['activeBreeders'] as Map<String, dynamic>),
      activeLitters: (json['activeLitters'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      kitsToDate: (json['kitsToDate'] as num).toInt(),
      diedKits:
          DiedKitsModel.fromJson(json['diedKits'] as Map<String, dynamic>),
      income: (json['income'] as num).toInt(),
      expense: (json['expense'] as num).toInt(),
      activeCount: (json['countActive'] as num).toInt(),
      diedCount: (json['countDied'] as num).toInt(),
      kitBreederCount: (json['countKitBreeder'] as num).toInt(),
      soldCount: (json['countSold'] as num).toInt(),
      cullCount: (json['countCull'] as num).toInt(),
      archiveCount: (json['countArchive'] as num).toInt(),
      butcherCount: (json['countButcher'] as num).toInt(),
      dataStatus:
          DataStatusModel.fromJson(json['dataStatus'] as Map<String, dynamic>),
      kitPercentage: json['kitPercentage'] as String,
      topBreeders: (json['topBreeder'] as List<dynamic>)
          .map((e) => TopBreederModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DashboardModelToJson(DashboardModel instance) =>
    <String, dynamic>{
      'activeBreeders': instance.activeBreeders,
      'activeLitters': instance.activeLitters,
      'kitsToDate': instance.kitsToDate,
      'diedKits': instance.diedKits,
      'income': instance.income,
      'expense': instance.expense,
      'countActive': instance.activeCount,
      'countDied': instance.diedCount,
      'countKitBreeder': instance.kitBreederCount,
      'countSold': instance.soldCount,
      'countCull': instance.cullCount,
      'countArchive': instance.archiveCount,
      'countButcher': instance.butcherCount,
      'dataStatus': instance.dataStatus,
      'kitPercentage': instance.kitPercentage,
      'topBreeder': instance.topBreeders,
    };
