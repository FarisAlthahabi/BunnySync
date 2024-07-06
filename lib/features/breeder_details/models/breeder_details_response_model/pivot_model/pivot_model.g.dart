// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pivot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PivotModel _$PivotModelFromJson(Map<String, dynamic> json) => PivotModel(
      userId: (json['user_id'] as num).toInt(),
      roleId: (json['role_id'] as num).toInt(),
    );

Map<String, dynamic> _$PivotModelToJson(PivotModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'role_id': instance.roleId,
    };
