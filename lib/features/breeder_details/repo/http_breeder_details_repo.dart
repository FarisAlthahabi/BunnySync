part of 'breeder_details_repo.dart';

@Injectable(as: BreederDetailsRepo)
class HttpBreederDetailsRepo implements BreederDetailsRepo {
  final DioClient _dioClient = DioClient();

  @override
  Future<ResponseModel<BreederDetailsResponseModel>> getBreederDetails(
    int id,
  ) async {
    try {
      final response = await _dioClient.get(
        '/breeders/$id',
      );
      final body = response.data as Map<String, dynamic>;

      return ResponseModel<BreederDetailsResponseModel>.fromJson(
        body,
        (json) {
          final data = json as Map<String, dynamic>?;
          if (data == null) throw 'Data is null';
          return BreederDetailsResponseModel.fromJson(data);
        },
      );
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }

  @override
  Future<ResponseModel<PedigreeUrlModel>> getBreederPedigree(int id) async {
    try {
      final response = await _dioClient.get(
        '/breeders/$id/pedigree',
      );
      final body = response.data as Map<String, dynamic>;

      return ResponseModel<PedigreeUrlModel>.fromJson(
        body,
        (json) {
          final data = json as Map<String, dynamic>?;
          if (data == null) throw 'Data is null';
          return PedigreeUrlModel.fromJson(
            data,
          );
        },
      );
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }

  @override
  Future<List<BreederNoteModel>> getBreederNotes(int id) async {
    try {
      final response = await _dioClient.post(
        '/breeders/note/$id/breeder-data',
      );
      final data = response.data as Map<String, dynamic>;
      final notes = data['data'] as List;
      return List.generate(
        notes.length,
        (index) =>
            BreederNoteModel.fromJson(notes[index] as Map<String, dynamic>),
      );
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }

  @override
  Future<List<BreederImageModel>> getBreederImages(int id) async {
    try {
      final response = await _dioClient.post(
        '/breeders/$id/get-images',
      );
      final data = response.data as Map<String, dynamic>;
      final images = data['data'] as List;
      return List.generate(
        images.length,
        (index) =>
            BreederImageModel.fromJson(images[index] as Map<String, dynamic>),
      );
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }

  @override
  Future<void> deleteNote(int breederId) async {
    try {
      await _dioClient.delete(
        '/breeders/note/$breederId/destroy',
      );
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }

  @override
  Future<BreederImageModel> addBreederImage(int id, XFile imagePicked) async {
    try {
      final FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          imagePicked.path,
          filename: imagePicked.name,
        ),
      });
      final response = await _dioClient.post(
        '/breeders/$id/upload-images',
        data: formData,
      );
      final data = response.data as Map<String, dynamic>;
      final image = data['data'] as Map<String, dynamic>;
      return BreederImageModel.fromJson(image);
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }

  @override
  Future<void> deleteBreederImage(int breederId, int imageId) async {
    try {
      await _dioClient.post(
        '/breeders/$breederId/delete-images',
        data: <String, dynamic>{
          'id': imageId,
        },
      );
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
  
  @override
  Future<void> deleteAttachment(int attachmentId) async{
    try {
      await _dioClient.delete(
        '/breeders/attachment/$attachmentId/destroy',
      );
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
  
  @override
  Future<List<AttachmentModel>> getAttachments(int breederId) async{
    try {
      final response = await _dioClient.post(
        '/breeders/attachment/$breederId/data',
      );
      final data = (response.data as Map<String, dynamic>)['data'] as List;
      return List.generate(
        data.length,
        (index) =>
            AttachmentModel.fromJson(data[index] as Map<String, dynamic>),
      );
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
