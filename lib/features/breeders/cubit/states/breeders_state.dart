part of '../breeders_cubit.dart';

@immutable
abstract class BreedersState extends GeneralBreedersState {}

class BreedersInitial extends BreedersState {}

class BreedersFetch extends BreedersState {
  BreedersFetch(this.breedersModel);

  final BreedersModel breedersModel;
}

class BreedersLoading extends BreedersFetch {
  BreedersLoading(super.breedersModel);
}

class BreedersSuccess extends BreedersFetch {
  BreedersSuccess(super.breedersModel);
}

class BreedersFail extends BreedersState {
  BreedersFail(this.message);

  final String message;
}
