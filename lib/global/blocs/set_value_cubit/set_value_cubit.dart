import 'package:bloc/bloc.dart';
import 'package:bunny_sync/global/models/save_butcher_model/save_butcher_model.dart';
import 'package:bunny_sync/global/models/save_sell_model/save_sell_model.dart';
import 'package:bunny_sync/global/repos/set_value_repo/set_value_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/save_butcher_state.dart';

part 'states/save_sell_state.dart';

part 'states/general_set_value_state.dart';

@injectable
class SetValueCubit extends Cubit<GeneralSetValueState> {
  SetValueCubit(this._setValueRepo) : super(GeneralInitialSetValueState());

  final SetValueRepo _setValueRepo;

  SaveButcherModel _saveButcherModel = const SaveButcherModel();

  SaveSellModel _saveSellModel = const SaveSellModel();

  void setDate(DateTime date) {
    _saveButcherModel = _saveButcherModel.copyWith(
      date: () => date,
    );
  }

  void setPreWeight(String preWeight) {
    _saveButcherModel = _saveButcherModel.copyWith(
      preWeight: () =>double.tryParse(preWeight) ,
    );
  }

  void setWeight(String weight) {
    _saveButcherModel = _saveButcherModel.copyWith(
      weight: () => double.tryParse(weight),
    );
  }

  void setPrice(String price) {
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



  Future<void> saveButcher(int breederId) async {
    emit(SaveButcherLoading());

    try {
      await _setValueRepo.saveButcher(
        breederId,
        _saveButcherModel,
      );
      emit(SaveButcherSuccess());
    } catch (e, s) {
      addError(e, s);
      emit(SaveButcherFail(e.toString()));
    }
  }

  Future<void> saveSell(int breederId) async {
    emit(SaveSellLoading());

    try {
      await _setValueRepo.saveSell(
        breederId,
        _saveSellModel,
      );
      emit(SaveSellSuccess());
    } catch (e, s) {
      addError(e, s);
      emit(SaveSellFail(e.toString()));
    }
  }
}
