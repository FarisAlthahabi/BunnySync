part of '../breeders_cubit.dart';

@immutable
abstract class BreedersState extends GeneralBreedersState {}

class BreedersInitial extends BreedersState {}

class BreedersLoading extends BreedersState {}

class BreedersSuccess extends BreedersState {
  BreedersSuccess(this.breedersModel);

  final BreedersModel breedersModel;
}

class BreedersFail extends BreedersState {
  BreedersFail(this.message);

  final String message;
}
