import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/add_ledger/models/ledger_model/ledger_model.dart';
import 'package:bunny_sync/features/add_ledger/models/ledger_post_model/ledger_post_model.dart';
import 'package:bunny_sync/features/add_ledger/models/ledger_types/ledger_types.dart';
import 'package:bunny_sync/features/add_ledger/repo/add_ledger_repo.dart';
import 'package:bunny_sync/features/add_task/model/task_types/task_types.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/general_add_ledger_state.dart';

part 'states/add_ledger_state.dart';

part 'states/set_task_type_state.dart';

@injectable
class AddLedgerCubit extends Cubit<GeneralAddLedgerState> {
  AddLedgerCubit(this._addLedgerRepo) : super(AddLedgerInitial());

  final AddLedgerRepo _addLedgerRepo;

  LedgerPostModel _ledgerPostModel = const LedgerPostModel();

  void setTitle(String title) {
    _ledgerPostModel = _ledgerPostModel.copyWith(
      title: () => title,
    );
  }

  void setAmount(String amount) {
    final parsedAmount = double.tryParse(amount);
    if (parsedAmount == null) {
      emit(AddLedgerError('invalid_amount'.i18n));
      return;
    }

    _ledgerPostModel = _ledgerPostModel.copyWith(
      amount: () => parsedAmount,
    );
  }

  void setType(LedgerTypes? type) {
    _ledgerPostModel = _ledgerPostModel.copyWith(
      type: () => type,
    );
  }

  void setTaskType(TaskTypes? taskType) {
    _ledgerPostModel = _ledgerPostModel.copyWith(
      taskType: () => taskType,
    );

    if (taskType != null) {
      emit(SetTaskTypeState(taskType));
    }
  }

  void setWho(int? who) {
    _ledgerPostModel = _ledgerPostModel.copyWith(
      who: () => who,
    );
  }

  void setCustomerId(int? customerId) {
    _ledgerPostModel = _ledgerPostModel.copyWith(
      customerId: () => customerId,
    );
  }

  void setCategoryId(int? categoryId) {
    _ledgerPostModel = _ledgerPostModel.copyWith(
      categoryId: () => categoryId,
    );
  }

  void setDate(DateTime? date) {
    _ledgerPostModel = _ledgerPostModel.copyWith(
      date: () => date,
    );
  }

  void setNote(String note) {
    _ledgerPostModel = _ledgerPostModel.copyWith(
      note: () => note,
    );
  }

  void setFile(String file) {
    _ledgerPostModel = _ledgerPostModel.copyWith(
      file: () => file,
    );
  }

  Future<void> addLedger() async {
    final whoError = _ledgerPostModel.validateWho();

    if (whoError != null) {
      emit(AddLedgerError(whoError));
      return;
    }

    emit(AddLedgerLoading());
    try {
      final response = await _addLedgerRepo.addLedger(_ledgerPostModel);
      emit(AddLedgerSuccess(response));
    } catch (e, s) {
      addError(e, s);
      emit(AddLedgerError(e.toString()));
    }
  }

  Future<void> updateLedger(int ledgerId) async {
    emit(AddLedgerLoading());
    try {
      final response = await _addLedgerRepo.updateLedger(
        _ledgerPostModel,
        ledgerId,
      );
      emit(UpdateLedgerSuccess(response));
    } catch (e, s) {
      addError(e, s);
      emit(AddLedgerError(e.toString()));
    }
  }
}
