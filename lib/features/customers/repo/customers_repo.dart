import 'package:bunny_sync/features/customers/model/customer_model/customer_model.dart';
import 'package:bunny_sync/global/dio/dio_client.dart';
import 'package:bunny_sync/global/dio/exceptions.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:injectable/injectable.dart';

part 'http_customers_repo.dart';

abstract class CustomersRepo {
  Future<List<CustomerModel>> getCustomers();

  Future<void> deleteCustomer(int customerId);
}
