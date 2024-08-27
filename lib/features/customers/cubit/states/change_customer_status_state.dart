part of '../customers_cubit.dart';

@immutable
abstract class ChangeCustomerStatusState extends GeneralCustomersState {}

class ChangeCustomerStatusLoading extends ChangeCustomerStatusState {}

class ChangeCustomerStatusSuccess extends ChangeCustomerStatusState {
  ChangeCustomerStatusSuccess(this.customer);

final CustomerModel customer;
}

class ChangeCustomerStatusFail extends ChangeCustomerStatusState {
  ChangeCustomerStatusFail(this.message);

  final String message;
}
