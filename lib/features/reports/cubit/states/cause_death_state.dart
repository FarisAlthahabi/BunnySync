part of '../reports_cubit.dart';

@immutable
abstract class CauseDeathState extends GeneralReportsState {}

class CauseDeathInitial extends CauseDeathState {}

class CauseDeathFetch extends CauseDeathState {
  CauseDeathFetch(this.causeDeath);

  final CauseDeathModel causeDeath;
}

class CauseDeathLoading extends CauseDeathFetch {
  CauseDeathLoading(super.causeDeath);
}

class CauseDeathSuccess extends CauseDeathFetch {
  CauseDeathSuccess(super.causeDeath);
}

class CauseDeathFail extends CauseDeathState {
  CauseDeathFail(this.message);

  final String message;
}
