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

  void setPrefix(String? prefix) {
    _addLitterModel = _addLitterModel.copyWith(
      prefix: () => prefix,
    );
  }

  void setCage(String? cage) {
    _addLitterModel = _addLitterModel.copyWith(
      cage: () => cage,
    );
  }


  void setBreed(String? breed) {
    _addLitterModel = _addLitterModel.copyWith(
      breed: () => breed,
    );
  }

  void setMaleBreederId(int? maleBreederId) {
    _addLitterModel = _addLitterModel.copyWith(
      maleBreederId: () => maleBreederId,
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

  void setLiveKits(int liveKits) {
    _addLitterModel = _addLitterModel.copyWith(
      liveKits: () => liveKits,
    );
  }

  void setDeadKits(int deadKits) {
    _addLitterModel = _addLitterModel.copyWith(
      deadKits: () => deadKits,
    );
  }

  void setFemaleBreederId(int femaleBreederId) {
    _addLitterModel = _addLitterModel.copyWith(
      femaleBreederId: () => femaleBreederId,
    );
  }

  void setType(String type) {
    _addLitterModel = _addLitterModel.copyWith(
      type: () => type,
    );
  }


}
