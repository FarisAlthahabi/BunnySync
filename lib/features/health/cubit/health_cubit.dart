import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/health/model/ailment_model/ailment_fake_model.dart';
import 'package:bunny_sync/features/health/model/ailment_model/ailment_model.dart';
import 'package:bunny_sync/features/health/model/treatment_model/treatment_fake_model.dart';
import 'package:bunny_sync/features/health/model/treatment_model/treatment_model.dart';
import 'package:bunny_sync/features/health/repo/health_repo.dart';
import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/general_health_state.dart';

part 'states/ailments_state.dart';

part 'states/treatments_state.dart';

part 'states/delete_ailment_state.dart';

part 'states/delete_treatment_state.dart';

@injectable
class HealthCubit extends Cubit<GeneralHealthState> {
  HealthCubit(this._healthRepo) : super(GeneralInitialState());

  final HealthRepo _healthRepo;

  List<AilmentModel> ailments = [];

  List<TreatmentModel> treatments = [];

  Future<void> getAilments({int? breederId}) async {
    emit(AilmentsLoading(fakeAilments));

    try {
      final ailments = await _healthRepo.getAilments(
        breederId: breederId,
      );
      this.ailments = ailments;
      if (ailments.isEmpty) {
        emit(AilmentsEmpty("ailments_empty".i18n));
      } else {
        emit(AilmentsSuccess(ailments));
      }
    } catch (e, s) {
      addError(e, s);
      emit(AilmentsFail(e.toString()));
    }
  }

  Future<void> getTreatments({int? breederId}) async {
    emit(TreatmentsLoading(fakeTreatments));

    try {
      final treatments = await _healthRepo.getTreatments(
        breederId: breederId,
      );
      this.treatments = treatments;
      if (treatments.isEmpty) {
        emit(TreatmentsEmpty("treatments_empty".i18n));
      } else {
        emit(TreatmentsSuccess(treatments));
      }
    } catch (e, s) {
      addError(e, s);
      emit(TreatmentsFail(e.toString()));
    }
  }

  void addAilment(AilmentModel ailment) {
    ailments.add(ailment);
    emit(AilmentsSuccess(ailments));
  }

  void addTreatment(TreatmentModel treatment) {
    treatments.add(treatment);
    emit(TreatmentsSuccess(treatments));
  }

  void updateAilment(AilmentModel ailment) {
    ailments = ailments.map((e) {
      if (e.id == ailment.id) {
        return ailment;
      }
      return e;
    }).toList();
    emit(AilmentsSuccess(ailments));
  }

  void updateTreatment(TreatmentModel treatment) {
    treatments = treatments.map((e) {
      if (e.id == treatment.id) {
        return treatment;
      }
      return e;
    }).toList();
    emit(TreatmentsSuccess(treatments));
  }

  Future<void> deleteAilment(int ailmentId) async {
    emit(DeleteAilmentLoading());

    try {
      await _healthRepo.deleteAilment(ailmentId);
      ailments.removeWhere(
        (element) => element.id == ailmentId,
      );
      emit(DeleteAilmentSuccess());
      if (ailments.isEmpty) {
        emit(AilmentsEmpty("ailments_empty".i18n));
      } else {
        emit(AilmentsSuccess(ailments));
      }
    } catch (e, s) {
      addError(e, s);
      emit(DeleteAilmentFail(e.toString()));
    }
  }

  Future<void> deleteTreatment(int treatmentId) async {
    emit(DeleteTreatmentLoading());

    try {
      await _healthRepo.deleteTreatment(treatmentId);
      treatments.removeWhere(
        (element) => element.id == treatmentId,
      );
      emit(DeleteTreatmentSuccess());
      if (treatments.isEmpty) {
        emit(TreatmentsEmpty("treatments_empty".i18n));
      } else {
        emit(TreatmentsSuccess(treatments));
      }
    } catch (e, s) {
      addError(e, s);
      emit(DeleteTreatmentFail(e.toString()));
    }
  }
}
