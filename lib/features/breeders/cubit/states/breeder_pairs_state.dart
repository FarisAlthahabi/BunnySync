part of '../breeders_cubit.dart';

@immutable
abstract class BreederPairsState extends GeneralBreedersState {}

class BreederPairsInitial extends BreederPairsState {}

class BreederPairsLoading extends BreederPairsState {}

class BreederPairsSuccess extends BreederPairsState {
  BreederPairsSuccess(this.breederPairs);

  final List<BreederPairModel> breederPairs;
}

class BreederPairsEmpty extends BreederPairsState {
  BreederPairsEmpty(this.message);

  final String message;
}

class BreederPairsFail extends BreederPairsState {
  BreederPairsFail(this.message);

  final String message;
}
