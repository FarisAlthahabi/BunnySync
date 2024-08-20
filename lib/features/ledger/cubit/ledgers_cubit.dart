import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/add_ledger/models/ledger_model/ledger_model.dart';
import 'package:bunny_sync/features/add_ledger/models/ledger_model/ledgers_fake_model.dart';
import 'package:bunny_sync/features/ledger/models/ledger_stats_model/ledger_stats_fake_model.dart';
import 'package:bunny_sync/features/ledger/models/ledger_stats_model/ledger_stats_model.dart';
import 'package:bunny_sync/features/ledger/models/ledger_types.dart';
import 'package:bunny_sync/features/ledger/repo/ledgers_repo.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/ledgers_state.dart';

part 'states/general_ledgers_state.dart';

part 'states/delete_ledger_state.dart';

part 'states/ledger_stats_state.dart';

@injectable
class LedgersCubit extends Cubit<GeneralLedgersState> {
  LedgersCubit(this._ledgersRepo) : super(LedgersInitial());

  final LedgersRepo _ledgersRepo;

  List<LedgerModel> ledgers = [];

  List<LedgerModel> get incomeLedgers =>
      ledgers.where((ledger) => ledger.type == LedgerTypes.income).toList();

  List<LedgerModel> get expensesLedgers =>
      ledgers.where((ledger) => ledger.type == LedgerTypes.expenses).toList();

  List<LedgerModel> get incomePerBreederLedgers => ledgers
      .where(
        (ledger) =>
            ledger.type == LedgerTypes.income && ledger.breederId != null,
      )
      .toList();

  List<LedgerModel> get expensePerBreederLedgers => ledgers
      .where(
        (ledger) =>
            ledger.type == LedgerTypes.expenses && ledger.breederId != null,
      )
      .toList();

  Future<void> getLedgers() async {
    emit(LedgersLoading(ledgersFakeModel));
    try {
      final ledgers = await _ledgersRepo.getLedgers();
      this.ledgers = ledgers;
      if (ledgers.isEmpty) {
        emit(LedgersEmpty('ledgers_empty'.i18n));
      } else {
        emit(LedgersSuccess(ledgers));
      }
    } catch (e, s) {
      addError(e, s);
      emit(LedgersFail(e.toString()));
    }
  }

  void getLedgersByType(LedgerTypes? ledgerType) {
    if (ledgerType == LedgerTypes.income) {
      emit(LedgersSuccess(incomeLedgers));
    } else if (ledgerType == LedgerTypes.expenses) {
      emit(LedgersSuccess(expensesLedgers));
    } else if (ledgerType == LedgerTypes.incomePerBreeder) {
      emit(LedgersSuccess(incomePerBreederLedgers));
    } else if (ledgerType == LedgerTypes.expensesPerBreeder) {
      emit(LedgersSuccess(expensePerBreederLedgers));
    } else {
      emit(LedgersSuccess(ledgers));
    }
  }

  void emitLedgersFail(String error) {
    emit(LedgersFail(error));
  }

  Future<void> getLedgerStats() async {
    emit(LedgerStatsLoading(fakeLedgerStats));
    try {
      final ledgerStats = await _ledgersRepo.getLedgerStats();
      emit(LedgerStatsSuccess(ledgerStats));
    } catch (e, s) {
      addError(e, s);
      emit(LedgerStatsFail(e.toString()));
    }
  }

  void addLedger(LedgerModel ledger) {
    ledgers.add(ledger);
    emit(LedgersSuccess(ledgers));
  }

  void updateLedger(LedgerModel ledger) {
    ledgers = ledgers.map((e) {
      if (e.id == ledger.id) {
        return ledger;
      }
      return e;
    }).toList();
    emit(LedgersSuccess(ledgers));
  }

  Future<void> deleteLedger(int ledgerId) async {
    emit(DeleteLedgerLoading());
    try {
      await _ledgersRepo.deleteLedger(ledgerId);
      ledgers.removeWhere(
        (ledger) => ledger.id == ledgerId,
      );
      emit(DeleteLedgerSuccess());

      if (ledgers.isEmpty) {
        emit(LedgersEmpty('ledgers_empty'.i18n));
      } else {
        emit(LedgersSuccess(ledgers));
      }
    } catch (e, s) {
      addError(e, s);
      emit(DeleteLedgerFail(e.toString()));
    }
  }
}
