part of '../customers_cubit.dart';

@immutable
abstract class QuickAddCustomerState extends GeneralCustomersState {}

class QuickAddCustomerSuccess extends QuickAddCustomerState {
  QuickAddCustomerSuccess(this.customer);

  final CustomerModel customer;
}

class QuickAddCustomerLoading extends QuickAddCustomerState {}

class QuickAddCustomerFail extends QuickAddCustomerState {
  QuickAddCustomerFail(this.message);

  final String message;
}
