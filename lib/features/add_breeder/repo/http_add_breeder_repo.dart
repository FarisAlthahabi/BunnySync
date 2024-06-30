part of 'add_breeder_repo.dart';

@Injectable(as: AddBreederRepo)
class HttpAddBreederRepo implements AddBreederRepo {
  final DioClient _dioClient = DioClient();

  final UserRepo userRepo = UserRepo();

  @override
  Future<ResponseModel<NewBreederModel>> addBreeder(
      PostAddBreederModel postAddBreederModel) async {
    try {
      final response = await _dioClient.post(
        '/breeders',
        data: postAddBreederModel.toJson(),
        headers: {"Authorization": "Bearer ${userRepo.getKey('token')}"},
      );
      final body = response.data as Map<String, dynamic>;
      return ResponseModel<NewBreederModel>.fromJson(
        body,
        (json) {
          final data = json as Map<String, dynamic>?;
          if (data == null) throw 'Data is null';
          return NewBreederModel.fromJson(data);
        },
      );
    } on Exception catch (e) {
      rethrow;
    }

  }
}
