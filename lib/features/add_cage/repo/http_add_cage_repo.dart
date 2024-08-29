part of 'add_cage_repo.dart';

@Injectable(as: AddCageRepo)
class HttpAddCageRepo implements AddCageRepo {
  final DioClient _dioClient = DioClient();

  @override
  Future<CageModel> addCage(
    CagePostModel cagePostModel, {
    int? cageId,
  }) async {
    try {
      final response = await _dioClient.post(
        cageId == null ?
        '/cage-cards' :
        '/cage-cards/copy/$cageId',
        data: cagePostModel.toJson(),
      );

      final body = (response.data as Map<String, dynamic>)['data']
          as Map<String, dynamic>;

      return CageModel.fromJson(body['cage'] as Map<String, dynamic>);
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }

  @override
  Future<CageModel> updateCage(
    CagePostModel cagePostModel,
    int cageId,
  ) async {
    try {
      final response = await _dioClient.put(
        '/cage-cards/$cageId',
        data: cagePostModel.toJson(),
      );

      final body = (response.data as Map<String, dynamic>)['data']
          as Map<String, dynamic>;

      return CageModel.fromJson(body['cage'] as Map<String, dynamic>);
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
