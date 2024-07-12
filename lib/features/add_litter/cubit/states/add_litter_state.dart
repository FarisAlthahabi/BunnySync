part of '../add_litter_cubit.dart';

@immutable
abstract class AddLitterState extends GeneralAddLitterState {}

class AddLitterInitial extends AddLitterState {}

class AddLitterLoading extends AddLitterState {}

class AddLitterSuccess extends AddLitterState {}

class AddLitterFail extends AddLitterState {
  AddLitterFail(this.message);

  final String message;
}


