// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../add_breeder_cubit.dart';

abstract class BreederNamePostState extends GeneralAddBreederState {}

class BreederNamePostInvalid extends BreederNamePostState {
  final String message;
  BreederNamePostInvalid(
    this.message,
  );
}
