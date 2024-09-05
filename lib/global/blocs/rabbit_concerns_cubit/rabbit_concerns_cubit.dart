import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/breeders/models/breed_time_types/breed_time_types.dart';
import 'package:bunny_sync/features/litter_details/model/breeder_pair_model/breeder_pair_model.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/models/breed_model/breed_model.dart';
import 'package:bunny_sync/global/models/save_birth_model/save_birth_model.dart';
import 'package:bunny_sync/global/models/save_butcher_model/save_butcher_model.dart';
import 'package:bunny_sync/global/models/save_sell_model/save_sell_model.dart';
import 'package:bunny_sync/global/models/weight_model/weight_model.dart';
import 'package:bunny_sync/global/repos/rabbit_concerns_repo/rabbit_concerns_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/save_butcher_state.dart';

part 'states/save_sell_state.dart';

part 'states/save_birth_state.dart';

part 'states/breed_state.dart';

part 'states/set_active_state.dart';

part 'states/update_breeder_weight_state.dart';

part 'states/breeder_weights_state.dart';

part 'states/general_rabbit_concerns_state.dart';

@injectable
class RabbitConcernsCubit extends Cubit<GeneralRabbitConcernsState> {
  RabbitConcernsCubit(this._rabbitConcernsRepo)
      : super(GeneralInitialRabbitConcernsState());

  final RabbitConcernsRepo _rabbitConcernsRepo;

  SaveButcherModel _saveButcherModel = const SaveButcherModel();

  SaveSellModel _saveSellModel = const SaveSellModel();

  SaveBirthModel _saveBirthModel = const SaveBirthModel();

  BreedModel _breedModel = const BreedModel();

  void setButcherDate(DateTime date) {
    _saveButcherModel = _saveButcherModel.copyWith(
      date: () => date,
    );
  }

  void setButcherPreWeight(String preWeight) {
    _saveButcherModel = _saveButcherModel.copyWith(
      preWeight: () => double.tryParse(preWeight),
    );
  }

  void setButcherWeight(String weight) {
    _saveButcherModel = _saveButcherModel.copyWith(
      weight: () => double.tryParse(weight),
    );
  }

  void setButcherPrice(String price) {
    _saveButcherModel = _saveButcherModel.copyWith(
      price: () => double.tryParse(price),
    );
  }

  void setSellPrice(String price) {
    _saveSellModel = _saveSellModel.copyWith(
      price: () => double.tryParse(price),
    );
  }

  void setCustomerId(int? customerId) {
    _saveSellModel = _saveSellModel.copyWith(
      customerId: () => customerId,
    );
  }

  void setSellDate(DateTime date) {
    _saveSellModel = _saveSellModel.copyWith(
      date: () => date,
    );
  }

  void setBirthBreederPairId(int? breederPairId) {
    _saveBirthModel = _saveBirthModel.copyWith(
      breederPairId: () => breederPairId,
    );
  }

  void setBirthLitterId(String? litterId) {
    _saveBirthModel = _saveBirthModel.copyWith(
      litterId: () => litterId,
    );
  }

  void setBirthLiveKits(String liveKits) {
    _saveBirthModel = _saveBirthModel.copyWith(
      liveKits: () => int.tryParse(liveKits),
    );
  }

  void setBirthDeadKits(String deadKits) {
    _saveBirthModel = _saveBirthModel.copyWith(
      deadKits: () => int.tryParse(deadKits),
    );
  }

  void setBreedMaleBreederId(int? maleBreederId) {
    _breedModel = _breedModel.copyWith(
      maleBreederId: () => maleBreederId,
    );
  }

  void setBreedFemaleBreederId(int? femaleBreederId) {
    _breedModel = _breedModel.copyWith(
      femaleBreederId: () => femaleBreederId,
    );
  }

  void setBreedTimeType(BreedTimeTypes? breedTimeType) {
    _breedModel = _breedModel.copyWith(
      breedTimeType: () => breedTimeType,
    );
  }

  void setBreedDate(DateTime date) {
    _breedModel = _breedModel.copyWith(
      date: () => date,
    );
  }

  Future<void> saveButcher(int breederId) async {
    emit(SaveButcherLoading());

    try {
      await _rabbitConcernsRepo.saveButcher(
        breederId,
        _saveButcherModel,
      );
      emit(SaveButcherSuccess(breederId));
    } catch (e, s) {
      addError(e, s);
      emit(SaveButcherFail(e.toString()));
    }
  }

  Future<void> saveSell(int breederId) async {
    emit(SaveSellLoading());

    try {
      await _rabbitConcernsRepo.saveSell(
        breederId,
        _saveSellModel,
      );
      emit(SaveSellSuccess());
    } catch (e, s) {
      addError(e, s);
      emit(SaveSellFail(e.toString()));
    }
  }

  Future<void> saveBirth() async {
    emit(SaveBirthLoading());
    try {
      if ((_saveBirthModel.liveKits) < 1) {
        throw 'live_kits_count_error'.i18n;
      }

      if (_saveBirthModel.liveKits + _saveBirthModel.deadKits > 25) {
        throw 'total_kits_count_error'.i18n;
      }
      await _rabbitConcernsRepo.saveBirth(
        _saveBirthModel,
      );
      emit(SaveBirthSuccess());
    } catch (e, s) {
      addError(e, s);
      emit(SaveBirthFail(e.toString()));
    }
  }

  Future<void> breed() async {
    emit(BreedLoading());

    try {
      final response = await _rabbitConcernsRepo.breed(
        _breedModel,
      );
      emit(BreedSuccess(response));
    } catch (e, s) {
      addError(e, s);
      emit(BreedFail(e.toString()));
    }
  }

  Future<void> setActive({int? breederId, int? litterId}) async {
    emit(SetActiveLoading());

    try {
      await _rabbitConcernsRepo.setActive(
        breederId: breederId,
        litterId: litterId,
      );
      emit(SetActiveSuccess());
    } catch (e, s) {
      addError(e, s);
      emit(SetActiveFail(e.toString()));
    }
  }
}
