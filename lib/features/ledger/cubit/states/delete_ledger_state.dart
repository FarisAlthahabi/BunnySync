part of '../ledgers_cubit.dart';

@immutable
abstract class DeleteLedgerState extends GeneralLedgersState {}

class DeleteLedgerSuccess extends DeleteLedgerState {
  DeleteLedgerSuccess();
}

class DeleteLedgerLoading extends DeleteLedgerState {}

class DeleteLedgerFail extends DeleteLedgerState {
  DeleteLedgerFail(this.message);

  final String message;
}
