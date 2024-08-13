part of 'home_repo.dart';

@Injectable(as: HomeRepo)
class HttpHomeRepo implements HomeRepo {
  final DioClient _dioClient = DioClient();

  @override
  Future<DashboardModel> getDashboardInfo() async {
    try {
      final response = await _dioClient.get(
        '/dashboard/data',
      );
      final data = response.data as Map<String, dynamic>;
      return DashboardModel.fromJson(data['data'] as Map<String, dynamic>);
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
