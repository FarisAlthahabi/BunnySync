part of '../health_cubit.dart';

@immutable
abstract class DeleteAilmentState extends GeneralHealthState {}

class DeleteAilmentSuccess extends DeleteAilmentState {
  DeleteAilmentSuccess();
}

class DeleteAilmentLoading extends DeleteAilmentState {}

class DeleteAilmentFail extends DeleteAilmentState {
  DeleteAilmentFail(this.message);

  final String message;
}
