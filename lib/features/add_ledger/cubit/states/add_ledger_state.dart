part of '../add_ledger_cubit.dart';

@immutable
sealed class AddLedgerState extends GeneralAddLedgerState {}

final class AddLedgerInitial extends AddLedgerState {}

final class AddLedgerLoading extends AddLedgerState {}

final class AddLedgerSuccess extends AddLedgerState {
  AddLedgerSuccess(this.ledgerModel);

  final LedgerModel ledgerModel;
}

final class UpdateLedgerSuccess extends AddLedgerState {
  UpdateLedgerSuccess(this.ledgerModel);

  final LedgerModel ledgerModel;
}

final class AddLedgerError extends AddLedgerState {
  AddLedgerError(this.message);

  final String message;
}
