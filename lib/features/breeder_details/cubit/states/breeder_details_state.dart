part of '../breeder_details_cubit.dart';

@immutable
abstract class BreederDetailsState extends GeneralBreederDetailsState {}

class BreederDetailsInitial extends BreederDetailsState {}

class BreederDetailsFetch extends BreederDetailsState {
BreederDetailsFetch(this.breederDetailsResponseModel);

  final BreederDetailsResponseModel breederDetailsResponseModel;
}

class BreederDetailsLoading extends BreederDetailsFetch {
  BreederDetailsLoading(super.breederDetailsResponseModel);
}

class BreederDetailsSuccess extends BreederDetailsFetch {
  BreederDetailsSuccess(super.breederDetailsResponseModel);
}

class BreederDetailsFail extends BreederDetailsState {
  BreederDetailsFail(this.message);

  final String message;
}
