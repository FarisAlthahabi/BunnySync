part of '../customers_cubit.dart';

abstract class QuickAddCustomerEmailState extends GeneralCustomersState {}

class QuickAddCustomerEmailInvalid extends QuickAddCustomerEmailState {
  QuickAddCustomerEmailInvalid(
    this.message,
  );
  final String message;
}
