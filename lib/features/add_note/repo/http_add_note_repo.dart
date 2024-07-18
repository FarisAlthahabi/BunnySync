part of 'add_note_repo.dart';

@Injectable(as: AddNoteRepo)
class HttpAddNoteRepo implements AddNoteRepo {
  final DioClient _dioClient = DioClient();

  @override
  Future<void> addNote(AddNoteModel addNoteModel, int breederId) async {
    try {
      await _dioClient.post(
        '/breeders/note/$breederId/store',
        data: addNoteModel.toJson(),
      );
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
