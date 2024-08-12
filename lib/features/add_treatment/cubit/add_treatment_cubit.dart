import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/add_treatment/model/dosage_per_types/dosage_per_types.dart';
import 'package:bunny_sync/features/add_treatment/model/dosage_types/dosage_types.dart';
import 'package:bunny_sync/features/add_treatment/model/period_types/period_types.dart';
import 'package:bunny_sync/features/add_treatment/model/treatment_post_model/treatment_post_model.dart';
import 'package:bunny_sync/features/add_treatment/repo/add_treatment_repo.dart';
import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:bunny_sync/features/health/model/treatment_model/treatment_model.dart';
import 'package:bunny_sync/features/litter_details/model/kit_model/kit_model.dart';
import 'package:bunny_sync/features/litters/models/litter_entry_model/litter_entry_model.dart';
import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:bunny_sync/global/utils/enums/rabbit_types.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

part 'states/add_treatment_state.dart';

part 'states/general_add_treatment_state.dart';

part 'states/show_rabbit_type_state.dart';

part 'states/show_select_kit_state.dart';

@injectable
class AddTreatmentCubit extends Cubit<GeneralAddTreatmentState> {
  AddTreatmentCubit(this._addTreatmentRepo) : super(AddTreatmentInitial());

  final AddTreatmentRepo _addTreatmentRepo;

  TreatmentPostModel _treatmentPostModel = const TreatmentPostModel();

  void setRabbitType(RabbitTypes? type) {
    if (type == null) {
      emit(AddTreatmentFail('rabbit_type_null'.i18n));
      return;
    }

    String result;

    ///on represent of create ailment for kits
    if (type.isBreeder == true) {
      result = 'off';
    } else {
      result = 'on';
    }

    _treatmentPostModel = _treatmentPostModel.copyWith(
      type: () => result,
    );

    emit(ShowRabbitTypeState(type));

    if (type.isBreeder == true) {
      setKitId(null);
      emit(ShowSelectKitState(showSelectKit: false));
    }
  }

  void setBreederId(int? breederId) {
    _treatmentPostModel = _treatmentPostModel.copyWith(
      breederId: () => breederId,
      kitId: () => null,
    );
  }

  BreederEntryModel? getSelectedBreeder(List<BreederEntryModel> breeders) {
    return breeders.firstWhereOrNull(
      (element) => element.id == _treatmentPostModel.breederId,
    );
  }

  void setLitter(int litterId, {VoidCallback? onSuccess}) {
    emit(ShowSelectKitState(showSelectKit: true, litterId: litterId));

    onSuccess?.call();
  }

  LitterEntryModel? getSelectedLitter(List<LitterEntryModel> litters) {
    return litters.firstWhereOrNull(
      (element) => element.allKits.any(
        (e) => e.id == _treatmentPostModel.kitId,
      ),
    );
  }

  void setKitId(int? kitId) {
    _treatmentPostModel = _treatmentPostModel.copyWith(
      breederId: () => null,
      kitId: () => kitId,
    );
  }

  KitModel? getSelectedKit(List<KitModel> kits) {
    return kits.firstWhereOrNull(
      (element) => element.id == _treatmentPostModel.kitId,
    );
  }

  void setAilmentId(int? ailmentId) {
    _treatmentPostModel = _treatmentPostModel.copyWith(
      ailmentId: () => ailmentId,
    );
  }

  void setTitle(String? title) {
    _treatmentPostModel = _treatmentPostModel.copyWith(
      title: () => title,
    );
  }

  void setStartDate(DateTime? startDate) {
    _treatmentPostModel = _treatmentPostModel.copyWith(
      startDate: () => startDate,
    );
  }

  void setMedication(String? medication) {
    _treatmentPostModel = _treatmentPostModel.copyWith(
      medication: () => medication,
    );
  }

  void setMethod(String? method) {
    _treatmentPostModel = _treatmentPostModel.copyWith(
      method: () => method,
    );
  }

  void setType(String? type) {
    _treatmentPostModel = _treatmentPostModel.copyWith(
      type: () => type,
    );
  }

  void setDosageCount(String? dosageCount) {
    _treatmentPostModel = _treatmentPostModel.copyWith(
      dosageCount: () => int.tryParse(dosageCount ?? '0'),
    );
  }

  void setDosageType(DosageTypes? dosageType) {
    _treatmentPostModel = _treatmentPostModel.copyWith(
      dosageType: () => dosageType,
    );
  }

  void setDosageCountPer(String? dosageCountPer) {
    _treatmentPostModel = _treatmentPostModel.copyWith(
      dosageCountPer: () => int.tryParse(dosageCountPer ?? '0'),
    );
  }

  void setDosageTypePer(DosagePerTypes? dosageTypePer) {
    _treatmentPostModel = _treatmentPostModel.copyWith(
      dosageTypePer: () => dosageTypePer,
    );
  }

  void setScheduleCount(String? scheduleCount) {
    _treatmentPostModel = _treatmentPostModel.copyWith(
      scheduleCount: () => int.tryParse(scheduleCount ?? '0'),
    );
  }

  void setScheduleType(PeriodTypes? scheduleType) {
    _treatmentPostModel = _treatmentPostModel.copyWith(
      scheduleType: () => scheduleType,
    );
  }

  void setWithDrawalCount(String? withDrawalCount) {
    _treatmentPostModel = _treatmentPostModel.copyWith(
      withDrawalCount: () => int.tryParse(withDrawalCount ?? '0'),
    );
  }

  void setWithDrawalType(PeriodTypes? withDrawalType) {
    _treatmentPostModel = _treatmentPostModel.copyWith(
      withDrawalType: () => withDrawalType,
    );
  }

  void setNote(String? note) {
    _treatmentPostModel = _treatmentPostModel.copyWith(
      note: () => note,
    );
  }

  Future<void> addTreatment() async {
    emit(AddTreatmentLoading());

    try {
      final treatment =
          await _addTreatmentRepo.addTreatment(_treatmentPostModel);
      emit(AddTreatmentSuccess(treatment));
    } catch (e, s) {
      addError(e, s);
      emit(AddTreatmentFail(e.toString()));
    }
  }

  Future<void> updateTreatment(int treatmentId) async {
    emit(AddTreatmentLoading());

    try {
      final treatment = await _addTreatmentRepo.updateTreatment(
        _treatmentPostModel,
        treatmentId,
      );
      emit(UpdateTreatmentSuccess(treatment));
    } catch (e, s) {
      addError(e, s);
      emit(AddTreatmentFail(e.toString()));
    }
  }
}
