// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breeder_notes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreederNotesModel _$BreederNotesModelFromJson(Map<String, dynamic> json) =>
    BreederNotesModel(
      notes: (json['data'] as List<dynamic>)
          .map((e) => BreederNoteModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BreederNotesModelToJson(BreederNotesModel instance) =>
    <String, dynamic>{
      'data': instance.notes,
    };
