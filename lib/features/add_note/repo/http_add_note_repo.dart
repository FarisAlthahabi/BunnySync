part of 'add_note_repo.dart';

@Injectable(as: AddNoteRepo)
class HttpAddNoteRepo implements AddNoteRepo {
  final DioClient _dioClient = DioClient();

  @override
  Future<BreederNoteModel> addNote(
    AddNoteModel addNoteModel,
    int breederId,
  ) async {
    try {
      final response = await _dioClient.post(
        '/breeders/note/$breederId/store',
        data: addNoteModel.toJson(),
      );

      final body = (response.data as Map<String, dynamic>)['data']
          as Map<String, dynamic>;

      return BreederNoteModel.fromJson(body['note'] as Map<String, dynamic>);
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
