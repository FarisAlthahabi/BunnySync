part of 'add_ledger_repo.dart';

@Injectable(as: AddLedgerRepo)
class HttpAddLedgerRepo implements AddLedgerRepo {
  final dioClient = DioClient();

  @override
  Future<LedgerModel> addLedger(LedgerPostModel ledgerPostModel) async {
    try {
      final response = await dioClient.post(
        '/finance',
        data: ledgerPostModel.toJson(),
      );

      final body = (response.data as Map<String, dynamic>)['data']
          as Map<String, dynamic>;

      return LedgerModel.fromJson(body['ledger'] as Map<String, dynamic>);
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }

  @override
  Future<LedgerModel> updateLedger(
    LedgerPostModel ledgerPostModel,
    int ledgerId,
  ) async {
    try {
      final response = await dioClient.put(
        '/finance/$ledgerId',
        data: ledgerPostModel.toJson(),
      );

      final body = (response.data as Map<String, dynamic>)['data']
          as Map<String, dynamic>;

      return LedgerModel.fromJson(body['ledger'] as Map<String, dynamic>);
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
