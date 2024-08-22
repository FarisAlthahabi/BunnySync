import 'package:bloc/bloc.dart';
import 'package:bunny_sync/global/models/save_butcher_model/save_butcher_model.dart';
import 'package:bunny_sync/global/repos/set_value_repo/set_value_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/save_butcher_state.dart';

part 'states/general_set_value_state.dart';

@injectable
class SetValueCubit extends Cubit<GeneralSetValueState> {
  SetValueCubit(this._setValueRepo) : super(GeneralInitialSetValueState());

  final SetValueRepo _setValueRepo;

  SaveButcherModel _saveButcherModel = const SaveButcherModel();

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
}
