part of 'reports_repo.dart';

@Injectable(as: ReportsRepo)
class HttpReportsRepo implements ReportsRepo {
  final DioClient _dioClient = DioClient();

  @override
  Future<ReportStatsModel> getReportStats() async {
    try {
      final response = await _dioClient.get('/reports');
      
      final data = (response.data as Map<String, dynamic>)["data"]
          as Map<String, dynamic>;
      return ReportStatsModel.fromJson(data);
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
  
  @override
  Future<LitterSizeModel> getLitterSize() async{
     try {
      final response = await _dioClient.get('/reports/litter-size');
      
      final data = (response.data as Map<String, dynamic>)["data"]
          as Map<String, dynamic>;
      return LitterSizeModel.fromJson(data);
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
  
  @override
  Future<CouseDeathModel> getCouseDeath() async{
    try {
      final response = await _dioClient.get('/reports/couse-death');
      
      final data = (response.data as Map<String, dynamic>)["data"]
          as Map<String, dynamic>;
      return CouseDeathModel.fromJson(data);
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
  
  @override
  Future<DoeCostModel> getDoeCost() async{
    try {
      final response = await _dioClient.get('/reports/doe-cost');
      
      final data = (response.data as Map<String, dynamic>)["data"]
          as Map<String, dynamic>;
      return DoeCostModel.fromJson(data);
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
  
  @override
  Future<KitWeightReportModel> getKitWeightReport() async{
     try {
      final response = await _dioClient.get('/reports/kit-weight');
      
      final data = (response.data as Map<String, dynamic>)["data"]
          as Map<String, dynamic>;
      return KitWeightReportModel.fromJson(data);
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
  
  @override
  Future<LiveAndDeadModel> getLiveAndDead()async {
    try {
      final response = await _dioClient.get('/reports/life-dead-kits');
      
      final data = (response.data as Map<String, dynamic>)["data"]
          as Map<String, dynamic>;
      return LiveAndDeadModel.fromJson(data);
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
  
  @override
  Future<SurvivalRateModel> getSurvivalRate() async{
    try {
      final response = await _dioClient.get('/reports/survival-rate');
      
      final data = (response.data as Map<String, dynamic>)["data"]
          as Map<String, dynamic>;
      return SurvivalRateModel.fromJson(data);
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
