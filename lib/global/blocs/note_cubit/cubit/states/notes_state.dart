part of '../notes_cubit.dart';

@immutable
abstract class NotesState extends GeneralNotesState {}

class NotesInitial extends NotesState {}

class NotesFetch extends NotesState {
  NotesFetch(this.notes);

  final List<NoteModel> notes;
}

class NotesLoading extends NotesFetch {
  NotesLoading(super.notes);
}

class NotesSuccess extends NotesFetch {
  NotesSuccess(super.notes);
}

class NotesEmpty extends NotesState {
  NotesEmpty(this.message);

  final String message;
}

class NotesFail extends NotesState {
  NotesFail(this.message);

  final String message;
}
