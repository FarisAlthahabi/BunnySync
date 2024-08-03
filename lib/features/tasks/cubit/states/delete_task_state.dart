part of '../tasks_cubit.dart';

@immutable
abstract class DeleteTaskState extends GeneralTasksState {}

class DeleteTaskSuccess extends DeleteTaskState {
  DeleteTaskSuccess();
}

class DeleteTaskLoading extends DeleteTaskState {}

class DeleteTaskFail extends DeleteTaskState {
  DeleteTaskFail(this.message);

  final String message;
}
