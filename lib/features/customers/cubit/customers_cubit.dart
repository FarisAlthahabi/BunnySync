import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/customers/models/customer_model/customer_fake_model.dart';
import 'package:bunny_sync/features/customers/models/customer_model/customer_model.dart';
import 'package:bunny_sync/features/customers/models/customer_quick_post_model/customer_quick_post_model.dart';
import 'package:bunny_sync/features/customers/repo/customers_repo.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/customers_state.dart';

part 'states/general_customers_state.dart';

part 'states/delete_customer_state.dart';

part 'states/set_added_customer_state.dart';

part 'states/quick_add_customer_state.dart';

part 'states/quick_add_customer_name_state.dart';

part 'states/quick_add_customer_email_state.dart';

@injectable
class CustomersCubit extends Cubit<GeneralCustomersState> {
  CustomersCubit(this._customersRepo) : super(CustomersInitial());

  final CustomersRepo _customersRepo;

  List<CustomerModel> customers = [];

  CustomerQuickPostModel _customerQuickPostModel =
      const CustomerQuickPostModel();

  void setName(String name) {
    _customerQuickPostModel = _customerQuickPostModel.copyWith(
      name: () => name,
    );
  }

  void setEmail(String email) {
    _customerQuickPostModel = _customerQuickPostModel.copyWith(
      email: () => email,
    );
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

  Future<void> quickAddCustomer() async {
    final nameError = _customerQuickPostModel.validateName();
    final emailError = _customerQuickPostModel.validateEmail();
    if (nameError != null) {
      emit(QuickAddCustomerNameInvalid(nameError));
      return;
    }
    if (emailError != null) {
      emit(QuickAddCustomerEmailInvalid(emailError));
      return;
    }

    emit(QuickAddCustomerLoading());
    try {
      final customer = await _customersRepo.quickAddCustomer(
        _customerQuickPostModel,
      );
      emit(QuickAddCustomerSuccess(customer));
      emit(SetAddedCustomerState(customer));
    } catch (e, s) {
      addError(e, s);
      emit(QuickAddCustomerFail(e.toString()));
    }
  }
}
