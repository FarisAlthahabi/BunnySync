import 'package:bunny_sync/features/add_customer/model/customer_post_model.dart';
import 'package:bunny_sync/features/customers/model/customer_model/customer_model.dart';
import 'package:bunny_sync/global/dio/dio_client.dart';
import 'package:bunny_sync/global/dio/exceptions.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:injectable/injectable.dart';

part 'http_add_customer_repo.dart';

abstract class AddCustomerRepo {
  Future<CustomerModel> addCustomer(CustomerPostModel customer);
}
