import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/customers/model/customer_model/customer_fake_model.dart';
import 'package:bunny_sync/features/customers/model/customer_model/customer_model.dart';
import 'package:bunny_sync/features/customers/repo/customers_repo.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/customers_state.dart';

part 'states/general_customers_state.dart';

@injectable
class CustomersCubit extends Cubit<GeneralCustomersState> {
  CustomersCubit(this._customersRepo) : super(CustomersInitial());

  final CustomersRepo _customersRepo;

  Future<void> getCustomers() async {
    emit(CustomersLoading(customersFakeModel));
    try {
      final customers = await _customersRepo.getCustomers();
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
}
