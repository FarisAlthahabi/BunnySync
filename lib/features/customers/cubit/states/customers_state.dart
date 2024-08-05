part of '../customers_cubit.dart';

@immutable
abstract class CustomersState extends GeneralCustomersState {}

class CustomersInitial extends CustomersState {}

class CustomersFetch extends CustomersState {
  CustomersFetch(this.customers);

  final List<CustomerModel> customers;
}

class CustomersLoading extends CustomersFetch {
  CustomersLoading(super.customers);
}

class CustomersSuccess extends CustomersFetch {
  CustomersSuccess(super.customers);
}

class CustomersEmpty extends CustomersState {
  CustomersEmpty(this.message);

  final String message;
}

class CustomersFail extends CustomersState {
  CustomersFail(this.message);

  final String message;
}
