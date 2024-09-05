part of '../breeder_details_cubit.dart';

@immutable
abstract class BreederPedigreeState extends GeneralBreederDetailsState {}

class BreederPedigreeInitial extends BreederPedigreeState {}

class BreederPedigreeFetch extends BreederPedigreeState {
  BreederPedigreeFetch(this.pedigreeUrlModel);

  final PedigreeUrlModel pedigreeUrlModel;
}

class BreederPedigreeLoading extends BreederPedigreeFetch with EquatableMixin {
  BreederPedigreeLoading(super.pedigreeUrlModel);

  @override
  List<Object?> get props => [];
}

class BreederPedigreeSuccess extends BreederPedigreeFetch {
  BreederPedigreeSuccess(super.pedigreeUrlModel);
}

class BreederPedigreeWebViewSuccess extends BreederPedigreeState {
  BreederPedigreeWebViewSuccess();
}

class BreederPedigreeFail extends BreederPedigreeState {
  BreederPedigreeFail(this.message);

  final String message;
}
