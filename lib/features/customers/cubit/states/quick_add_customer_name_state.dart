part of '../customers_cubit.dart';

abstract class QuickAddCustomerNameState extends GeneralCustomersState {}

class QuickAddCustomerNameInvalid extends QuickAddCustomerNameState {
  QuickAddCustomerNameInvalid(
    this.message,
  );
  final String message;
}
