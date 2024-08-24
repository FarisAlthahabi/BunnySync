part of 'litters_repo.dart';

@Injectable(as: LittersRepo)
class HttpLittersRepo implements LittersRepo {
  final DioClient _dioClient = DioClient();

  @override
  Future<LittersModel> getLitters({int? breederId}) async {
    try {
      final response = await _dioClient.post(
        breederId == null
            ? '/litters/data'
            : 'litters/data?breeder_id=$breederId',
      );
      final data = response.data as Map<String, dynamic>;
      return LittersModel.fromJson(data);
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }

  @override
  Future<List<KitModel>> getKits(int litterId) async {
    try {
      final response = await _dioClient.get('/litters/$litterId/kits');
      final data = ((response.data as Map<String, dynamic>)['data']
          as Map<String, dynamic>)['kits'] as List;
      return List.generate(
        data.length,
        (index) => KitModel.fromJson(data[index] as Map<String, dynamic>),
      );
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }

  @override
  Future<void> deleteLitter(int litterId) async {
    try {
      await _dioClient.delete('/litters/$litterId');
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
