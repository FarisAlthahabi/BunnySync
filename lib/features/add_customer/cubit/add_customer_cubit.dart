import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/add_customer/model/customer_post_model/customer_post_model.dart';
import 'package:bunny_sync/features/add_customer/model/customer_types/customer_types.dart';
import 'package:bunny_sync/features/add_customer/repo/add_customer_repo.dart';
import 'package:bunny_sync/features/customers/model/customer_model/customer_model.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/add_customer_state.dart';

part 'states/general_add_customer_state.dart';

part 'states/add_customer_name_state.dart';

part 'states/add_customer_email_state.dart';

@injectable
class AddCustomerCubit extends Cubit<GeneralAddCustomerState> {
  AddCustomerCubit(this._addCustomerRepo) : super(AddCustomerInitial());

  final AddCustomerRepo _addCustomerRepo;

  CustomerPostModel _customerPostModel = const CustomerPostModel();

  void setName(String name) {
    _customerPostModel = _customerPostModel.copyWith(
      name: () => name,
    );
  }

  void setEmail(String email) {
    _customerPostModel = _customerPostModel.copyWith(
      email: () => email,
    );
  }

  void setType(CustomerTypes? type) {
    _customerPostModel = _customerPostModel.copyWith(
      type: () => type,
    );
  }

  void setCompanyName(String companyName) {
    _customerPostModel = _customerPostModel.copyWith(
      companyName: () => companyName,
    );
  }

  void setPhone(String phone) {
    _customerPostModel = _customerPostModel.copyWith(
      phone: () => phone,
    );
  }

  void setNote(String note) {
    _customerPostModel = _customerPostModel.copyWith(
      note: () => note,
    );
  }

  void setStreet(String street) {
    _customerPostModel = _customerPostModel.copyWith(
      street: () => street,
    );
  }

  void setCity(String city) {
    _customerPostModel = _customerPostModel.copyWith(
      city: () => city,
    );
  }

  void setCountry(String country) {
    _customerPostModel = _customerPostModel.copyWith(
      country: () => country,
    );
  }

  void setState(String? state) {
    _customerPostModel = _customerPostModel.copyWith(
      state: () => state,
    );
  }

  void setZipCode(String zipCode) {
    _customerPostModel = _customerPostModel.copyWith(
      zipCode: () => zipCode,
    );
  }

  Future<void> addCustomer() async {
    final nameError = _customerPostModel.validateName();
    final emailError = _customerPostModel.validateEmail();
    if (nameError != null) {
      emit(CustomerNamePostInvalid(nameError));
      return;
    }
    if (emailError != null) {
      emit(CustomerEmailPostInvalid(emailError));
      return;
    }

    emit(AddCustomerLoading());
    try {
      final customer = await _addCustomerRepo.addCustomer(_customerPostModel);
      emit(AddCustomerSuccess(customer));
    } catch (e, s) {
      addError(e, s);
      emit(AddCustomerFail(e.toString()));
    }
  }

  Future<void> updateCustomer(int customerId) async {
    final nameError = _customerPostModel.validateName();
    final emailError = _customerPostModel.validateEmail();
    if (nameError != null) {
      emit(CustomerNamePostInvalid(nameError));
      return;
    }
    if (emailError != null) {
      emit(CustomerEmailPostInvalid(emailError));
      return;
    }

    emit(AddCustomerLoading());
    try {
      final customer = await _addCustomerRepo.updateCustomer(
        _customerPostModel,
        customerId,
      );
      emit(UpdateCustomerSuccess(customer));
    } catch (e, s) {
      addError(e, s);
      emit(AddCustomerFail(e.toString()));
    }
  }
}
