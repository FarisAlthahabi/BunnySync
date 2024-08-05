part of 'cage_cards_repo.dart';

@Injectable(as: CageCardsRepo)
class HttpCageCardsRepo implements CageCardsRepo {
  final DioClient _dioClient = DioClient();

  @override
  Future<List<CageModel>> getCages() async {
    try {
      final response = await _dioClient.post(
        '/cage-cards/data',
      );

      final body = (response.data as Map<String, dynamic>)['data'] as List;

      return List.generate(
        body.length,
        (index) => CageModel.fromJson(body[index] as Map<String, dynamic>),
      );
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
  
  @override
  Future<void> deleteCageCard(int cageId) async{
    try {
      await _dioClient.delete('/cage-cards/$cageId');
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
