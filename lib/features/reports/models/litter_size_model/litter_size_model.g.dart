// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'litter_size_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LitterSizeModel _$LitterSizeModelFromJson(Map<String, dynamic> json) =>
    LitterSizeModel(
      breeders:
          (json['breeder'] as List<dynamic>).map((e) => e as String).toList(),
      avgKits: (json['avgKits'] as List<dynamic>)
          .map((e) => const DoubleConverter().fromJson(e as String))
          .toList(),
    );

Map<String, dynamic> _$LitterSizeModelToJson(LitterSizeModel instance) =>
    <String, dynamic>{
      'breeder': instance.breeders,
      'avgKits': instance.avgKits.map(const DoubleConverter().toJson).toList(),
    };
