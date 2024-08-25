import 'package:bunny_sync/global/dio/dio_client.dart';
import 'package:bunny_sync/global/dio/exceptions.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/models/save_weight_litter_model/save_weight_litter_model.dart';
import 'package:bunny_sync/global/models/weight_post_model/weight_post_model.dart';
import 'package:bunny_sync/global/utils/enums/entity_types.dart';
import 'package:injectable/injectable.dart';

part 'http_weight_repo.dart';

abstract class WeightRepo {
  Future<void> updateWeight(
    EntityTypes entityType, {
    WeightPostModel? weightPostModel,
    SaveWeightLitterModel? saveWeightLitterModel,
    int? weightId,
    int? litterId,
    int? kitId,
  });
}
