part of '../reports_cubit.dart';

@immutable
abstract class SurvivalRateState extends GeneralReportsState {}

class SurvivalRateInitial extends SurvivalRateState {}

class SurvivalRateFetch extends SurvivalRateState {
  SurvivalRateFetch(this.survivalRate);

  final SurvivalRateModel survivalRate;
}

class SurvivalRateLoading extends SurvivalRateFetch {
  SurvivalRateLoading(super.survivalRate);
}

class SurvivalRateSuccess extends SurvivalRateFetch {
  SurvivalRateSuccess(super.survivalRate);
}

class SurvivalRateFail extends SurvivalRateState {
  SurvivalRateFail(this.message);

  final String message;
}
