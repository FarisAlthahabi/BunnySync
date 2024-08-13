part of 'add_ailment_repo.dart';

@Injectable(as: AddAilmentRepo)
class HttpAddAilmentRepo implements AddAilmentRepo {
  final DioClient _dioClient = DioClient();

  @override
  Future<AilmentModel> addAilment(
    AilmentPostModel ailmentPostModel,
  ) async {
    try {
      final response = await _dioClient.post(
        '/health/ailment',
        data: ailmentPostModel.toJson(),
      );

      final body = (response.data as Map<String, dynamic>)['data']
          as Map<String, dynamic>;

      return AilmentModel.fromJson(body['ailment'] as Map<String, dynamic>);
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }

  @override
  Future<AilmentModel> updateAilment(
    AilmentPostModel ailmentPostModel,
    int ailmentId,
  ) async {
    try {
      final response = await _dioClient.put(
        '/health/ailment/$ailmentId',
        data: ailmentPostModel.toJson(),
      );

      final body = (response.data as Map<String, dynamic>)['data']
          as Map<String, dynamic>;

      return AilmentModel.fromJson(body['ailment'] as Map<String, dynamic>);
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
