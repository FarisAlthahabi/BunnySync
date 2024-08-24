part of 'add_note_repo.dart';

@Injectable(as: AddNoteRepo)
class HttpAddNoteRepo implements AddNoteRepo {
  final DioClient _dioClient = DioClient();

  @override
  Future<NoteModel> addNote(
    AddNoteModel addNoteModel, {
    int? breederId,
    int? litterId,
  }) async {
    try {
      final response = await _dioClient.post(
        breederId != null
            ? '/breeders/note/$breederId/store'
            : '/litters/note/$litterId/store',
        data: addNoteModel.toJson(),
      );

      final body = (response.data as Map<String, dynamic>)['data']
          as Map<String, dynamic>;

      return NoteModel.fromJson(body['note'] as Map<String, dynamic>);
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
