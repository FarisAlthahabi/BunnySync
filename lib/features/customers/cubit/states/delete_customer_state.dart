part of '../customers_cubit.dart';

@immutable
abstract class DeleteCustomerState extends GeneralCustomersState {}

class DeleteCustomerSuccess extends DeleteCustomerState {
  DeleteCustomerSuccess();
}

class DeleteCustomerLoading extends DeleteCustomerState {}

class DeleteCustomerFail extends DeleteCustomerState {
  DeleteCustomerFail(this.message);

  final String message;
}
