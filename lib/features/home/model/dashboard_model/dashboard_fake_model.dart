import 'package:bunny_sync/features/home/model/active_breeders_model/active_breeders_model.dart';
import 'package:bunny_sync/features/home/model/dashboard_model/dashboard_model.dart';
import 'package:bunny_sync/features/home/model/data_status_model/data_status_model.dart';
import 'package:bunny_sync/features/home/model/died_kits_model/died_kits_model.dart';
import 'package:bunny_sync/features/home/model/top_breeder_model/top_breeder_model.dart';
import 'package:bunny_sync/global/gen/assets.gen.dart';

final dashboardFakeModel = DashboardModel(
  activeBreeders: fakeActiveBreeders,
  activeLitters: const [
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
  ],
  kitsToDate: 1,
  diedKits: fakeDiedKits,
  income: 1,
  expense: 1,
  activeCount: 1,
  diedCount: 1,
  kitBreederCount: 1,
  soldCount: 1,
  cullCount: 1,
  archiveCount: 1,
  butcherCount: 1,
  dataStatus: fakeDataStatus,
  kitPercentage: "[100,0,0,0,0,0,]",
  topBreeders: fakeTopBreeders,
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
const fakeDataStatus = DataStatusModel(
  active: 1,
  died: 1,
  kitBreeder: 1,
  sold: 1,
  cull: 1,
  archive: 1,
  butcher: 1,
);
final fakeTopBreeders = List.generate(
  2,
  (index) => TopBreederModel(
    id: index,
    name: 'nux $index',
    live: 2,
    image: Assets.icons.logo.path,
  ),
);
