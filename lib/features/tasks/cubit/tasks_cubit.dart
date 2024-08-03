import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/tasks/model/task_model/task_model.dart';
import 'package:bunny_sync/features/tasks/model/tasks_fake_model.dart';
import 'package:bunny_sync/features/tasks/repo/tasks_repo.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/tasks_state.dart';

part 'states/general_tasks_state.dart';

@injectable
class TasksCubit extends Cubit<GeneralTasksState> {
  TasksCubit(this._tasksRepo) : super(TasksInitial());

  final TasksRepo _tasksRepo;

  Future<void> getBreeders() async {
    emit(TasksLoading(fakeTasks));
    try {
      final response = await _tasksRepo.getTasks();
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
}
