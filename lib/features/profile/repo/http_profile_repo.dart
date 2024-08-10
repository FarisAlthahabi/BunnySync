part of 'profile_repo.dart';

@Injectable(as: ProfileRepo)
class HttpProfileRepo implements ProfileRepo {
  final DioClient _dioClient = DioClient();

  @override
  Future<UserModel> getUserInfo() async {
    try {
      final response = await _dioClient.get(
        '/getUser',
      );

      final body = (response.data as Map<String, dynamic>)['data']
          as Map<String, dynamic>;

      return UserModel.fromJson(body['user'] as Map<String, dynamic>);
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
