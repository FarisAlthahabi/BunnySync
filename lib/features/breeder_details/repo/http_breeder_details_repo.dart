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
  Future<ResponseModel<PedigreeModel>> getBreederPedigree(int id) async {
    try {
      final response = await _dioClient.get(
        '/breeders/$id/pedigree',
      );
      final body = response.data as Map<String, dynamic>;

      return ResponseModel<PedigreeModel>.fromJson(
        body,
        (json) {
          final data = json as Map<String, dynamic>?;
          if (data == null) throw 'Data is null';
          return PedigreeModel.fromJson(
            data["pedigree"] as Map<String, dynamic>,
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
  Future<List<dynamic>> getBreederImages(int id) async{
    try {
      final response = await _dioClient.post(
        '/breeders/$id/get-images',
      );
      //
      final data = response.data as Map<String, dynamic>;
      final images = data['data'] as List;
      return List.generate(
        images.length,
        (index) =>
        //Todo fix model here to breeder image model
            BreederNoteModel.fromJson(images[index] as Map<String, dynamic>),
      );
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
