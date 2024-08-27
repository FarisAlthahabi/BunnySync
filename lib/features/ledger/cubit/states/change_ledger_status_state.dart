part of '../ledgers_cubit.dart';

@immutable
abstract class ChangeLedgerStatusState extends GeneralLedgersState {}

class ChangeLedgerStatusLoading extends ChangeLedgerStatusState {}

class ChangeLedgerStatusSuccess extends ChangeLedgerStatusState {
  ChangeLedgerStatusSuccess(this.ledger);

final LedgerModel ledger;
}

class ChangeLedgerStatusFail extends ChangeLedgerStatusState {
  ChangeLedgerStatusFail(this.message);

  final String message;
}
