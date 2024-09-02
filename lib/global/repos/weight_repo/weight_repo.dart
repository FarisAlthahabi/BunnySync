import 'package:bunny_sync/features/weight/models/weightable_model/weightable_model.dart';
import 'package:bunny_sync/global/dio/dio_client.dart';
import 'package:bunny_sync/global/dio/exceptions.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/models/weight_model/weight_model.dart';
import 'package:bunny_sync/global/models/weight_post_model/weight_post_model.dart';
import 'package:injectable/injectable.dart';

part 'http_weight_repo.dart';

abstract class WeightRepo {
  Future<List<WeightModel>> getEntityWeights(
    WeightableModel weightableModel,
  );

  Future<void> addWeight(
    WeightableModel weightableModel,
    WeightPostModel weightPostModel,
  );

  Future<void> updateWeight(
    WeightableModel weightableModel,
    WeightPostModel weightPostModel, {
    int? weightId,
  });
}
