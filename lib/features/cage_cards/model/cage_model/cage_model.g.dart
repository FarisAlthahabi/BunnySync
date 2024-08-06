// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CageModel _$CageModelFromJson(Map<String, dynamic> json) => CageModel(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      name: json['name'] as String,
      type: json['type'] as String,
      size: json['size'] as String,
      orientation: json['orientation'] as String,
      hole: AnswerTypes.fromJson((json['hole'] as num).toInt()),
      settings: json['settings'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      table: (json['table'] as num?)?.toInt(),
      settingsTable: (json['settings_table'] as num?)?.toInt(),
      dtRowIndex: (json['DT_RowIndex'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CageModelToJson(CageModel instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'type': instance.type,
      'size': instance.size,
      'orientation': instance.orientation,
      'hole': AnswerTypes.toJson(instance.hole),
      'settings': instance.settings,
      'table': instance.table,
      'settings_table': instance.settingsTable,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'DT_RowIndex': instance.dtRowIndex,
    };
