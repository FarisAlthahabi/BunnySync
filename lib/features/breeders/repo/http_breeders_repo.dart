part of 'breeders_repo.dart';

@Injectable(as: BreedersRepo)
class HttpBreedersRepo implements BreedersRepo {
  final DioClient _dioClient = DioClient();

  @override
  Future<BreedersModel> getBreeders() async {
    try {
      final response = await _dioClient.post(
        '/breeders/data',
      );
      final data = response.data as Map<String, dynamic>;
      return BreedersModel.fromJson(data);
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }

  @override
  Future<BreedersModel> getSearchedBreeders(String input) async {
    final searchModel = SearchModel(value: input);
    final searchEntryModel = SearchEntryModel(search: searchModel);
    final searchBreederRequestModel = SearchBreederRequestModel(
      searchEntry: [searchEntryModel],
      searchModel: searchModel,
    );
    try {
      final response = await _dioClient.post(
        '/breeders/data',
        data: searchBreederRequestModel.toJson(),
      );
      final data = response.data as Map<String, dynamic>;
      return BreedersModel.fromJson(data);
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }

  @override
  Future<List<BreederByGenderModel>> getBreederByGender(
    String? gender,
  ) async {
    try {
      final response = await _dioClient.get(
        '/breeders/show-by-gender/${gender ?? 'male'}',
      );
      final data = response.data as Map<String, dynamic>;
      final innerData = data['data'] as Map<String, dynamic>;
      final breedersByGender = innerData['breeders'] as List;
      return List.generate(
        breedersByGender.length,
        (index) => BreederByGenderModel.fromJson(
          breedersByGender[index] as Map<String, dynamic>,
        ),
      );
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
  
  @override
  Future<List<BreederPairModel>> getBreederPairs()async {
    try {
      final response = await _dioClient.get(
        '/breeders/list/breeder-pair',
      );
      final data = (response.data as Map<String, dynamic>)['data'] as List;
      return List.generate(
        data.length,
        (index) => BreederPairModel.fromJson(
          data[index] as Map<String, dynamic>,
        ),
      );
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
