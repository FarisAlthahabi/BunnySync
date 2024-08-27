part of '../tasks_cubit.dart';

@immutable
abstract class ChangeTaskStatusState extends GeneralTasksState {}

class ChangeTaskStatusLoading extends ChangeTaskStatusState {}

class ChangeTaskStatusSuccess extends ChangeTaskStatusState {
  ChangeTaskStatusSuccess(this.task);

final TaskModel task;
}

class ChangeTaskStatusFail extends ChangeTaskStatusState {
  ChangeTaskStatusFail(this.message);

  final String message;
}
