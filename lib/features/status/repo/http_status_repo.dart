part of 'status_repo.dart';

@Injectable(as: StatusRepo)
class HttpStatusRepo implements StatusRepo {
  final DioClient _dioClient = DioClient();
  @override
  Future<void> changeStatus(
    StatusableModel statusableModel,
    StatusTypes statusType,
  ) async {
    try {
      if (statusableModel.httpMethod == HttpMethods.post) {
        await _dioClient.post(
          statusableModel.httpEndpoint,
          data: {
            "status" : StatusTypes.nameToJson(statusType),
            },
        );
      } else {
        await _dioClient.get(
          '${statusableModel.httpEndpoint}${StatusTypes.nameToJson(statusType)}',
        );
      }
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
