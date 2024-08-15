// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CageModel _$CageModelFromJson(Map<String, dynamic> json) => CageModel(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      name: json['name'] as String,
      type: RabbitTypes.fromJson(json['type'] as String),
      size: CageSizeTypes.fromJson(json['size'] as String),
      orientation: CageOrientationTypes.fromJson(json['orientation'] as String),
      hole: AnswerTypes.fromJson((json['hole'] as num).toInt()),
      settings: CagePlacementTypes.fromJsonStr(json['settings'] as String),
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
      'type': _$RabbitTypesEnumMap[instance.type]!,
      'size': _$CageSizeTypesEnumMap[instance.size]!,
      'orientation': _$CageOrientationTypesEnumMap[instance.orientation]!,
      'hole': _$AnswerTypesEnumMap[instance.hole]!,
      'settings': CagePlacementTypes.toListJson(instance.settings),
      'table': instance.table,
      'settings_table': instance.settingsTable,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'DT_RowIndex': instance.dtRowIndex,
    };

const _$RabbitTypesEnumMap = {
  RabbitTypes.breeder: 'breeder',
  RabbitTypes.litter: 'litter',
};

const _$CageSizeTypesEnumMap = {
  CageSizeTypes.business2X3: 'business2X3',
  CageSizeTypes.index3X5: 'index3X5',
  CageSizeTypes.large4x7: 'large4x7',
};

const _$CageOrientationTypesEnumMap = {
  CageOrientationTypes.horizontal: 'horizontal',
  CageOrientationTypes.vertical: 'vertical',
};

const _$AnswerTypesEnumMap = {
  AnswerTypes.yes: 'yes',
  AnswerTypes.no: 'no',
};
