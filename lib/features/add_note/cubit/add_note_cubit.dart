import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/add_note/model/add_note_model/add_note_model.dart';
import 'package:bunny_sync/features/add_note/repo/add_note_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/add_note_state.dart';

part 'states/general_add_note_state.dart';

@injectable
class AddNoteCubit extends Cubit<GeneralAddNoteState> {
  AddNoteCubit(this._addNoteRepo) : super(AddNoteInitial());

  final AddNoteRepo _addNoteRepo;

  AddNoteModel _addNoteModel = const AddNoteModel();

  void setName(String title) {
    _addNoteModel = _addNoteModel.copyWith(
      title: () => title,
    );
  }

  void setPrefix(String note) {
    _addNoteModel = _addNoteModel.copyWith(
      note: () => note,
    );
  }

  Future<void> addBreeder(int breederId) async {
    emit(AddNoteLoading());
    
    try {
      await _addNoteRepo.addNote(_addNoteModel, breederId);
      emit(AddNoteSuccess());
    } catch (e, s) {
      addError(e, s);
      emit(AddNoteFail(e.toString()));
    }
  }
}
