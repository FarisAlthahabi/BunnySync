import 'package:bunny_sync/features/breeders/models/breeders_model/breeders_model.dart';
import 'package:bunny_sync/features/breeders/models/search_breeder_request_model/search_breeder_request_model.dart';
import 'package:bunny_sync/features/breeders/models/search_breeder_request_model/search_entry_model/search_entry_model.dart';
import 'package:bunny_sync/features/breeders/models/search_breeder_request_model/search_model/search_model.dart';
import 'package:bunny_sync/global/dio/dio_client.dart';
import 'package:bunny_sync/global/dio/exceptions.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:injectable/injectable.dart';

part 'http_breeders_repo.dart';

abstract class BreedersRepo {
  Future<BreedersModel> getBreeders();

  Future<BreedersModel> getSearchedBreeders(String breederName);
}
