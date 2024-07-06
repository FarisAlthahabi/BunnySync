part of '../add_breeder_cubit.dart';

@immutable
abstract class AddBreederState extends GeneralAddBreederState {}

class AddBreederInitial extends AddBreederState {}

class AddBreederLoading extends AddBreederState {}

class AddBreederSuccess extends AddBreederState {
  AddBreederSuccess(this.breederModel);

  final BreederEntryModel breederModel;
}

class AddBreederFail extends AddBreederState {
  AddBreederFail(this.message);

  final String message;
}
