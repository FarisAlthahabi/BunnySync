import 'package:bunny_sync/features/add_litter/model/add_litter_model/add_litter_model.dart';
import 'package:bunny_sync/global/dio/dio_client.dart';
import 'package:bunny_sync/global/dio/exceptions.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/models/response_model/response_model.dart';
import 'package:injectable/injectable.dart';

part 'http_add_litter_repo.dart';

abstract class AddLitterRepo {
  Future<ResponseModel<List<dynamic>>> addLitter(AddLitterModel addLitterModel);
}
