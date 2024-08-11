import 'package:bunny_sync/features/add_ailment/model/ailment_post_model/ailment_post_model.dart';
import 'package:bunny_sync/features/health/model/ailment_model/ailment_model.dart';
import 'package:bunny_sync/global/dio/dio_client.dart';
import 'package:bunny_sync/global/dio/exceptions.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:injectable/injectable.dart';

part 'http_add_ailment_repo.dart';

abstract class AddAilmentRepo {
  Future<AilmentModel> addAilment(
    AilmentPostModel ailmentPostModel,
  );

  Future<AilmentModel> updateAilment(
    AilmentPostModel ailmentPostModel,
    int ailmentId,
  );
}
