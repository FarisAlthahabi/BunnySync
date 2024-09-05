import 'package:bunny_sync/features/reports/models/breeder_mortality_model/breeder_mortality_model.dart';
import 'package:bunny_sync/features/reports/models/cause_death_model/cause_death_model.dart';
import 'package:bunny_sync/features/reports/models/doe_cost_model/doe_cost_model.dart';
import 'package:bunny_sync/features/reports/models/gestation_days_model/gestation_days_model.dart';
import 'package:bunny_sync/features/reports/models/kit_mortality_model/kit_mortality_model.dart';
import 'package:bunny_sync/features/reports/models/kit_weight_report_model/kit_weight_report_model.dart';
import 'package:bunny_sync/features/reports/models/litter_size_model/litter_size_model.dart';
import 'package:bunny_sync/features/reports/models/live_and_dead_model/live_and_dead_model.dart';
import 'package:bunny_sync/features/reports/models/rabbit_misses_model/rabbit_misses_model.dart';
import 'package:bunny_sync/features/reports/models/report_stats_model/report_stats_model.dart';
import 'package:bunny_sync/features/reports/models/survival_rate_model/survival_rate_model.dart';
import 'package:bunny_sync/global/dio/dio_client.dart';
import 'package:bunny_sync/global/dio/exceptions.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:injectable/injectable.dart';

part 'http_reports_repo.dart';

abstract class ReportsRepo {
  Future<ReportStatsModel> getReportStats();

  Future<LitterSizeModel> getLitterSize();

  Future<DoeCostModel> getDoeCost();

  Future<SurvivalRateModel> getSurvivalRate();

  Future<LiveAndDeadModel> getLiveAndDead();

  Future<KitWeightReportModel> getKitWeightReport();

  Future<CauseDeathModel> getCauseDeath();

  Future<GestationDaysModel> getGestationDays();

  Future<RabbitMissesModel> getRabbitMisses(String rabbitgender);

  Future<List<KitMortalityModel>> getKitMortality();

  Future<List<BreederMortalityModel>> getBreederMortality();
}
