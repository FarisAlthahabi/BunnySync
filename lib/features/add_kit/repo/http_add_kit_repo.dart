part of 'add_kit_repo.dart';

@Injectable(as: AddKitRepo)
class HttpAddKitRepo implements AddKitRepo {
  final dioClient = DioClient();

  @override
  Future<KitModel> addKit(int litterId, PostKitModel postKitModel) async {
    try {
      final response = await dioClient.post(
        'litters/kits/$litterId/store',
        data: postKitModel.toJson(),
      );

      final body = response.data as Map<String, dynamic>;
      final data = body['data'] as Map<String, dynamic>;

      return KitModel.fromJson(data['kit'] as Map<String, dynamic>);
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }

  @override
  Future<KitModel> updateKit(
    PostKitModel postKitModel, {
    required int litterId,
    required int kitId,
  }) async {
    try {
      final response = await dioClient.put(
        'litters/kits/$litterId/update/$kitId',
        data: postKitModel.toJson(),
      );

      final body = response.data as Map<String, dynamic>;
      final data = body['data'] as Map<String, dynamic>;

      return KitModel.fromJson(data['kit'] as Map<String, dynamic>);
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
