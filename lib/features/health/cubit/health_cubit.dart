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

@injectable
class HealthCubit extends Cubit<GeneralHealthState> {
  HealthCubit(this._healthCubit) : super(GeneralInitialState());

  final HealthRepo _healthCubit;

  List<AilmentModel> ailments = [];

  List<TreatmentModel> treatments = [];

  Future<void> getAilments() async {
    emit(AilmentsLoading(fakeAilments));

    try {
      final ailments = await _healthCubit.getAilments();
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

  Future<void> getTreatments() async {
    emit(TreatmentsLoading(fakeTreatments));

    try {
      final treatments = await _healthCubit.getTreatments();
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
}
