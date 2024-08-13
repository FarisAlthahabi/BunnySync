// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cage_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CagePostModel _$CagePostModelFromJson(Map<String, dynamic> json) =>
    CagePostModel(
      title: json['title'] as String?,
      type: $enumDecodeNullable(_$RabbitTypesEnumMap, json['type']),
      size: $enumDecodeNullable(_$CageSizeTypesEnumMap, json['size']),
      orientation: $enumDecodeNullable(
          _$CageOrientationTypesEnumMap, json['orientation']),
      hole: AnswerTypes.fromJson((json['hole'] as num).toInt()),
      settings: (json['settings'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$CagePlacementTypesEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$CagePostModelToJson(CagePostModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'type': _$RabbitTypesEnumMap[instance.type]!,
      'size': CageSizeTypes.cageToJson(instance.size),
      'orientation': _$CageOrientationTypesEnumMap[instance.orientation]!,
      'hole': _$AnswerTypesEnumMap[instance.hole]!,
      'settings': CagePlacementTypes.toListJson(instance.settings),
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

const _$CagePlacementTypesEnumMap = {
  CagePlacementTypes.blank: 'blank',
  CagePlacementTypes.prefix: 'prefix',
  CagePlacementTypes.nameType: 'nameType',
  CagePlacementTypes.breed: 'breed',
  CagePlacementTypes.cage: 'cage',
  CagePlacementTypes.idType: 'idType',
  CagePlacementTypes.sex: 'sex',
  CagePlacementTypes.father: 'father',
  CagePlacementTypes.mother: 'mother',
  CagePlacementTypes.color: 'color',
  CagePlacementTypes.weight: 'weight',
  CagePlacementTypes.acquired: 'acquired',
  CagePlacementTypes.dateOfBirth: 'dateOfBirth',
  CagePlacementTypes.images: 'images',
  CagePlacementTypes.culled: 'culled',
  CagePlacementTypes.kits: 'kits',
  CagePlacementTypes.category: 'category',
  CagePlacementTypes.genotype: 'genotype',
  CagePlacementTypes.currentDate: 'currentDate',
  CagePlacementTypes.weightDate: 'weightDate',
  CagePlacementTypes.vWDuGenotype: 'vWDuGenotype',
};

const _$AnswerTypesEnumMap = {
  AnswerTypes.yes: 'yes',
  AnswerTypes.no: 'no',
};
