import 'package:bunny_sync/features/breeder_details/models/breeder_details_response_model/breeder_details_response_model.dart';
import 'package:bunny_sync/global/dio/dio_client.dart';
import 'package:bunny_sync/global/dio/exceptions.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/models/response_model/response_model.dart';
import 'package:injectable/injectable.dart';

part 'http_breeder_details_repo.dart';

abstract class BreederDetailsRepo{

  Future<ResponseModel<BreederDetailsResponseModel>>getBreederDetails(int id);
}
