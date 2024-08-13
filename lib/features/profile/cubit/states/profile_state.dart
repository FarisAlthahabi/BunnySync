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

class ProfileSuccess extends ProfileFetch {
  ProfileSuccess(super.userModel);
}

class ProfileFail extends ProfileState {
  ProfileFail(this.message);

  final String message;
}
