part of '../add_customer_cubit.dart';

abstract class AddCustomerEmailState extends GeneralAddCustomerState {}

class CustomerEmailPostInvalid extends AddCustomerEmailState {
  CustomerEmailPostInvalid(
    this.message,
  );
  final String message;
}
