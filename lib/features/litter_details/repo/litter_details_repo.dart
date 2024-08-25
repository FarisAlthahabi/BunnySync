import 'package:bunny_sync/features/litter_details/model/litter_details_response_model/litter_details_response_model.dart';
import 'package:bunny_sync/global/dio/dio_client.dart';
import 'package:bunny_sync/global/dio/exceptions.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:injectable/injectable.dart';

part 'http_litter_details_repo.dart';

abstract class LitterDetailsRepo {
  Future<LitterDetailsResponseModel> getLitterDetails(int id);

  Future<void> deleteKit({required int litterId, required int kitId});
}
