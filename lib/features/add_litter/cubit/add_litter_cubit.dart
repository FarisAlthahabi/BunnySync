import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/add_litter/model/add_litter_model/add_litter_model.dart';
import 'package:bunny_sync/features/add_litter/repo/add_litter_repo.dart';
import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/add_litter_state.dart';

part 'states/general_add_litter_state.dart';

part 'states/update_add_litter_state.dart';

@injectable
class AddLitterCubit extends Cubit<GeneralAddLitterState> {
  AddLitterCubit(this._addLitterRepo) : super(AddLitterInitial());

  final AddLitterRepo _addLitterRepo;

  AddLitterModel _addLitterModel = const AddLitterModel();

  void setMaleBreederId(BreederEntryModel? breeder) {
    _addLitterModel = _addLitterModel.copyWith(
      maleBreederId: () => breeder?.id,
    );
    emit(UpdateAddLitterState(_addLitterModel));
  }

  void setFemaleBreederId(BreederEntryModel? breeder) {
    _addLitterModel = _addLitterModel.copyWith(
      femaleBreederId: () => breeder?.id,
    );
    emit(UpdateAddLitterState(_addLitterModel));
  }

  void setLitterId(String litterId) {
    _addLitterModel = _addLitterModel.copyWith(
      litterId: () => litterId,
    );
  }

  void setPrefix(String prefix) {
    _addLitterModel = _addLitterModel.copyWith(
      prefix: () => prefix,
    );
  }

  void setCage(String cage) {
    _addLitterModel = _addLitterModel.copyWith(
      cage: () => cage,
    );
  }

  void setBreed(String breed) {
    _addLitterModel = _addLitterModel.copyWith(
      breed: () => breed,
    );
  }

  void setBreedDate(DateTime breedDate) {
    _addLitterModel = _addLitterModel.copyWith(
      breedDate: () => breedDate,
    );
  }

  void setBornDate(DateTime bornDate) {
    _addLitterModel = _addLitterModel.copyWith(
      bornDate: () => bornDate,
    );
  }

  void setLiveKits(String liveKits) {
    _addLitterModel = _addLitterModel.copyWith(
      liveKits: () => int.tryParse(liveKits),
    );
  }

  void setDeadKits(String deadKits) {
    _addLitterModel = _addLitterModel.copyWith(
      deadKits: () => int.tryParse(deadKits),
    );
  }

  void setType(String type) {
    _addLitterModel = _addLitterModel.copyWith(
      type: () => 'manually',
    );
  }

  void emitUpdateAddLitterState() {
    emit(UpdateAddLitterState(_addLitterModel));
  }

  Future<void> addLitter() async {
    emit(AddLitterLoading());
    try {
      if ((_addLitterModel.liveKits) < 1) {
        throw 'live_kits_count_error'.i18n;
      }

      if (_addLitterModel.liveKits + _addLitterModel.deadKits > 25) {
        throw 'total_kits_count_error'.i18n;
      }
      final response = await _addLitterRepo.addLitter(_addLitterModel);
       
      if (response.success) {
        emit(AddLitterSuccess());
      } else {
        emit(AddLitterFail(response.message));
      }
    } catch (e, s) {
      addError(e, s);
      emit(AddLitterFail(e.toString()));
    }
  }
}
