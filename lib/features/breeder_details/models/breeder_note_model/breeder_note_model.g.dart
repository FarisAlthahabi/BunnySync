// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breeder_note_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreederNoteModel _$BreederNoteModelFromJson(Map<String, dynamic> json) =>
    BreederNoteModel(
      id: (json['id'] as num).toInt(),
      breederId: (json['breeder_id'] as num).toInt(),
      title: json['title'] as String,
      note: json['note'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      dtRowIndex: (json['DT_RowIndex'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BreederNoteModelToJson(BreederNoteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'breeder_id': instance.breederId,
      'title': instance.title,
      'note': instance.note,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'DT_RowIndex': instance.dtRowIndex,
    };
