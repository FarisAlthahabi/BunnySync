part of '../reports_cubit.dart';

@immutable
abstract class BreederMortalityState extends GeneralReportsState {}

class BreederMortalityInitial extends BreederMortalityState {}

class BreederMortalityFetch extends BreederMortalityState {
  BreederMortalityFetch(this.breederMortality);

  final List<BreederMortalityModel> breederMortality;
}

class BreederMortalityLoading extends BreederMortalityFetch {
  BreederMortalityLoading(super.breederMortality);
}

class BreederMortalitySuccess extends BreederMortalityFetch {
  BreederMortalitySuccess(super.breederMortality);
}

class BreederMortalityEmpty extends BreederMortalityState {
  BreederMortalityEmpty(this.message);

  final String message;
}

class BreederMortalityFail extends BreederMortalityState {
  BreederMortalityFail(this.message);

  final String message;
}
