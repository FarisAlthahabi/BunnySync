import 'package:bunny_sync/features/add_kit/models/post_kit_model/post_kit_model.dart';
import 'package:bunny_sync/features/litter_details/model/kit_model/kit_model.dart';
import 'package:bunny_sync/global/dio/dio.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:injectable/injectable.dart';

part 'http_add_kit_repo.dart';

abstract class AddKitRepo {
  Future<KitModel> addKit(int litterId, PostKitModel postKitModel);

  Future<KitModel> updateKit(
    PostKitModel postKitModel, {
    required int litterId,
    required int kitId,
  });
}
