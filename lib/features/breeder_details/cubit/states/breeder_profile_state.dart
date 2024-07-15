part of '../breeder_details_cubit.dart';

@immutable
abstract class BreederProfileState extends GeneralBreederDetailsState {}

class BreederProfileInitial extends BreederProfileState {}

class BreederProfileFetch extends BreederProfileState {
  BreederProfileFetch(this.breederDetailsResponseModel);

  final BreederDetailsResponseModel breederDetailsResponseModel;
}

class BreederProfileLoading extends BreederProfileFetch {
  BreederProfileLoading(
    super.breederDetailsResponseModel,
  );
}

class BreederProfileSuccess extends BreederProfileFetch {
  BreederProfileSuccess(
    super.breederDetailsResponseModel,
  );
}

class BreederProfileFail extends BreederProfileState {
  BreederProfileFail(this.message);

  final String message;
}
