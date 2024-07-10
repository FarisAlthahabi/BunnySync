part of 'delete_breeder_repo.dart';

@Injectable(as: DeleteBreederRepo)
class HttpDeleteBreederRepo implements DeleteBreederRepo {
  final DioClient _dioClient = DioClient();

  @override
  Future<void> deleteBreeder(int breederId) async {
    try {
      await _dioClient.delete('/breeders/$breederId');
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
