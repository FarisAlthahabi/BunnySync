part of 'litter_concerns_repo.dart';

@Injectable(as: LitterConcernsRepo)
class HttpLitterConcernsRepo implements LitterConcernsRepo {
  final DioClient _dioClient = DioClient();

  @override
  Future<void> saveSell(
    int litterId,
    SaveSellLitterModel saveSellLitterModel,
  ) async {
    try {
      await _dioClient.post(
        '/litters/$litterId/save-sell/',
        data: saveSellLitterModel.toJson(),
      );
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }

  @override
  Future<void> saveWeight(
    int litterId,
    SaveWeightLitterModel saveWeightLitterModel,
  ) async {
    try {
      await _dioClient.post(
        '/litters/$litterId/save-weigh',
        data: saveWeightLitterModel.toJson(),
      );
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }

  @override
  Future<void> butcher(
    int litterId,
    ButcherLitterModel butcherLitterModel,
  ) async {
    try {
      await _dioClient.post(
        '/litters/$litterId/save-butcher',
        data: butcherLitterModel.toJson(),
      );
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
