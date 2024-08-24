part of 'ledgers_repo.dart';

@Injectable(as: LedgersRepo)
class HttpLedgersRepo implements LedgersRepo {
  final DioClient _dioClient = DioClient();

  @override
  Future<List<LedgerModel>> getLedgers({
    int? breederId,
    int? litterId,
  }) async {
    try {
      final response = await _dioClient.post(
        breederId != null && litterId == null ?
        '/finance/data?breeder_id=$breederId' :
        breederId == null && litterId != null ?
        '/finance/data?litter_id=$litterId' :
        '/finance/data',
      );
      final data = (response.data as Map<String, dynamic>)['data'] as List;
      return List.generate(
        data.length,
        (index) => LedgerModel.fromJson(data[index] as Map<String, dynamic>),
      );
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }

  @override
  Future<void> deleteLedger(int ledgerId) async {
    try {
      await _dioClient.delete('/finance/$ledgerId');
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }

  @override
  Future<LedgerStatsModel> getLedgerStats() async {
    try {
      final response = await _dioClient.get(
        '/finance',
      );
      final data = (response.data as Map<String, dynamic>)['data'];
      return LedgerStatsModel.fromJson(data as Map<String, dynamic>);
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
