part of '../add_kit_cubit.dart';

@immutable
sealed class AddKitState extends GeneralAddKitState {}

final class AddKitInitial extends AddKitState {}

final class AddKitLoading extends AddKitState {}

final class AddKitSuccess extends AddKitState {
  AddKitSuccess(this.kit);

  final KitModel kit;
}

final class UpdateKitSuccess extends AddKitState {
  UpdateKitSuccess(this.kit);

  final KitModel kit;
}

final class AddKitError extends AddKitState {
  AddKitError(this.error);

  final String error;
}
