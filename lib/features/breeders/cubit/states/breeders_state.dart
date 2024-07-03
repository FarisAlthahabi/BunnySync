part of '../breeders_cubit.dart';

@immutable
abstract class BreedersState extends GeneralBreedersState {}

class BreedersInitial extends BreedersState {}

class BreedersFetch extends BreedersState {
  BreedersFetch(this.breedersStatusModel);

  final BreedersStatusModel breedersStatusModel;
}

class BreedersLoading extends BreedersFetch {
  BreedersLoading(super.breedersStatusModel);
}

class BreedersSuccess extends BreedersFetch {
  BreedersSuccess(super.breedersStatusModel);
}

class BreedersFail extends BreedersState {
  BreedersFail(this.message);

  final String message;
}