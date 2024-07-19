part of '../breeder_details_cubit.dart';

@immutable
abstract class BreederNotesState extends GeneralBreederDetailsState {}

class BreederNotesInitial extends BreederNotesState {}

class BreederNotesFetch extends BreederNotesState {
  BreederNotesFetch(this.breederNotes);

  final List<BreederNoteModel> breederNotes;
}

class BreederNotesLoading extends BreederNotesFetch {
  BreederNotesLoading(super.breederNotes);
}

class BreederNotesSuccess extends BreederNotesFetch {
  BreederNotesSuccess(super.breederNotes);
}

class BreederNoteAddSuccess extends BreederNotesState {
  BreederNoteAddSuccess(
    this.addNoteModel,
    this.breederId,
  );

  final AddNoteModel addNoteModel;
  final int breederId;
}

class BreederNoteDeleteSuccess extends BreederNotesFetch {
  BreederNoteDeleteSuccess(super.breederNotes);
}

class BreederNotesEmpty extends BreederNotesState {
  BreederNotesEmpty(this.message);

  final String message;
}

class BreederNotesFail extends BreederNotesState {
  BreederNotesFail(this.message);

  final String message;
}

class BreederNoteDeleteFail extends BreederNotesState {
  BreederNoteDeleteFail(this.message);

  final String message;
}
