part of 'litter_details_repo.dart';

@Injectable(as: LitterDetailsRepo)
class HttpLitterDetailsRepo implements LitterDetailsRepo {
  final DioClient _dioClient = DioClient();

  @override
  Future<LitterDetailsResponseModel> getLitterDetails(int id) async {
    try {
      final response = await _dioClient.get(
        '/litters/$id',
      );
      final data = response.data as Map<String, dynamic>;
      final litterDetails = data["data"] as Map<String, dynamic>;
      return LitterDetailsResponseModel.fromJson(litterDetails);
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }

  @override
  Future<void> deleteKit({required int litterId, required int kitId}) async {
    try {
      await _dioClient.delete(
        '/litters/kits/$litterId/delete/$kitId',
      );
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
