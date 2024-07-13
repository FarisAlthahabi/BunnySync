import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/add_litter/model/add_litter_model/add_litter_model.dart';
import 'package:bunny_sync/features/add_litter/repo/add_litter_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/add_litter_state.dart';

part 'states/general_add_litter_state.dart';

@injectable
class AddLitterCubit extends Cubit<GeneralAddLitterState> {
  AddLitterCubit(this._addLitterRepo) : super(AddLitterInitial());

  final AddLitterRepo _addLitterRepo;

  AddLitterModel _addLitterModel = const AddLitterModel();

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

  void setMaleBreederId(String maleBreederId) {
    _addLitterModel = _addLitterModel.copyWith(
      maleBreederId: () => int.tryParse(maleBreederId),
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

  void setFemaleBreederId(String femaleBreederId) {
    _addLitterModel = _addLitterModel.copyWith(
      femaleBreederId: () => int.tryParse(femaleBreederId),
    );
  }

  //! if type is not manually , the litter will not be added  

  void setType(String type) {
    _addLitterModel = _addLitterModel.copyWith(
      type: () => 'manually',
    );
  }

  Future<void> addLitter() async {
    emit(AddLitterLoading());
    try {
      if(_addLitterModel.liveKits < 1 ){
      throw Exception("Live kits count can't be less than 1");
    }
    if(_addLitterModel.liveKits + _addLitterModel.deadKits > 25 ){
      throw Exception("Total kits count can't be more than 25");
    }
      final response = await _addLitterRepo.addLitter(_addLitterModel);
      if (response.success) {
        emit(AddLitterSuccess(_addLitterModel));
      } else {
        emit(AddLitterFail(response.message));
      }
    } catch (e, s) {
      addError(e, s);
      emit(AddLitterFail(e.toString()));
    }
  }
}
