// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteModel _$NoteModelFromJson(Map<String, dynamic> json) => NoteModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      note: json['note'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      breederId: (json['breeder_id'] as num?)?.toInt(),
      litterId: (json['litter_id'] as num?)?.toInt(),
      dtRowIndex: (json['DT_RowIndex'] as num?)?.toInt(),
    );

Map<String, dynamic> _$NoteModelToJson(NoteModel instance) => <String, dynamic>{
      'id': instance.id,
      'breeder_id': instance.breederId,
      'litter_id': instance.litterId,
      'title': instance.title,
      'note': instance.note,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'DT_RowIndex': instance.dtRowIndex,
    };
