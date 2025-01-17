part of 'weight_repo.dart';

@Injectable(as: WeightRepo)
class HttpWeightRepo implements WeightRepo {
  final DioClient _dioClient = DioClient();

  @override
  Future<List<WeightModel>> getEntityWeights(
    WeightableModel weightableModel,
  ) async {
    try {
      final response = await _dioClient.post(
        weightableModel.httpEndpoint,
      );

      final data = (response.data as Map<String, dynamic>)['data'] as List;

      return List.generate(
        data.length,
        (index) => WeightModel.fromJson(data[index] as Map<String, dynamic>),
      );
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }

  @override
  Future<void> addWeight(
    WeightableModel weightableModel,
    WeightPostModel weightPostModel,
  ) async {
    try {
        await _dioClient.post(
        weightableModel.addHttpEndpoint,
        data: weightPostModel.toJson(),
      );
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }

  @override
  Future<void> updateWeight(
    WeightableModel weightableModel,
    WeightPostModel weightPostModel, {
    int? weightId,
  }) async {
    try {
      //TODO : not always post method 
      await _dioClient.post(
        weightableModel.updateHttpEndpoint(
          weightId: weightId,
        ),
        data: weightPostModel.toJson(),
      );
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
