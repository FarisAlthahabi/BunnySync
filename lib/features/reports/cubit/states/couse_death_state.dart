part of '../reports_cubit.dart';

@immutable
abstract class CouseDeathState extends GeneralReportsState {}

class CouseDeathInitial extends CouseDeathState {}

class CouseDeathFetch extends CouseDeathState {
  CouseDeathFetch(this.couseDeath);

  final CouseDeathModel couseDeath;
}

class CouseDeathLoading extends CouseDeathFetch {
  CouseDeathLoading(super.couseDeath);
}

class CouseDeathSuccess extends CouseDeathFetch {
  CouseDeathSuccess(super.couseDeath);
}

class CouseDeathFail extends CouseDeathState {
  CouseDeathFail(this.message);

  final String message;
}
