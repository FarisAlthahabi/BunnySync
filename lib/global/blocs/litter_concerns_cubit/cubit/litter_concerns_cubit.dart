import 'package:bloc/bloc.dart';
import 'package:bunny_sync/global/models/butcher_litter_model/butcher_litter_model.dart';
import 'package:bunny_sync/global/models/save_sell_litter_model/save_sell_litter_model.dart';
import 'package:bunny_sync/global/repos/litter_concers_repo/litter_concerns_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/save_sell_litter_state.dart';

part 'states/save_weight_litter_state.dart';

part 'states/butcher_litter_state.dart';

part 'states/set_litter_butcher_type_state.dart';

part 'states/general_litter_concerns_state.dart';

@injectable
class LitterConcernsCubit extends Cubit<GeneralLitterConcernsState> {
  LitterConcernsCubit(this._litterConcernsRepo)
      : super(GeneralInitialLitterConcernsState());

  final LitterConcernsRepo _litterConcernsRepo;

  SaveSellLitterModel _saveSellLitterModel = const SaveSellLitterModel();

  ButcherLitterModel _butcherLitterModel = const ButcherLitterModel();

  final Map<String, double> pricesMap = {};

  final Map<String, double> weightsMap = {};

  final Map<String, double> butcherPricesMap = {};

  final Map<String, double> butcherWeightsMap = {};

  final Map<String, double> butcherPreWeightsMap = {};

  void setSellType(bool? sellType) {
    _saveSellLitterModel = _saveSellLitterModel.copyWith(
      sellType: () => sellType,
    );
  }

  void setSellPrices(String prices, {int? kitId}) {
    dynamic value;

    if (_saveSellLitterModel.sellType && kitId != null) {
      pricesMap["$kitId"] = double.parse(prices);
      value = pricesMap;
    } else {
      value = double.tryParse(prices);
    }

    _saveSellLitterModel = _saveSellLitterModel.copyWith(
      prices: () => value,
    );
  }

  void setCustomerId(int? customerId) {
    _saveSellLitterModel = _saveSellLitterModel.copyWith(
      customerId: () => customerId,
    );
  }

  void setSellDate(DateTime date) {
    _saveSellLitterModel = _saveSellLitterModel.copyWith(
      date: () => date,
    );
  }

  void setButcherType(bool? butcherType) {
    if (butcherType == null) return;

    _butcherLitterModel = _butcherLitterModel.copyWith(
      butcherType: () => butcherType,
    );

    emit(SetLitterButcherTypeState(butcherType));
  }

  void setButcherDate(DateTime date) {
    _butcherLitterModel = _butcherLitterModel.copyWith(
      date: () => date,
    );
  }

  void setButcherWeight(String butcherWeights, {int? kitId}) {
    if (_butcherLitterModel.butcherType && kitId != null) {
      try {
        butcherWeightsMap["$kitId"] = double.parse(butcherWeights);
      } catch (e) {
        if (butcherWeights.isNotEmpty) {
          emit(ButcherLitterFail("Invalid Weight"));
        }
      }
      _butcherLitterModel = _butcherLitterModel.copyWith(
        weights: () => butcherWeightsMap,
      );
    } else {
      try {
        _butcherLitterModel = _butcherLitterModel.copyWith(
          weight: () => double.parse(butcherWeights),
        );
      } catch (e) {
        if (butcherWeights.isNotEmpty) {
          emit(ButcherLitterFail("Invalid Weight"));
        }
      }
    }
  }

  void setButcherPreWeight(String butcherPreWeights, {int? kitId}) {
    if (_butcherLitterModel.butcherType && kitId != null) {
      try {
        butcherPreWeightsMap["$kitId"] = double.parse(butcherPreWeights);
      } catch (e) {
        if (butcherPreWeights.isNotEmpty) {
          emit(ButcherLitterFail("Invalid Weight"));
        }
      }
      _butcherLitterModel = _butcherLitterModel.copyWith(
        preWeights: () => butcherPreWeightsMap,
      );
    } else {
      try {
        _butcherLitterModel = _butcherLitterModel.copyWith(
          preWeight: () => double.parse(butcherPreWeights),
        );
      } catch (e) {
        if (butcherPreWeights.isNotEmpty) {
          emit(ButcherLitterFail("Invalid Weight"));
        }
      }
    }
  }

  void setButcherPrice(String butcherPrices, {int? kitId}) {
    if (_butcherLitterModel.butcherType && kitId != null) {
      try {
        butcherPricesMap["$kitId"] = double.parse(butcherPrices);
      } catch (e) {
        if (butcherPrices.isNotEmpty) {
          emit(ButcherLitterFail("Invalid Price"));
        }
      }
      _butcherLitterModel = _butcherLitterModel.copyWith(
        prices: () => butcherPricesMap,
      );
    } else {
      try {
        _butcherLitterModel = _butcherLitterModel.copyWith(
          price: () => double.parse(butcherPrices),
        );
      } catch (e) {
        if (butcherPrices.isNotEmpty) {
          emit(ButcherLitterFail("Invalid Price"));
        }
      }
    }
  }

  Future<void> saveSell(int litterId) async {
    emit(SaveSellLitterLoading());

    try {
      await _litterConcernsRepo.saveSell(
        litterId,
        _saveSellLitterModel,
      );
      emit(SaveSellLitterSuccess());
    } catch (e, s) {
      addError(e, s);
      emit(SaveSellLitterFail(e.toString()));
    }
  }

  Future<void> butcher(int litterId) async {
    emit(ButcherLitterLoading());

    try {
      await _litterConcernsRepo.butcher(
        litterId,
        _butcherLitterModel,
      );
      emit(ButcherLitterSuccess());
    } catch (e, s) {
      addError(e, s);
      emit(ButcherLitterFail(e.toString()));
    }
  }
}
