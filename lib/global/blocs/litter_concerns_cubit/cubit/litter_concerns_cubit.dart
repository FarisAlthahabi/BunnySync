import 'package:bloc/bloc.dart';
import 'package:bunny_sync/global/models/butcher_litter_model/butcher_litter_model.dart';
import 'package:bunny_sync/global/models/save_sell_litter_model/save_sell_litter_model.dart';
import 'package:bunny_sync/global/repos/litter_concers_repo/litter_concerns_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/save_sell_litter_state.dart';

part 'states/save_weight_litter_state.dart';

part 'states/butcher_litter_state.dart';

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
    //TODO : fix this
    // if (_saveSellLitterModel.sellType &&
    //     _saveSellLitterModel.prices is! Map<String, double>) {
    //   emit(SaveSellLitterFail('if sell type is on, prices should be plural'));
    //   return;
    // }

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
    _butcherLitterModel = _butcherLitterModel.copyWith(
      butcherType: () => butcherType,
    );
  }

  void setButcherDate(DateTime date) {
    _butcherLitterModel = _butcherLitterModel.copyWith(
      date: () => date,
    );
  }

  void setButcherWeight(String butcherWeights, {int? kitId}) {
    dynamic value;

    if (_butcherLitterModel.butcherType && kitId != null) {
      butcherWeightsMap["$kitId"] = double.parse(butcherWeights);
      value = butcherWeightsMap;
    } else {
      value = double.tryParse(butcherWeights);
    }

    _butcherLitterModel = _butcherLitterModel.copyWith(
      weight: () => value,
    );
  }

  void setButcherPreWeight(String butcherPreWeights, {int? kitId}) {
    dynamic value;

    if (_butcherLitterModel.butcherType && kitId != null) {
      butcherPreWeightsMap["$kitId"] = double.parse(butcherPreWeights);
      value = butcherPreWeightsMap;
    } else {
      value = double.tryParse(butcherPreWeights);
    }

    _butcherLitterModel = _butcherLitterModel.copyWith(
      preWeight: () => value,
    );
  }

  void setButcherPrice(String butcherPrices, {int? kitId}) {
    dynamic value;

    if (_butcherLitterModel.butcherType && kitId != null) {
      butcherPricesMap["$kitId"] = double.parse(butcherPrices);
      value = butcherPricesMap;
    } else {
      value = double.tryParse(butcherPrices);
    }

    _butcherLitterModel = _butcherLitterModel.copyWith(
      price: () => value,
    );
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
