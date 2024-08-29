part of '../status_cubit.dart';

@immutable
abstract class ChangeStatusState extends GeneralStatusState {}

class ChangeStatusLoading extends ChangeStatusState {}

class ChangeStatusSuccess extends ChangeStatusState {
  ChangeStatusSuccess(this.statusableModel);

  final StatusableModel statusableModel;
}

class ChangeStatusFail extends ChangeStatusState {
  ChangeStatusFail(this.message);

  final String message;
}
