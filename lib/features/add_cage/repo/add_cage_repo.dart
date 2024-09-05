import 'package:bunny_sync/features/add_cage/model/cage_post_model/cage_post_model.dart';
import 'package:bunny_sync/features/cage_cards/model/cage_model/cage_model.dart';
import 'package:bunny_sync/global/dio/dio_client.dart';
import 'package:bunny_sync/global/dio/exceptions.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:injectable/injectable.dart';

part 'http_add_cage_repo.dart';

abstract class AddCageRepo {
  Future<CageModel> addCage(
    CagePostModel cagePostModel, {
    int? cageId,
  });

  Future<CageModel> updateCage(
    CagePostModel cagePostModel,
    int cageId,
  );
}
