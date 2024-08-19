part of '../ledgers_cubit.dart';

@immutable
abstract class LedgerStatsState extends GeneralLedgersState {}

class LedgerStatsInitial extends LedgerStatsState {}

class LedgerStatsFetch extends LedgerStatsState {
  LedgerStatsFetch(this.ledgerStats);

  final LedgerStatsModel ledgerStats;
}

class LedgerStatsLoading extends LedgerStatsFetch {
  LedgerStatsLoading(super.ledgerStats);
}

class LedgerStatsSuccess extends LedgerStatsFetch {
  LedgerStatsSuccess(super.ledgerStats);
}


class LedgerStatsFail extends LedgerStatsState {
  LedgerStatsFail(this.message);

  final String message;
}
