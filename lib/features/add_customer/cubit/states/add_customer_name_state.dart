part of '../add_customer_cubit.dart';

abstract class AddCustomerNameState extends GeneralAddCustomerState {}

class CustomerNamePostInvalid extends AddCustomerNameState {
  CustomerNamePostInvalid(
    this.message,
  );
  final String message;
}
