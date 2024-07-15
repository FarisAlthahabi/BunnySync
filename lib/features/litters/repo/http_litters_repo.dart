part of 'litters_repo.dart';

@Injectable(as: LittersRepo)
class HttpLittersRepo implements LittersRepo {
  final DioClient _dioClient = DioClient();

  @override
  Future<LittersModel> getLitters() async {
    try {
      final response = await _dioClient.post(
        '/litters/data',
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
}
