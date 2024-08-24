part of '../notes_cubit.dart';

abstract class DeleteNoteState extends GeneralNotesState {}

class DeleteNoteLoading extends DeleteNoteState {
  DeleteNoteLoading();
}

class DeleteNoteSuccess extends DeleteNoteState {
  DeleteNoteSuccess();
}

class DeleteNoteFail extends DeleteNoteState {
  DeleteNoteFail(this.message);

  final String message;
}
