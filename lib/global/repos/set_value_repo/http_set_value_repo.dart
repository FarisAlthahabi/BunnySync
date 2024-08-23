part of 'set_value_repo.dart';

@Injectable(as: SetValueRepo)
class HttpSetValueRepo implements SetValueRepo {
  final DioClient _dioClient = DioClient();

  @override
  Future<void> saveButcher(
    int breederId,
    SaveButcherModel saveButcherModel,
  ) async {
    try {
      await _dioClient.post(
        '/breeders/$breederId/save-butcher',
        data: saveButcherModel.toJson(),
      );
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }

  @override
  Future<void> saveSell(
    int breederId,
    SaveSellModel saveSellModel,
  ) async {
    try {
      await _dioClient.post(
        '/breeders/$breederId/save-sell',
        data: saveSellModel.toJson(),
      );
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
