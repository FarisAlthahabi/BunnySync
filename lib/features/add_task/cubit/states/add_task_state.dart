part of '../add_task_cubit.dart';

@immutable
abstract class AddTaskState extends GeneralAddTaskState {}

class AddTaskInitial extends AddTaskState {}

class AddTaskLoading extends AddTaskState {}

class AddTaskSuccess extends AddTaskState {
  AddTaskSuccess(this.task);

  final TaskModel task;
}

class AddTaskFail extends AddTaskState {
  AddTaskFail(this.message);

  final String message;
}
