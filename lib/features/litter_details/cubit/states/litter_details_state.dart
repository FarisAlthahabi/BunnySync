part of '../litter_details_cubit.dart';

@immutable
abstract class LitterDetailsState extends GeneralLitterDetailsState {}

class LitterDetailsInitial extends LitterDetailsState {}

class LitterDetailsFetch extends LitterDetailsState {
  LitterDetailsFetch(this.litterDetailsResponseModel);

  final LitterDetailsResponseModel litterDetailsResponseModel;
}

class LitterDetailsLoading extends LitterDetailsFetch {
  LitterDetailsLoading(super.litterDetailsResponseModel);
}

class LitterDetailsSuccess extends LitterDetailsFetch {
  LitterDetailsSuccess(super.litterDetailsResponseModel);
}

class LitterDetailsFail extends LitterDetailsState {
  LitterDetailsFail(this.message);

  final String message;
}
