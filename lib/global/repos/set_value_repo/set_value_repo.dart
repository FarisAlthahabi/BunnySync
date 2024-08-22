import 'package:bunny_sync/global/dio/dio_client.dart';
import 'package:bunny_sync/global/dio/exceptions.dart';
import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:bunny_sync/global/models/save_butcher_model/save_butcher_model.dart';
import 'package:injectable/injectable.dart';

part 'http_set_value_repo.dart';

abstract class SetValueRepo {
  Future<void> saveButcher(
    int breederId,
    SaveButcherModel saveButcherModel,
  );
}
