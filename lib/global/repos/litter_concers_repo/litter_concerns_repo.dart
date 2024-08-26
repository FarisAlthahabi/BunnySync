import 'package:bunny_sync/global/dio/dio_client.dart';
import 'package:bunny_sync/global/dio/exceptions.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/models/butcher_litter_model/butcher_litter_model.dart';
import 'package:bunny_sync/global/models/save_sell_litter_model/save_sell_litter_model.dart';
import 'package:injectable/injectable.dart';

part 'http_litter_concerns_repo.dart';

abstract class LitterConcernsRepo {
  Future<void> saveSell(
    int litterId,
    SaveSellLitterModel saveSellLitterModel,
  );

  Future<void> butcher(
    int litterId,
    ButcherLitterModel butcherLitterModel,
  );
}
