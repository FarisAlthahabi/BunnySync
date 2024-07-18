part of '../add_note_cubit.dart';

@immutable
abstract class AddNoteState extends GeneralAddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class AddNoteSuccess extends AddNoteState {}

class AddNoteFail extends AddNoteState {
  AddNoteFail(this.message);

  final String message;
}
