part of 'add_treatment_repo.dart';

@Injectable(as: AddTreatmentRepo)
class HttpAddTreatmentRepo implements AddTreatmentRepo {
  final DioClient _dioClient = DioClient();

  @override
  Future<TreatmentModel> addTreatment(
    TreatmentPostModel treatmentPostModel,
  ) async {
    try {
      final response = await _dioClient.post(
        '/health/treatment',
        data: treatmentPostModel.toJson(),
      );

      final body = (response.data as Map<String, dynamic>)['data']
          as Map<String, dynamic>;

      return TreatmentModel.fromJson(body['treatment'] as Map<String, dynamic>);
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }

  @override
  Future<TreatmentModel> updateTreatment(
    TreatmentPostModel treatmentPostModel,
    int treatmentId,
  ) async {
    try {
      final response = await _dioClient.put(
        '/health/treatment/$treatmentId',
        data: treatmentPostModel.toJson(),
      );

      final body = (response.data as Map<String, dynamic>)['data']
          as Map<String, dynamic>;

      return TreatmentModel.fromJson(body['treatment'] as Map<String, dynamic>);
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
