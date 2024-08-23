part of 'health_repo.dart';

@Injectable(as: HealthRepo)
class HttpHealthRepo implements HealthRepo {
  final DioClient _dioClient = DioClient();

  @override
  Future<List<AilmentModel>> getAilments({int? breederId}) async {
    try {
      final response = await _dioClient.post(
        breederId == null ?
        '/health/ailment/data':
        '/health/ailment/data?breeder_id=$breederId',
      );

      final body = (response.data as Map<String, dynamic>)['data'] as List;

      return List.generate(
        body.length,
        (index) => AilmentModel.fromJson(body[index] as Map<String, dynamic>),
      );
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
  
  @override
  Future<List<TreatmentModel>> getTreatments({int? breederId}) async{
    try {
      final response = await _dioClient.post(
        breederId == null ?
        '/health/treatment/data':
        '/health/treatment/data?breeder_id=$breederId',
      );

      final body = (response.data as Map<String, dynamic>)['data'] as List;

      return List.generate(
        body.length,
        (index) => TreatmentModel.fromJson(body[index] as Map<String, dynamic>),
      );
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
  
  @override
  Future<void> deleteAilment(int ailmentId)async {
    try {
       await _dioClient.delete(
        '/health/ailment/$ailmentId',
      );
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
  
  @override
  Future<void> deleteTreatment(int treatmentId) async{
    try {
       await _dioClient.delete(
        '/health/treatment/$treatmentId',
      );
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
