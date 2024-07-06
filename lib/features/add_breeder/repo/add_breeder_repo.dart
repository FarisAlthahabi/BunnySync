import 'package:bunny_sync/features/add_breeder/models/post_add_breeder_model/post_add_breeder_model.dart';
import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:bunny_sync/global/dio/dio_client.dart';
import 'package:bunny_sync/global/dio/exceptions.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/models/response_model/response_model.dart';
import 'package:injectable/injectable.dart';

part 'http_add_breeder_repo.dart';

abstract class AddBreederRepo {
  Future<ResponseModel<BreederEntryModel>> addBreeder(
    PostAddBreederModel postAddBreederModel,
  );
}
