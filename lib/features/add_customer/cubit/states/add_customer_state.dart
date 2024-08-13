part of '../add_customer_cubit.dart';

@immutable
abstract class AddCustomerState extends GeneralAddCustomerState {}

class AddCustomerInitial extends AddCustomerState {}

class AddCustomerLoading extends AddCustomerState {}

class AddCustomerSuccess extends AddCustomerState {
  AddCustomerSuccess(this.customer);

  final CustomerModel customer;
}

class UpdateCustomerSuccess extends AddCustomerState {
  UpdateCustomerSuccess(this.customer);

  final CustomerModel customer;
}

class AddCustomerFail extends AddCustomerState {
  AddCustomerFail(this.message);

  final String message;
}
