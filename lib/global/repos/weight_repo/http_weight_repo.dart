part of 'weight_repo.dart';

@Injectable(as: WeightRepo)
class HttpWeightRepo implements WeightRepo {
  final DioClient _dioClient = DioClient();

  @override
  Future<void> updateWeight(
    EntityTypes entityType,
    {WeightPostModel? weightPostModel,
    SaveWeightLitterModel? saveWeightLitterModel,
    int? weightId,
    int? litterId,
    int? kitId,
    }
  ) async {
    try {
      await _dioClient.post(
        entityType == EntityTypes.breeder ?
        '/breeders/$weightId/update-weight':
        entityType == EntityTypes.litter ?
        '/litters/$litterId/save-weigh':
        '/litters/kits/$kitId/update-weight/$weightId',
        data: entityType == EntityTypes.breeder ?
         weightPostModel?.toJson() :
         entityType == EntityTypes.litter ?
         saveWeightLitterModel?.toJson() :
         weightPostModel?.toJson(),
      );
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
