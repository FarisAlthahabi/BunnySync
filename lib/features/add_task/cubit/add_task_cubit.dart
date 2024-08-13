import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/add_ailment/model/recurring_periods_types/recurring_periods_types.dart';
import 'package:bunny_sync/features/add_task/model/task_genres/task_genres.dart';
import 'package:bunny_sync/features/add_task/model/task_post_model/task_post_model.dart';
import 'package:bunny_sync/features/add_task/model/task_types/task_types.dart';
import 'package:bunny_sync/features/add_task/repo/add_task_repo.dart';
import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:bunny_sync/features/litters/models/litter_entry_model/litter_entry_model.dart';
import 'package:bunny_sync/features/tasks/model/task_model/task_model.dart';
import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/add_task_state.dart';

part 'states/general_add_task_state.dart';

part 'states/show_task_type_state.dart';

part 'states/task_property_post_state.dart';

@injectable
class AddTaskCubit extends Cubit<GeneralAddTaskState> {
  AddTaskCubit(this._addTaskRepo) : super(AddTaskInitial());

  final AddTaskRepo _addTaskRepo;

  TaskPostModel _taskPostModel = const TaskPostModel();

  void setType(TaskTypes? type) {
    if (type == null) {
      emit(AddTaskFail('task_type_null'.i18n));
      return;
    }

    _taskPostModel = _taskPostModel.copyWith(
      type: () => type,
    );

    emit(ShowTaskTypeState(type));
  }

  void setBreederId(int? breederId) {
    _taskPostModel = _taskPostModel.copyWith(
      who: () => breederId.toString(),
    );
  }

  BreederEntryModel? getSelectedBreeder(List<BreederEntryModel> breeders) {
    final who = _taskPostModel.who;
    if (_taskPostModel.type.isBreeder && who != null) {
      return breeders.firstWhereOrNull(
        (element) => element.id == int.parse(who),
      );
    }

    return null;
  }

  void setLitterId(int? litterId) {
    _taskPostModel = _taskPostModel.copyWith(
      who: () => litterId.toString(),
    );
  }

  LitterEntryModel? getSelectedLitter(List<LitterEntryModel> litters) {
    final who = _taskPostModel.who;
    if (_taskPostModel.type.isLitter && who != null) {
      return litters.firstWhereOrNull(
        (element) => element.id == int.parse(who),
      );
    }

    return null;
  }

  void setTaskGenre(TaskGenres? genre) {
    _taskPostModel = _taskPostModel.copyWith(
      taskType: () => genre,
    );
  }

  TaskGenres? getTaskGenre() {
    return TaskGenres.values.firstWhereOrNull(
      (element) => element == _taskPostModel.taskType,
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

  void setRecurring(RecurringPeriodsTypes? recurring) {
    _taskPostModel = _taskPostModel.copyWith(
      recurring: () => recurring,
    );
  }

  RecurringPeriodsTypes? getSelectedRecurringType() {
    return RecurringPeriodsTypes.values.firstWhereOrNull(
      (element) => element == _taskPostModel.recurring,
    );
  }

  void setNote(String note) {
    _taskPostModel = _taskPostModel.copyWith(
      note: () => note,
    );
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
