part of 'add_breeder_repo.dart';

@Injectable(as: AddBreederRepo)
class HttpAddBreederRepo implements AddBreederRepo {
  final DioClient _dioClient = DioClient();

  @override
  Future<ResponseModel<BreederEntryModel>> addBreeder(
    PostAddBreederModel postAddBreederModel,
  ) async {
    try {
      final response = await _dioClient.post(
        '/breeders',
        data: postAddBreederModel.toJson(),
      );

      final body = response.data as Map<String, dynamic>;

      return ResponseModel<BreederEntryModel>.fromJson(
        body,
        (json) {
          final data = json as Map<String, dynamic>?;
          if (data == null) throw 'Data is null';
          return BreederEntryModel.fromJson(data);
        },
      );
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
