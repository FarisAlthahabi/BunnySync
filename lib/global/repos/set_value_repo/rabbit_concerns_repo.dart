import 'package:bunny_sync/features/litter_details/model/breeder_pair_model/breeder_pair_model.dart';
import 'package:bunny_sync/global/dio/dio_client.dart';
import 'package:bunny_sync/global/dio/exceptions.dart';
import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:bunny_sync/global/models/breed_model/breed_model.dart';
import 'package:bunny_sync/global/models/save_birth_model/save_birth_model.dart';
import 'package:bunny_sync/global/models/save_butcher_model/save_butcher_model.dart';
import 'package:bunny_sync/global/models/save_sell_model/save_sell_model.dart';
import 'package:injectable/injectable.dart';

part 'http_rabbit_concerns_repo.dart';

abstract class RabbitConcernsRepo {
  Future<void> saveButcher(
    int breederId,
    SaveButcherModel saveButcherModel,
  );

  Future<void> saveSell(
    int breederId,
    SaveSellModel saveSellModel,
  );

  Future<void> saveBirth(
    SaveBirthModel saveBirthModel,
  );

  Future<BreederPairModel> breed(
    BreedModel breedModel,
  );
}
