import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/customers/model/customer_model/customer_fake_model.dart';
import 'package:bunny_sync/features/customers/model/customer_model/customer_model.dart';
import 'package:bunny_sync/features/customers/repo/customers_repo.dart';
import 'package:bunny_sync/features/tasks/models/task_status_types/task_status_types.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/customers_state.dart';

part 'states/change_customer_status_state.dart';

part 'states/general_customers_state.dart';

part 'states/delete_customer_state.dart';

@injectable
class CustomersCubit extends Cubit<GeneralCustomersState> {
  CustomersCubit(this._customersRepo) : super(CustomersInitial());

  final CustomersRepo _customersRepo;

  List<CustomerModel> customers = [];

  StatusTypes customerStatusType = StatusTypes.archive;

  void setCustomerStatusType(StatusTypes? statusType) {
    if (statusType == null) {
      customerStatusType = StatusTypes.archive;
    } else {
      customerStatusType = statusType;
    }
  }

  Future<void> getCustomers() async {
    emit(CustomersLoading(customersFakeModel));
    try {
      final customers = await _customersRepo.getCustomers();
      this.customers = customers;
      if (customers.isEmpty) {
        emit(CustomersEmpty('customers_empty'.i18n));
      } else {
        emit(CustomersSuccess(customers));
      }
    } catch (e, s) {
      addError(e, s);
      emit(CustomersFail(e.toString()));
    }
  }

  void addCustomer(CustomerModel customer) {
    customers.add(customer);
    emit(CustomersSuccess(customers));
  }

  void updateCustomer(CustomerModel customer) {
    customers = customers.map((e) {
      if (e.id == customer.id) {
        return customer;
      }
      return e;
    }).toList();
    emit(CustomersSuccess(customers));
  }

  Future<void> deleteCustomer(int customerId) async {
    emit(DeleteCustomerLoading());
    try {
      await _customersRepo.deleteCustomer(customerId);
      customers.removeWhere(
        (customer) => customer.id == customerId,
      );
      emit(DeleteCustomerSuccess());

      if (customers.isEmpty) {
        emit(CustomersEmpty('customers_empty'.i18n));
      } else {
        emit(CustomersSuccess(customers));
      }
    } catch (e, s) {
      addError(e, s);
      emit(DeleteCustomerFail(e.toString()));
    }
  }


  Future<void> changeCustomerStatus(int customerId) async {
    emit(ChangeCustomerStatusLoading());

    try {
      final response = await _customersRepo.changeCustomerStatus(
        customerId,
        customerStatusType,
      );
      emit(ChangeCustomerStatusSuccess(response));
    } catch (e, s) {
      addError(e, s);
      emit(ChangeCustomerStatusFail(e.toString()));
    }
  }
}
