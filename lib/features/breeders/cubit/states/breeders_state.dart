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

class BreedersByGenderLoading extends BreedersState {}

class BreedersSuccess extends BreedersFetch {
  BreedersSuccess(super.breedersStatusModel);
}

class BreedersByGenderSuccess extends BreedersState {
  BreedersByGenderSuccess(this.breedersGenderModel);

  final BreedersGenderModel breedersGenderModel;
}

class BreedersFail extends BreedersState {
  BreedersFail(this.message);

  final String message;
}
