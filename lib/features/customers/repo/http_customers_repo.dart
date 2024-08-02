part of 'customers_repo.dart';

@Injectable(as: CustomersRepo)
class HttpCustomersRepo implements CustomersRepo {
  final DioClient _dioClient = DioClient();

  @override
  Future<List<CustomerModel>> getCustomers() async {
    try {
      final response = await _dioClient.post(
        '/finance/customer/data',
      );
      final data = (response.data as Map<String, dynamic>)['data'] as List;
      return List.generate(
        data.length,
        (index) => CustomerModel.fromJson(data[index] as Map<String, dynamic>),
      );
    } on Exception catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
