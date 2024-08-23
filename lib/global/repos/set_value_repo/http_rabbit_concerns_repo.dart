part of 'rabbit_concerns_repo.dart';

@Injectable(as: RabbitConcernsRepo)
class HttpRabbitConcernsRepo implements RabbitConcernsRepo {
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

  @override
  Future<void> saveBirth(SaveBirthModel saveBirthModel) async {
    try {
      await _dioClient.post(
        '/breeders/save-record-birth',
        data: saveBirthModel.toJson(),
      );
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }

  @override
  Future<BreederPairModel> breed(BreedModel breedModel) async {
    try {
      final response = await _dioClient.post(
        '/breeders/save-breed',
        data: breedModel.toJson(),
      );

      final data = (response.data as Map<String, dynamic>)['data']
          as Map<String, dynamic>;

      return BreederPairModel.fromJson(
        data['breederPair'] as Map<String, dynamic>,
      );
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}