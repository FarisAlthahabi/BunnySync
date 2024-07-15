// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'litters_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LittersModel _$LittersModelFromJson(Map<String, dynamic> json) => LittersModel(
      draw: (json['draw'] as num).toInt(),
      recordsTotal: (json['recordsTotal'] as num).toInt(),
      recordsFiltered: (json['recordsFiltered'] as num).toInt(),
      litters: (json['data'] as List<dynamic>)
          .map((e) => LitterEntryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      input: json['input'] as List<dynamic>,
    );

Map<String, dynamic> _$LittersModelToJson(LittersModel instance) =>
    <String, dynamic>{
      'draw': instance.draw,
      'recordsTotal': instance.recordsTotal,
      'recordsFiltered': instance.recordsFiltered,
      'data': instance.litters,
      'input': instance.input,
    };
