part of '../ledgers_cubit.dart';

@immutable
abstract class LedgersState extends GeneralLedgersState {}

class LedgersInitial extends LedgersState {}

class LedgersFetch extends LedgersState {
  LedgersFetch(this.ledgers);

  final List<LedgerModel> ledgers;
}

class LedgersLoading extends LedgersFetch {
  LedgersLoading(super.ledgers);
}

class LedgersSuccess extends LedgersFetch {
  LedgersSuccess(super.ledgers);
}

class LedgersEmpty extends LedgersState {
  LedgersEmpty(this.message);

  final String message;
}

class LedgersFail extends LedgersState {
  LedgersFail(this.message);

  final String message;
}
