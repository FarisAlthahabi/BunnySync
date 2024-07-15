part of 'add_litter_repo.dart';

@Injectable(as: AddLitterRepo)
class HttpAddLitterRepo implements AddLitterRepo {
  final DioClient _dioClient = DioClient();

  @override
  Future<ResponseModel<List<dynamic>>> addLitter(
    AddLitterModel addLitterModel,
  ) async {
    try {
      final response = await _dioClient.post(
        '/litters',
        data: addLitterModel.toJson(),
      );

      final body = response.data as Map<String, dynamic>;

      return ResponseModel<List<dynamic>>.fromJson(
        body,
        (json) {
          final data = json as List<dynamic>?;
          if (data == null) throw 'Data is null';
          return [];
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
