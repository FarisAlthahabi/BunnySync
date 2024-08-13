part of '../tasks_cubit.dart';

@immutable
abstract class TasksState extends GeneralTasksState {}

class TasksInitial extends TasksState {}

class TasksFetch extends TasksState {
  TasksFetch(this.tasks);

  final List<TaskModel> tasks;
}

class TasksLoading extends TasksFetch {
  TasksLoading(super.tasks);
}

class TasksSuccess extends TasksFetch {
  TasksSuccess(super.tasks);
}

class TasksEmpty extends TasksState {
  TasksEmpty(this.message);

  final String message;
}

class TasksFail extends TasksState {
  TasksFail(this.message);

  final String message;
}
