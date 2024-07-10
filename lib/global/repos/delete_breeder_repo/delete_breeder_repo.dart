import 'package:bunny_sync/global/dio/dio.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:injectable/injectable.dart';

part 'http_delete_breeder_repo.dart';

abstract class DeleteBreederRepo {
  Future<void> deleteBreeder(int breederId);
}
