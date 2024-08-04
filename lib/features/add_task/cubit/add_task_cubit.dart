import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/add_task/model/task_post_model/task_post_model.dart';
import 'package:bunny_sync/features/add_task/repo/add_task_repo.dart';
import 'package:bunny_sync/features/tasks/model/task_model/task_model.dart';
import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/add_task_state.dart';

part 'states/general_add_task_state.dart';

part 'states/task_property_post_state.dart';

part 'states/drop_down_state.dart';

@injectable
class AddTaskCubit extends Cubit<GeneralAddTaskState> {
  AddTaskCubit(this._addTaskRepo) : super(AddTaskInitial());

  final AddTaskRepo _addTaskRepo;

  TaskPostModel _taskPostModel = const TaskPostModel();

  void setType(String? type) {
    _taskPostModel = _taskPostModel.copyWith(
      type: () => type,
    );
  }

  void setWho(String? who) {
    _taskPostModel = _taskPostModel.copyWith(
      who: () => who,
    );
  }

  void setTaskType(String? taskType) {
    _taskPostModel = _taskPostModel.copyWith(
      taskType: () => taskType,
    );
  }

  void setName(String name) {
    _taskPostModel = _taskPostModel.copyWith(
      name: () => name,
    );
  }

  void setDate(DateTime date) {
    _taskPostModel = _taskPostModel.copyWith(
      date: () => date,
    );
  }

  void setRecurring(String? recurring) {
    _taskPostModel = _taskPostModel.copyWith(
      recurring: () => recurring,
    );
  }

  void setNote(String note) {
    _taskPostModel = _taskPostModel.copyWith(
      note: () => note,
    );
  }

  void selectWhoType<T extends DropDownItemModel>(T? model) {
    emit(WhoDropDownState(model));
  }

  Future<void> addTask() async {
    final taskTypeError = _taskPostModel.validateTaskType();
    final nameError = _taskPostModel.validateName();
    final recurringError = _taskPostModel.validateRecurring();
    if (taskTypeError != null) {
      emit(TaskTaskTypePostInvalid(taskTypeError));
      return;
    }
    if (nameError != null) {
      emit(TaskNamePostInvalid(nameError));
      return;
    }
    if (recurringError != null) {
      emit(TaskRecurringPostInvalid(recurringError));
      return;
    }

    emit(AddTaskLoading());

    try {
      final task = await _addTaskRepo.addTask(_taskPostModel);
      emit(AddTaskSuccess(task));
    } catch (e, s) {
      addError(e, s);
      emit(AddTaskFail(e.toString()));
    }
  }

  Future<void> updateTask(int taskId) async {
    final taskTypeError = _taskPostModel.validateTaskType();
    final nameError = _taskPostModel.validateName();
    final recurringError = _taskPostModel.validateRecurring();
    if (taskTypeError != null) {
      emit(TaskTaskTypePostInvalid(taskTypeError));
      return;
    }
    if (nameError != null) {
      emit(TaskNamePostInvalid(nameError));
      return;
    }
    if (recurringError != null) {
      emit(TaskRecurringPostInvalid(recurringError));
      return;
    }

    emit(AddTaskLoading());

    try {
      final task = await _addTaskRepo.updateTask(_taskPostModel, taskId);
      emit(UpdateTaskSuccess(task));
    } catch (e, s) {
      addError(e, s);
      emit(AddTaskFail(e.toString()));
    }
  }
}
