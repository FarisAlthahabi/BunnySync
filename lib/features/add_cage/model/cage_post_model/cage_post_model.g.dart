// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cage_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CagePostModel _$CagePostModelFromJson(Map<String, dynamic> json) =>
    CagePostModel(
      title: json['title'] as String?,
      type: json['type'] as String?,
      size: json['size'] as String?,
      orientation: json['orientation'] as String?,
      hole: AnswerTypes.fromJson((json['hole'] as num).toInt()),
      settings: (json['settings'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CagePostModelToJson(CagePostModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'type': instance.type,
      'size': instance.size,
      'orientation': instance.orientation,
      'hole': AnswerTypes.toJson(instance.hole),
      'settings': instance.settings,
    };
