part of '../reports_cubit.dart';

@immutable
abstract class DoeCostState extends GeneralReportsState {}

class DoeCostInitial extends DoeCostState {}

class DoeCostFetch extends DoeCostState {
  DoeCostFetch(this.doeCost);

  final DoeCostModel doeCost;
}

class DoeCostLoading extends DoeCostFetch {
  DoeCostLoading(super.doeCost);
}

class DoeCostSuccess extends DoeCostFetch {
  DoeCostSuccess(super.doeCost);
}

class DoeCostFail extends DoeCostState {
  DoeCostFail(this.message);

  final String message;
}
