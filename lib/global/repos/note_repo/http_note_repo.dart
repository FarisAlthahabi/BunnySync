part of 'note_repo.dart';

@Injectable(as: NoteRepo)
class HttpNoteRepo implements NoteRepo {
  final DioClient _dioClient = DioClient();

  @override
  Future<List<NoteModel>> getNotes({
    int? breederId,
    int? litterId,
  }) async {
    try {
      final response = await _dioClient.post(
        breederId != null
            ? '/breeders/note/$breederId/breeder-data'
            : '/litters/note/$litterId/litters-data',
      );
      final data = response.data as Map<String, dynamic>;
      final notes = data['data'] as List;
      return List.generate(
        notes.length,
        (index) => NoteModel.fromJson(notes[index] as Map<String, dynamic>),
      );
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }

  @override
  Future<void> deleteNote({int? breederId, int? litterId}) async {
    try {
      await _dioClient.delete(
        breederId != null
            ? '/breeders/note/$breederId/destroy'
            : '/litters/note/$litterId/destroy',
      );
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
