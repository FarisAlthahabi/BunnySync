
// import 'dart:convert';

// import 'package:bunny_sync/features/breeder_details/models/breeder_note_model/breeder_note_model.dart';
// import 'package:flutter/foundation.dart';

// @immutable
// class BreederNotesModel {
//   const BreederNotesModel({
//     required this.notes,
//   });

//   final List<BreederNoteModel> notes;


//   BreederNotesModel copyWith({
//     List<BreederNoteModel>? notes,
//   }) {
//     return BreederNotesModel(
//       notes: notes ?? this.notes,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'notes': notes.map((x) => x.toMap()).toList(),
//     };
//   }

//   factory BreederNotesModel.fromMap(Map<String, dynamic> map) {
//     return BreederNotesModel(
//       notes: List<BreederNoteModel>.from((map['notes'] as List<int>).map<BreederNoteModel>((x) => BreederNoteModel.fromMap(x as Map<String,dynamic>),),),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory BreederNotesModel.fromJson(String source) => BreederNotesModel.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() => 'BreederNotesModel(notes: $notes)';

//   @override
//   bool operator ==(covariant BreederNotesModel other) {
//     if (identical(this, other)) return true;
  
//     return 
//       listEquals(other.notes, notes);
//   }

//   @override
//   int get hashCode => notes.hashCode;
// }
