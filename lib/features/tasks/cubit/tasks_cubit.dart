import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/tasks/models/task_model/task_model.dart';
import 'package:bunny_sync/features/tasks/models/task_status_types/task_status_types.dart';
import 'package:bunny_sync/features/tasks/models/tasks_fake_model.dart';
import 'package:bunny_sync/features/tasks/repo/tasks_repo.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/tasks_state.dart';

part 'states/delete_task_state.dart';

part 'states/change_task_status_state.dart';

part 'states/general_tasks_state.dart';

@injectable
class TasksCubit extends Cubit<GeneralTasksState> {
  TasksCubit(this._tasksRepo) : super(TasksInitial());

  final TasksRepo _tasksRepo;

  List<TaskModel> tasks = [];

  StatusTypes taskStatusType = StatusTypes.archive;

  Future<void> getTasks({
    int? breederId,
    int? litterId,
  }) async {
    emit(TasksLoading(fakeTasks));
    try {
      final response = await _tasksRepo.getTasks(
        breederId: breederId,
        litterId: litterId,
      );
      tasks = response;
      if (response.isEmpty) {
        emit(TasksEmpty("no_tasks".i18n));
      } else {
        emit(TasksSuccess(response));
      }
    } catch (e, s) {
      addError(e, s);
      emit(TasksFail(e.toString()));
    }
  }

  void addTask(TaskModel task) {
    tasks.add(task);
    emit(TasksSuccess(tasks));
  }

  void updateTask(TaskModel task) {
    tasks = tasks.map((e) {
      if (e.id == task.id) {
        return task;
      }
      return e;
    }).toList();
    emit(TasksSuccess(tasks));
  }

  Future<void> deleteTask(int taskId) async {
    emit(DeleteTaskLoading());
    try {
      await _tasksRepo.deleteTask(taskId);
      tasks.removeWhere(
        (element) => element.id == taskId,
      );
      emit(DeleteTaskSuccess());

      if (tasks.isEmpty) {
        emit(TasksEmpty("no_tasks".i18n));
      } else {
        emit(TasksSuccess(tasks));
      }
    } catch (e, s) {
      addError(e, s);
      emit(DeleteTaskFail(e.toString()));
    }
  }

  Future<void> changeTaskStatus(int taskId) async {
    emit(ChangeTaskStatusLoading());
    try {
      final response = await _tasksRepo.changeTaskStatus(
        taskId,
        taskStatusType,
      );
      emit(ChangeTaskStatusSuccess(response));
    } catch (e, s) {
      addError(e, s);
      emit(ChangeTaskStatusFail(e.toString()));
    }
  }
}
