import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/reports/models/breeder_mortality_model/breeder_mortality_fake_model.dart';
import 'package:bunny_sync/features/reports/models/breeder_mortality_model/breeder_mortality_model.dart';
import 'package:bunny_sync/features/reports/models/couse_death_model/couse_death_fake_model.dart';
import 'package:bunny_sync/features/reports/models/couse_death_model/couse_death_model.dart';
import 'package:bunny_sync/features/reports/models/doe_cost_model/doe_cost_fake_model.dart';
import 'package:bunny_sync/features/reports/models/doe_cost_model/doe_cost_model.dart';
import 'package:bunny_sync/features/reports/models/gestation_days_model/gestation_days_fake_model.dart';
import 'package:bunny_sync/features/reports/models/gestation_days_model/gestation_days_model.dart';
import 'package:bunny_sync/features/reports/models/kit_mortality_model/kit_mortaality_fake_model.dart';
import 'package:bunny_sync/features/reports/models/kit_mortality_model/kit_mortality_model.dart';
import 'package:bunny_sync/features/reports/models/kit_weight_report_model/kit_weight_report_fake_model.dart';
import 'package:bunny_sync/features/reports/models/kit_weight_report_model/kit_weight_report_model.dart';
import 'package:bunny_sync/features/reports/models/litter_size_model/litter_size_fake_model.dart';
import 'package:bunny_sync/features/reports/models/litter_size_model/litter_size_model.dart';
import 'package:bunny_sync/features/reports/models/live_and_dead_model/live_and_dead_fake_model.dart';
import 'package:bunny_sync/features/reports/models/live_and_dead_model/live_and_dead_model.dart';
import 'package:bunny_sync/features/reports/models/rabbit_misses_model/rabbit_misses_fake_model.dart';
import 'package:bunny_sync/features/reports/models/rabbit_misses_model/rabbit_misses_model.dart';
import 'package:bunny_sync/features/reports/models/report_stats_model/report_stats_fake_model.dart';
import 'package:bunny_sync/features/reports/models/report_stats_model/report_stats_model.dart';
import 'package:bunny_sync/features/reports/models/survival_rate_model/survival_rate_fake_model.dart';
import 'package:bunny_sync/features/reports/models/survival_rate_model/survival_rate_model.dart';
import 'package:bunny_sync/features/reports/repo/reports_repo.dart';
import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/report_stats_state.dart';

part 'states/litter_size_state.dart';

part 'states/doe_cost_state.dart';

part 'states/survival_rate_state.dart';

part 'states/kit_weight_report_state.dart';

part 'states/couse_death_state.dart';

part 'states/live_and_dead_state.dart';

part 'states/gestation_days_state.dart';

part 'states/rabbit_misses_state.dart';

part 'states/kit_mortality_state.dart';

part 'states/breeder_mortality_state.dart';

part 'states/general_reports_state.dart';

@injectable
class ReportsCubit extends Cubit<GeneralReportsState> {
  ReportsCubit(this._reportsRepo) : super(GeneralReportsInitial());

  final ReportsRepo _reportsRepo;

  Future<void> getReportStats() async {
    emit(ReportStatsLoading(reportStatsFake));

    try {
      final response = await _reportsRepo.getReportStats();

      emit(ReportStatsSuccess(response));
    } catch (e, s) {
      addError(e, s);
      emit(ReportStatsFail(e.toString()));
    }
  }

  Future<void> getLitterSize() async {
    emit(LitterSizeLoading(litterSizeFake));

    try {
      final response = await _reportsRepo.getLitterSize();

      emit(LitterSizeSuccess(response));
    } catch (e, s) {
      addError(e, s);
      emit(LitterSizeFail(e.toString()));
    }
  }

  Future<void> getDoeCost() async {
    emit(DoeCostLoading(doeCostFake));

    try {
      final response = await _reportsRepo.getDoeCost();

      emit(DoeCostSuccess(response));
    } catch (e, s) {
      addError(e, s);
      emit(DoeCostFail(e.toString()));
    }
  }

  Future<void> getSurvivalRate() async {
    emit(SurvivalRateLoading(survivalRateFake));

    try {
      final response = await _reportsRepo.getSurvivalRate();

      emit(SurvivalRateSuccess(response));
    } catch (e, s) {
      addError(e, s);
      emit(SurvivalRateFail(e.toString()));
    }
  }

  Future<void> getKitWeightReport() async {
    emit(KitWeightReportLoading(kitWeightReportFake));

    try {
      final response = await _reportsRepo.getKitWeightReport();

      emit(KitWeightReportSuccess(response));
    } catch (e, s) {
      addError(e, s);
      emit(KitWeightReportFail(e.toString()));
    }
  }

  Future<void> getCouseDeath() async {
    emit(CouseDeathLoading(couseDeathFake));

    try {
      final response = await _reportsRepo.getCouseDeath();

      emit(CouseDeathSuccess(response));
    } catch (e, s) {
      addError(e, s);
      emit(CouseDeathFail(e.toString()));
    }
  }

  Future<void> getLiveAndDead() async {
    emit(LiveAndDeadLoading(liveAndDeadFake));

    try {
      final response = await _reportsRepo.getLiveAndDead();

      emit(LiveAndDeadSuccess(response));
    } catch (e, s) {
      addError(e, s);
      emit(LiveAndDeadFail(e.toString()));
    }
  }

  Future<void> getGestationDays() async {
    emit(GestationDaysLoading(gestationDaysFake));

    try {
      final response = await _reportsRepo.getGestationDays();

      emit(GestationDaysSuccess(response));
    } catch (e, s) {
      addError(e, s);
      emit(GestationDaysFail(e.toString()));
    }
  }

  Future<void> getRabbitMisses(String rabbitGender) async {
    emit(RabbitMissesLoading(rabbitMissesFake));

    try {
      final response = await _reportsRepo.getRabbitMisses(rabbitGender);

      emit(RabbitMissesSuccess(response));
    } catch (e, s) {
      addError(e, s);
      emit(RabbitMissesFail(e.toString()));
    }
  }

  Future<void> getKitMortality() async {
    emit(KitMortalityLoading(kitMortalityFake));

    try {
      final response = await _reportsRepo.getKitMortality();

      if(response.isEmpty){
        emit(KitMortalityEmpty("no_data".i18n));
      }else{
        emit(KitMortalitySuccess(response));
      }
      
    } catch (e, s) {
      addError(e, s);
      emit(KitMortalityFail(e.toString()));
    }
  }

  Future<void> getBreederMortality() async {
    emit(BreederMortalityLoading(breederMortalityFake));

    try {
      final response = await _reportsRepo.getBreederMortality();

      if(response.isEmpty){
        emit(BreederMortalityEmpty("no_data".i18n));
      }else{
        emit(BreederMortalitySuccess(response));
      }
      
    } catch (e, s) {
      addError(e, s);
      emit(BreederMortalityFail(e.toString()));
    }
  }
}
