// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanModel _$PlanModelFromJson(Map<String, dynamic> json) => PlanModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      monthlyId: json['monthly_id'] as String,
      yearlyId: json['yearly_id'] as String,
      description: json['short_description'] as String,
      features:
          (json['features'] as List<dynamic>).map((e) => e as String).toList(),
      options: OptionsModel.fromJson(json['options'] as Map<String, dynamic>),
      archived: (json['archived'] as num).toInt(),
      chooseDate: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$PlanModelToJson(PlanModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'monthly_id': instance.monthlyId,
      'yearly_id': instance.yearlyId,
      'short_description': instance.description,
      'features': instance.features,
      'options': instance.options,
      'archived': instance.archived,
      'created_at': instance.chooseDate?.toIso8601String(),
    };
