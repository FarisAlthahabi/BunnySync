import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/cage_cards/model/cage_model/cage_fake_model.dart';
import 'package:bunny_sync/features/cage_cards/model/cage_model/cage_model.dart';
import 'package:bunny_sync/features/cage_cards/repo/cage_cards_repo.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/cage_cards_state.dart';

part 'states/general_cage_cards_state.dart';

part 'states/delete_cage_card_state.dart';

@injectable
class CageCardsCubit extends Cubit<GeneralCageCardsState> {
  CageCardsCubit(this._cageCardsRepo) : super(CageCardsInitial());

  final CageCardsRepo _cageCardsRepo;

  List<CageModel> cages = [];

  Future<void> getCageCards() async {
    emit(CageCardsLoading(fakeCages));
    try {
      final cages = await _cageCardsRepo.getCages();
      this.cages = cages;
      if (cages.isEmpty) {
        emit(CageCardsEmpty('cage_cards_empty'.i18n));
      } else {
        emit(CageCardsSuccess(cages));
      }
    } catch (e, s) {
      addError(e, s);
      emit(CageCardsFail(e.toString()));
    }
  }

  void addCageCard(CageModel cage) {
    cages.add(cage);
    emit(CageCardsSuccess(cages));
  }

  void updateCageCard(CageModel cage) {
    cages = cages.map((e) {
      if (e.id == cage.id) {
        return cage;
      }
      return e;
    }).toList();
    emit(CageCardsSuccess(cages));
  }

  Future<void> deleteCageCard(int cageId) async {
    emit(DeleteCageCardLoading());
    try {
      await _cageCardsRepo.deleteCageCard(cageId);
      cages.removeWhere(
        (cage) => cage.id == cageId,
      );
      emit(DeleteCageCardSuccess());

      if (cages.isEmpty) {
        emit(CageCardsEmpty('CageCards_empty'.i18n));
      } else {
        emit(CageCardsSuccess(cages));
      }
    } catch (e, s) {
      addError(e, s);
      emit(DeleteCageCardFail(e.toString()));
    }
  }
}
