part of 'breeders_repo.dart';

@Injectable(as: BreedersRepo)
class HttpBreedersRepo implements BreedersRepo {
  final DioClient _dioClient = DioClient();

  @override
  Future<BreedersModel> getBreeders() async {
    try {
      final response = await _dioClient.post(
        '/breeders/data',
      );
      final data = response.data as Map<String, dynamic>;
      return BreedersModel.fromJson(data);
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
