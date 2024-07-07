import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/breeder_details/models/breeder_details_response_model/breeder_details_response_fake_model.dart';
import 'package:bunny_sync/features/breeder_details/models/breeder_details_response_model/breeder_details_response_model.dart';
import 'package:bunny_sync/features/breeder_details/models/breeder_note_model/breeder_note_fake_model.dart';
import 'package:bunny_sync/features/breeder_details/models/breeder_note_model/breeder_note_model.dart';
import 'package:bunny_sync/features/breeder_details/models/pedigree_model/pedigree_fake_model.dart';
import 'package:bunny_sync/features/breeder_details/models/pedigree_model/pedigree_model.dart';
import 'package:bunny_sync/features/breeder_details/repo/breeder_details_repo.dart';
import 'package:bunny_sync/global/localization/strings.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/breeder_details_state.dart';

part 'states/breeder_notes_state.dart';

part 'states/breeder_pedigree_state.dart';

part 'states/general_breeder_details_state.dart';

@injectable
class BreederDetailsCubit extends Cubit<GeneralBreederDetailsState> {
  BreederDetailsCubit(
    this._breederDetailsRepo,
  ) : super(BreederDetailsInitial());

  final BreederDetailsRepo _breederDetailsRepo;

  Future<void> getBreederDetails(int breederId) async {
    emit(BreederDetailsLoading(breederDetailsResponseFakeModel));

    try {
      final response = await _breederDetailsRepo.getBreederDetails(breederId);
      emit(BreederDetailsSuccess(response.data));
    } catch (e, s) {
      addError(e, s);
      emit(BreederDetailsFail(e.toString()));
    }
  }

  Future<void> getBreederPedigree(int breederId) async {
    emit(BreederPedigreeLoading(pedigreeFakeModel));

    try {
      final response = await _breederDetailsRepo.getBreederPedigree(breederId);
      emit(BreederPedigreeSuccess(response.data));
    } catch (e, s) {
      addError(e, s);
      emit(BreederPedigreeFail(e.toString()));
    }
  }

  Future<void> getBreederNotes(int breederId) async {
    emit(BreederNotesLoading(breederNotesFake));

    try {
      final response = await _breederDetailsRepo.getBreederNotes(breederId);
      if (response.isEmpty) {
        emit(BreederNotesEmpty(Strings.notesEmpty));
      } else {
        emit(BreederNotesSuccess(response));
      }
    } catch (e, s) {
      addError(e, s);
      emit(BreederNotesFail(e.toString()));
    }
  }
}
