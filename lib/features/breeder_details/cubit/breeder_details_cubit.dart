import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/add_note/model/add_note_model/add_note_model.dart';
import 'package:bunny_sync/features/breeder_details/models/breeder_details_response_model/breeder_details_response_fake_model.dart';
import 'package:bunny_sync/features/breeder_details/models/breeder_details_response_model/breeder_details_response_model.dart';
import 'package:bunny_sync/features/breeder_details/models/breeder_image_model/breeder_image_fake_model.dart';
import 'package:bunny_sync/features/breeder_details/models/breeder_image_model/breeder_image_model.dart';
import 'package:bunny_sync/features/breeder_details/models/breeder_note_model/breeder_note_fake_model.dart';
import 'package:bunny_sync/features/breeder_details/models/breeder_note_model/breeder_note_model.dart';
import 'package:bunny_sync/features/breeder_details/models/pedigree_model/pedigree_fake_model.dart';
import 'package:bunny_sync/features/breeder_details/models/pedigree_model/pedigree_model.dart';
import 'package:bunny_sync/features/breeder_details/repo/breeder_details_repo.dart';
import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/breeder_details_state.dart';

part 'states/breeder_notes_state.dart';

part 'states/breeder_pedigree_state.dart';

part 'states/breeder_profile_state.dart';

part 'states/breeder_images_state.dart';

part 'states/general_breeder_details_state.dart';

@injectable
class BreederDetailsCubit extends Cubit<GeneralBreederDetailsState> {
  BreederDetailsCubit(
    this._breederDetailsRepo,
    @factoryParam this.breeder,
  ) : super(BreederDetailsInitial());

  final BreederDetailsRepo _breederDetailsRepo;

  List<BreederNoteModel> notes = [];

  BreederEntryModel breeder;

  Future<void> getBreederDetails() async {
    emit(BreederDetailsSuccess(breeder));
  }

  Future<void> getBreederProfile() async {
    emit(BreederProfileLoading(breederDetailsResponseFakeModel));

    try {
      final response = await _breederDetailsRepo.getBreederDetails(breeder.id);
      emit(BreederProfileSuccess(response.data));
    } catch (e, s) {
      addError(e, s);
      emit(BreederProfileFail(e.toString()));
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
        emit(BreederNotesEmpty('notes_empty'.i18n));
      } else {
        notes = response;
        emit(BreederNotesSuccess(response));
      }
    } catch (e, s) {
      addError(e, s);
      emit(BreederNotesFail(e.toString()));
    }
  }

  Future<void> getBreederImages(int breederId) async {
    emit(BreederImagesLoading(breederImagesFake));
    try {
      final response = await _breederDetailsRepo.getBreederImages(breederId);
      if (response.isEmpty) {
        emit(BreederImagesEmpty('images_empty'.i18n));
      } else {
        emit(BreederImagesSuccess(response));
      }
    } catch (e, s) {
      addError(e, s);
      emit(BreederImagesFail(e.toString()));
    }
  }

  void updateBreeder(BreederEntryModel breeder) {
    this.breeder = breeder;
    emit(BreederDetailsSuccess(breeder));
  }

  void addNoteManager(AddNoteModel addNoteModel, int breederId) {
    emit(BreederNoteAddSuccess(addNoteModel, breederId));
  }

  void addNote(AddNoteModel addNoteModel, int breederId) {
    final BreederNoteModel noteModel = BreederNoteModel(
      id: notes[notes.length - 1].id + 1,
      breederId: breederId,
      title: addNoteModel.title,
      note: addNoteModel.note,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      dtRowIndex: 1,
    );
    notes.add(noteModel);
    emit(BreederNotesSuccess(notes));
  }

  Future<void> deleteNote(int breederId) async {
    emit(BreederNotesLoading(breederNotesFake));

    try {
      await _breederDetailsRepo.deleteNote(breederId);
      notes.removeWhere(
        (element) => element.id == breederId,
      );
      emit(BreederNoteDeleteSuccess(notes));
      print(notes);
    } catch (e, s) {
      addError(e, s);
      emit(BreederNoteDeleteFail(e.toString()));
    }
  }
}
