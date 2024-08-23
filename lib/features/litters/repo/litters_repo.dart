import 'package:bunny_sync/features/litter_details/model/kit_model/kit_model.dart';
import 'package:bunny_sync/features/litters/models/litters_model/litters_model.dart';
import 'package:bunny_sync/global/dio/dio_client.dart';
import 'package:bunny_sync/global/dio/exceptions.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:injectable/injectable.dart';

part 'http_litters_repo.dart';

abstract class LittersRepo {
  Future<LittersModel> getLitters({int? breederId});

  Future<List<KitModel>> getKits(int litterId);
}
