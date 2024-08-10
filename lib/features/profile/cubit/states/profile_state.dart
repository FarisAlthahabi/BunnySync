part of '../profile_cubit.dart';

@immutable
abstract class ProfileState extends GeneralProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileFetch extends ProfileState {
  ProfileFetch(this.userModel);

  final UserModel userModel;
}

class ProfileLoading extends ProfileFetch {
  ProfileLoading(super.userModel);
}

class UpdateProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileFetch {
  ProfileSuccess(super.userModel);
}

class UpdateProfileSuccess extends ProfileFetch {
  UpdateProfileSuccess(super.userModel);
}

class ProfileFail extends ProfileState {
  ProfileFail(this.message);

  final String message;
}

class UpdateProfileFail extends ProfileState {
  UpdateProfileFail(this.message);

  final String message;
}
