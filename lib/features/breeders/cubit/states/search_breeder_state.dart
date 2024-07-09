part of '../breeders_cubit.dart';

@immutable
abstract class SearchBreederState extends GeneralBreedersState {}

class SearchBreederSuccess extends SearchBreederState {
  SearchBreederSuccess(this.searchedBreeders);

  final List<BreederEntryModel> searchedBreeders;
}

class SearchBreederLoading extends SearchBreederState {}

class SearchBreederNotFound extends SearchBreederState {
  SearchBreederNotFound(
    this.message,
  );
  
  final String message;
}

class SearchBreederFail extends SearchBreederState {
  SearchBreederFail(this.message);

  final String message;
}
