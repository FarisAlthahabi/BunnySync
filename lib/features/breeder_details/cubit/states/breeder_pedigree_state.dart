part of '../breeder_details_cubit.dart';

@immutable
abstract class BreederPedigreeState extends GeneralBreederDetailsState {}

class BreederPedigreeInitial extends BreederPedigreeState {}

class BreederPedigreeFetch extends BreederPedigreeState {
  BreederPedigreeFetch(this.pedigreeModel);

  final PedigreeModel pedigreeModel;
}

class BreederPedigreeLoading extends BreederPedigreeFetch {
  BreederPedigreeLoading(super.pedigreeModel);
}

class BreederPedigreeSuccess extends BreederPedigreeFetch {
  BreederPedigreeSuccess(super.pedigreeModel);
}

class BreederPedigreeFail extends BreederPedigreeState {
  BreederPedigreeFail(this.message);

  final String message;
}
