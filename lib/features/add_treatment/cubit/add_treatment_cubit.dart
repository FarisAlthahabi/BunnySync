import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/add_treatment/model/treatment_post_model/treatment_post_model.dart';
import 'package:bunny_sync/features/add_treatment/repo/add_treatment_repo.dart';
import 'package:bunny_sync/features/health/model/treatment_model/treatment_model.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/add_treatment_state.dart';

part 'states/general_add_treatment_state.dart';

@injectable
class AddTreatmentCubit extends Cubit<GeneralAddTreatmentState> {
  AddTreatmentCubit(this._addTreatmentRepo) : super(AddTreatmentInitial());

  final AddTreatmentRepo _addTreatmentRepo;

  TreatmentPostModel _treatmentPostModel = const TreatmentPostModel();

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

  void setDosageType(String? dosageType) {
    _treatmentPostModel = _treatmentPostModel.copyWith(
      dosageType: () => dosageType,
    );
  }

  void setDosageCountPer(String? dosageCountPer) {
    _treatmentPostModel = _treatmentPostModel.copyWith(
      dosageCountPer: () => int.tryParse(dosageCountPer ?? '0'),
    );
  }

  void setDosageTypePer(String? dosageTypePer) {
    _treatmentPostModel = _treatmentPostModel.copyWith(
      dosageTypePer: () => dosageTypePer,
    );
  }

  void setScheduleCount(String? scheduleCount) {
    _treatmentPostModel = _treatmentPostModel.copyWith(
      scheduleCount: () => int.tryParse(scheduleCount ?? '0'),
    );
  }

  void setScheduleType(String? scheduleType) {
    _treatmentPostModel = _treatmentPostModel.copyWith(
      scheduleType: () => scheduleType,
    );
  }

  void setWithDrawalCount(String? withDrawalCount) {
    _treatmentPostModel = _treatmentPostModel.copyWith(
      withDrawalCount: () => int.tryParse(withDrawalCount ?? '0'),
    );
  }

  void setWithDrawalType(String? withDrawalType) {
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
