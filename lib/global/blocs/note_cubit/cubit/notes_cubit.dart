import 'package:bloc/bloc.dart';
import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:bunny_sync/global/models/note_model/note_fake_model.dart';
import 'package:bunny_sync/global/models/note_model/note_model.dart';
import 'package:bunny_sync/global/repos/note_repo/note_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/notes_state.dart';
part 'states/general_notes_state.dart';
part 'states/delete_note_state.dart';

@injectable
class NotesCubit extends Cubit<GeneralNotesState> {
  NotesCubit(this._noteRepo) : super(NotesInitial());

  final NoteRepo _noteRepo;

  List<NoteModel> notes = [];

  Future<void> getNotes({
    int? breederId,
    int? litterId,
  }) async {
    emit(NotesLoading(notesFake));

    try {
      final response = await _noteRepo.getNotes(
        breederId: breederId,
        litterId: litterId,
      );
      if (response.isEmpty) {
        emit(NotesEmpty('notes_empty'.i18n));
      } else {
        notes = response;
        emit(NotesSuccess(response));
      }
    } catch (e, s) {
      addError(e, s);
      emit(NotesFail(e.toString()));
    }
  }

  void addNote(NoteModel note) {
    notes.add(note);
    emit(NotesSuccess(notes));
  }

  Future<void> deleteNote({int? breederId, int? litterId}) async {
    emit(DeleteNoteLoading());

    try {
      await _noteRepo.deleteNote(
        breederId: breederId,
        litterId: litterId,
      );
      notes.removeWhere(
        (element) => element.id == breederId,
      );

      emit(DeleteNoteSuccess());

      if (notes.isEmpty) {
        emit(NotesEmpty('notes_empty'.i18n));
      } else {
        emit(NotesSuccess(notes));
      }
    } catch (e, s) {
      addError(e, s);
      emit(DeleteNoteFail(e.toString()));
    }
  }
}
