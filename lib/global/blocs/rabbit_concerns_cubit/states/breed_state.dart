part of '../rabbit_concerns_cubit.dart';

@immutable
abstract class BreedState extends GeneralRabbitConcernsState {}

class BreedInitial extends BreedState {}

class BreedLoading extends BreedState {}

class BreedSuccess extends BreedState {
  BreedSuccess(this.breederPairModel);

  final BreederPairModel breederPairModel;
}

class BreedFail extends BreedState {
  BreedFail(this.message);

  final String message;
}
