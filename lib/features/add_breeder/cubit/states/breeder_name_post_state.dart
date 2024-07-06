part of '../add_breeder_cubit.dart';

abstract class BreederNamePostState extends GeneralAddBreederState {}

class BreederNamePostInvalid extends BreederNamePostState {
  BreederNamePostInvalid(
    this.message,
  );
  final String message;
}
