part of '../../breeder_details_cubit.dart';

abstract class BreederNotesActionsState extends GeneralBreederDetailsState {}

class BreederNoteAddLoading extends BreederNotesActionsState {
  BreederNoteAddLoading();
}

class BreederNoteDeleteSuccess extends BreederNotesActionsState {
  BreederNoteDeleteSuccess();
}

class BreederNoteDeleteFail extends BreederNotesActionsState {
  BreederNoteDeleteFail(this.message);

  final String message;
}
