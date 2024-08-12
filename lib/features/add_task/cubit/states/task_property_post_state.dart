part of '../add_task_cubit.dart';

abstract class TaskPropertyPostState extends GeneralAddTaskState {}

class TaskTaskTypePostInvalid extends TaskPropertyPostState {
  TaskTaskTypePostInvalid(
    this.message,
  );
  final String message;
}

class TaskNamePostInvalid extends TaskPropertyPostState {
  TaskNamePostInvalid(
    this.message,
  );
  final String message;
}

class TaskRecurringPostInvalid extends TaskPropertyPostState {
  TaskRecurringPostInvalid(
    this.message,
  );
  final String message;
}
