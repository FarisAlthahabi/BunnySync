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
        // final data = ((response.data as Map<String, dynamic>)['data']
        //         as Map<String, dynamic>)[statusableModel.entityType.name]
        //     as Map<String, dynamic>;
        // return StatusTypes.fromJson(data['status'] as String);
      } else {
        await _dioClient.get(
          '${statusableModel.httpEndpoint}${StatusTypes.nameToJson(statusType)}',
        );
        // final data = ((response.data as Map<String, dynamic>)['data']
        //         as Map<String, dynamic>)[statusableModel.entityType.name]
        //     as Map<String, dynamic>;
        // return StatusTypes.fromJson(data['status'] as String);
      }
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
