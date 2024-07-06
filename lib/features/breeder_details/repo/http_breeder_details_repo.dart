part of 'breeder_details_repo.dart';

@Injectable(as: BreederDetailsRepo)
class HttpBreederDetailsRepo implements BreederDetailsRepo {
  final DioClient _dioClient = DioClient();

  @override
  Future<ResponseModel<BreederDetailsResponseModel>> getBreederDetails(
    int id,
  ) async {
    try {
      final response = await _dioClient.get(
        '/breeders/$id',
      );
      final body = response.data as Map<String, dynamic>;

      return ResponseModel<BreederDetailsResponseModel>.fromJson(
        body,
        (json) {
          final data = json as Map<String, dynamic>?;
          if (data == null) throw 'Data is null';
          return BreederDetailsResponseModel.fromJson(data);
        },
      );
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
