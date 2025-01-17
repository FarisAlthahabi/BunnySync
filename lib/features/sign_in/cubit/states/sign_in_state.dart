// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../sign_in_cubit.dart';

@immutable
abstract class SignInState extends GeneralSignInState {}

class SignInInitial extends SignInState {}

class SignInSuccess extends SignInState {
  SignInSuccess(this.signInModel);

  final SignInModel signInModel;
}

class SignUpSuccess extends SignInState {
  SignUpSuccess(this.signInModel);

  final SignInModel signInModel;
}

class SignInLoading extends SignInState {}

class SignInError extends SignInState {
  SignInError(this.message);

  final String message;
}

class LogOutSuccess extends SignInState {
  LogOutSuccess();
}
