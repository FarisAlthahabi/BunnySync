import 'package:bunny_sync/features/home/model/active_breeders_model/active_breeders_model.dart';
import 'package:bunny_sync/features/home/model/died_kits_model/died_kits_model.dart';
import 'package:bunny_sync/features/reports/models/report_stats_model/report_stats_model.dart';

const reportStatsFake = ReportStatsModel(
  activeBreeders: fakeActiveBreeders,
  activeLittersCount: 10,
  kitsToDateCount: 1,
  diedKits: fakeDiedKits,
  income: 1,
  expense: 1,
  diedCulled: 3,
  kitsCount: 6,
  sold: 3,
);

const fakeDiedKits = DiedKitsModel(
  diedKitsCount: 0,
  cullKitsCount: 2,
  soldKitsCount: 2,
);
const fakeActiveBreeders = ActiveBreedersModel(
  maleBreedersCount: 2,
  femaleBreedersCount: 2,
  allBreedersCount: 4,
);
