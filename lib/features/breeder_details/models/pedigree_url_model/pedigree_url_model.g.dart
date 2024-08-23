// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pedigree_url_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PedigreeUrlModel _$PedigreeUrlModelFromJson(Map<String, dynamic> json) =>
    PedigreeUrlModel(
      path: json['url'] as String,
      pedigreeUrl: BunnySyncJsonUtils.setBreedersImageUrlFromJson(
          JsonUtils.readValue(json, 'pedigreeUrl') as Map<String, dynamic>),
    );

Map<String, dynamic> _$PedigreeUrlModelToJson(PedigreeUrlModel instance) =>
    <String, dynamic>{
      'url': instance.path,
      'pedigreeUrl': instance.pedigreeUrl,
    };
