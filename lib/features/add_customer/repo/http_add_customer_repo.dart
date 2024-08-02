part of 'add_customer_repo.dart';

@Injectable(as: AddCustomerRepo)
class HttpAddCustomerRepo implements AddCustomerRepo {
  final DioClient _dioClient = DioClient();

  @override
  Future<CustomerModel> addCustomer(CustomerPostModel customerPost) async {
    try {
      final response = await _dioClient.post(
        '/finance/customer',
        data: customerPost.toJson(),
      );

      final body = (response.data as Map<String, dynamic>)['data']
          as Map<String, dynamic>;

      return CustomerModel.fromJson(body['customer'] as Map<String, dynamic>);
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }

  @override
  Future<CustomerModel> updateCustomer(
    CustomerPostModel customerPost,
    int customerId,
  ) async {
    try {
      final response = await _dioClient.put(
        '/finance/customer/$customerId',
        data: customerPost.toJson(),
      );

      final body = (response.data as Map<String, dynamic>)['data']
          as Map<String, dynamic>;

      return CustomerModel.fromJson(body['customer'] as Map<String, dynamic>);
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong'.i18n;
      }
      rethrow;
    }
  }
}
