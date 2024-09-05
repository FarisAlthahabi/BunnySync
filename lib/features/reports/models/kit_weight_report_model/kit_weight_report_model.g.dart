// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kit_weight_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KitWeightReportModel _$KitWeightReportModelFromJson(
        Map<String, dynamic> json) =>
    KitWeightReportModel(
      breeders:
          (json['breeder'] as List<dynamic>).map((e) => e as String).toList(),
      avgWeight: (json['avgWeight'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$KitWeightReportModelToJson(
        KitWeightReportModel instance) =>
    <String, dynamic>{
      'breeder': instance.breeders,
      'avgWeight': instance.avgWeight,
    };
