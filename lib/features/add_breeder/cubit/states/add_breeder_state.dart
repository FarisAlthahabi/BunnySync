// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../add_breeder_cubit.dart';

@immutable
abstract class AddBreederState extends GeneralAddBreederState {}

class AddBreederInitial extends AddBreederState {}

class AddBreederLoading extends AddBreederState {}

class AddBreederSuccess extends AddBreederState {
  final NewBreederModel newBreederModel;
  AddBreederSuccess(
    this.newBreederModel,
  );
}

class AddBreederFail extends AddBreederState {
  final String message;
  AddBreederFail(
    this.message,
  );
}
