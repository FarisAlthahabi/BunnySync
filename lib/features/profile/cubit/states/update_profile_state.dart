part of '../profile_cubit.dart';

class UpdateProfileState extends GeneralProfileState{}

class UpdateProfileLoading extends UpdateProfileState {}

class UpdateProfileSuccess extends UpdateProfileState {}

class UpdateProfileFail extends UpdateProfileState {
  UpdateProfileFail(this.message);

  final String message;
}
