import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/add_ailment/model/recurring_periods_types/recurring_periods_types.dart';
import 'package:bunny_sync/features/add_task/cubit/add_task_cubit.dart';
import 'package:bunny_sync/features/add_task/model/task_genres/task_genres.dart';
import 'package:bunny_sync/features/add_task/model/task_types/task_types.dart';
import 'package:bunny_sync/features/breeders/cubit/breeders_cubit.dart';
import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:bunny_sync/features/litters/cubit/litters_cubit.dart';
import 'package:bunny_sync/features/litters/models/litter_entry_model/litter_entry_model.dart';
import 'package:bunny_sync/features/tasks/cubit/tasks_cubit.dart';
import 'package:bunny_sync/features/tasks/model/task_model/task_model.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/mixins/mixins.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/buttons/main_action_button.dart';
import 'package:bunny_sync/global/widgets/loading_indicator.dart';
import 'package:bunny_sync/global/widgets/main_app_bar.dart';
import 'package:bunny_sync/global/widgets/main_date_picker.dart';
import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:bunny_sync/global/widgets/main_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class AddTaskViewCallBacks {
  void onTypeSelected(TaskTypes? type);

  void onTaskGenreSelected(TaskGenres genre);

  void onNameChanged(String name);

  void onNameSubmitted(String name);

  void onBreederSelected(BreederEntryModel? breeder);

  void onLitterSelected(LitterEntryModel? litter);

  void onDateSelected(DateTime date, List<int> numbers);

  void onRecurringSelected(RecurringPeriodsTypes? recurringPeriod);

  void onNoteChanged(String note);

  void onNoteSubmitted(String note);

  void onSave();
}

@RoutePage()
class AddTaskView extends StatelessWidget {
  const AddTaskView({
    super.key,
    required this.tasksCubit,
    this.task,
  });

  final TasksCubit tasksCubit;
  final TaskModel? task;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: tasksCubit,
        ),
        BlocProvider(
          create: (context) => get<AddTaskCubit>(),
        ),
        BlocProvider(
          create: (context) => get<BreedersCubit>(),
        ),
        BlocProvider(
          create: (context) => get<LittersCubit>(),
        ),
      ],
      child: AddTaskPage(task: task),
    );
  }
}

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key, this.task});

  final TaskModel? task;

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage>
    with PostFrameMixin
    implements AddTaskViewCallBacks {
  late final AddTaskCubit addTaskCubit = context.read();

  late final TasksCubit tasksCubit = context.read();

  late final BreedersCubit breedersCubit = context.read();

  late final LittersCubit littersCubit = context.read();

  final nameFocusNode = FocusNode();

  final noteFocusNode = FocusNode();

  @override
  void dispose() {
    nameFocusNode.dispose();
    noteFocusNode.dispose();
    super.dispose();
  }

  @override
  void onTypeSelected(TaskTypes? type) {
    addTaskCubit.setType(type);
  }

  @override
  void onBreederSelected(BreederEntryModel? breeder) {
    addTaskCubit.setBreederId(breeder?.id);
  }

  @override
  void onLitterSelected(LitterEntryModel? litter) {
    addTaskCubit.setLitterId(litter?.id);
  }

  @override
  void onDateSelected(DateTime date, List<int> numbers) {
    addTaskCubit.setDate(date);
  }

  @override
  void onNameChanged(String name) {
    addTaskCubit.setName(name);
  }

  @override
  void onNameSubmitted(String name) {
    noteFocusNode.requestFocus();
  }

  @override
  void onNoteChanged(String note) {
    addTaskCubit.setNote(note);
  }

  @override
  void onNoteSubmitted(String note) {
    onSave();
  }

  @override
  void onRecurringSelected(RecurringPeriodsTypes? recurringPeriod) {
    addTaskCubit.setRecurring(recurringPeriod);
  }

  @override
  void onTaskGenreSelected(TaskGenres? genre) {
    addTaskCubit.setTaskGenre(genre);
  }

  @override
  void onSave() {
    final task = widget.task;
    if (task != null) {
      addTaskCubit.updateTask(task.id);
    } else {
      addTaskCubit.addTask();
    }
  }

  @override
  void onPostFrame() {
    final task = widget.task;
    if (task != null) {
      if (task.breederId != null) {
        addTaskCubit.setType(TaskTypes.breeder);
        addTaskCubit.setBreederId(task.breederId);
      } else if (task.litterId != null) {
        addTaskCubit.setType(TaskTypes.litter);
        addTaskCubit.setLitterId(task.litterId);
      } else {
        addTaskCubit.setType(TaskTypes.general);
      }

      addTaskCubit.setTaskGenre(task.type);
      addTaskCubit.setName(task.name);
      addTaskCubit.setDate(task.startDate);
      addTaskCubit.setRecurring(task.recurring);
      addTaskCubit.setNote(task.note);
    }

    breedersCubit.getBreeders();
    littersCubit.getLitters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: Text(
          widget.task == null ? 'create_task'.i18n : 'update_task'.i18n,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocBuilder<BreedersCubit, GeneralBreedersState>(
          builder: (context, state) {
            return BlocBuilder<LittersCubit, GeneralLittersState>(
              builder: (context, innerState) {
                return Skeletonizer(
                  enabled:
                      state is BreedersLoading && innerState is LittersLoading,
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Padding(
                          padding: AppConstants.paddingH16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                'type'.i18n,
                                style: context.tt.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: context.cs.surfaceContainerHighest,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              BlocBuilder<AddTaskCubit, GeneralAddTaskState>(
                                buildWhen: (previous, current) =>
                                    current is ShowTaskTypeState,
                                builder: (context, state) {
                                  return MainDropDownWidget<TaskTypes>(
                                    items: TaskTypes.values,
                                    text: 'select_type'.i18n,
                                    onChanged: onTypeSelected,
                                    selectedValue: state is ShowTaskTypeState
                                        ? state.taskType
                                        : null,
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              BlocBuilder<AddTaskCubit, GeneralAddTaskState>(
                                buildWhen: (previous, current) =>
                                    current is ShowTaskTypeState,
                                builder: (context, innerState3) {
                                  if (innerState3 is ShowTaskTypeState) {
                                    if (innerState3.taskType.isBreeder) {
                                      if (state is BreedersSuccess) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'breeders'.i18n,
                                              style: context.tt.bodyLarge
                                                  ?.copyWith(
                                                fontWeight: FontWeight.w700,
                                                color: context
                                                    .cs.surfaceContainerHighest,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            MainDropDownWidget<
                                                BreederEntryModel>(
                                              items:
                                                  state.breedersStatusModel.all,
                                              text: 'select_breeder'.i18n,
                                              onChanged: onBreederSelected,
                                              selectedValue: addTaskCubit
                                                  .getSelectedBreeder(
                                                state.breedersStatusModel.all,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 25,
                                            ),
                                          ],
                                        );
                                      }

                                      return const SizedBox();
                                    } else if (innerState3.taskType.isLitter) {
                                      if (innerState is LittersSuccess) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'litters'.i18n,
                                              style: context.tt.bodyLarge
                                                  ?.copyWith(
                                                fontWeight: FontWeight.w700,
                                                color: context
                                                    .cs.surfaceContainerHighest,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            MainDropDownWidget<
                                                LitterEntryModel>(
                                              items: innerState
                                                  .littersStatusModel.all,
                                              text: 'select_litter'.i18n,
                                              onChanged: onLitterSelected,
                                              selectedValue: addTaskCubit
                                                  .getSelectedLitter(
                                                innerState
                                                    .littersStatusModel.all,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 25,
                                            ),
                                          ],
                                        );
                                      }
                                    }
                                  }

                                  return const SizedBox();
                                },
                              ),
                              Text(
                                'task_type'.i18n,
                                style: context.tt.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: context.cs.surfaceContainerHighest,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              MainDropDownWidget<TaskGenres>(
                                items: TaskGenres.values,
                                text: 'select_type'.i18n,
                                onChanged: onTaskGenreSelected,
                                selectedValue: addTaskCubit.getTaskGenre(),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              MainTextField(
                                initialValue: widget.task?.name,
                                onSubmitted: onNameSubmitted,
                                onChanged: onNameChanged,
                                focusNode: nameFocusNode,
                                hintText: 'name'.i18n,
                                labelText: 'name'.i18n,
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Text(
                                "date".i18n,
                                style: context.tt.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: context.cs.primaryFixed,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Center(
                                child: Skeleton.shade(
                                  child: MainDatePicker(
                                    initialDate: widget.task?.startDate,
                                    onChange: onDateSelected,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Text(
                                'recurring'.i18n,
                                style: context.tt.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: context.cs.surfaceContainerHighest,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              MainDropDownWidget<RecurringPeriodsTypes>(
                                items: RecurringPeriodsTypes.values,
                                text: 'select_recurring'.i18n,
                                onChanged: onRecurringSelected,
                                selectedValue:
                                    addTaskCubit.getSelectedRecurringType(),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              MainTextField(
                                initialValue: widget.task?.note,
                                onSubmitted: onNoteSubmitted,
                                onChanged: onNoteChanged,
                                focusNode: noteFocusNode,
                                hintText: 'note'.i18n,
                                labelText: 'note'.i18n,
                                maxLines: 4,
                              ),
                              const SizedBox(
                                height: 100,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: AppConstants.paddingH16,
                            child: SizedBox(
                              width: double.maxFinite,
                              child: BlocConsumer<AddTaskCubit,
                                  GeneralAddTaskState>(
                                listener: (context, state) {
                                  if (state is AddTaskSuccess) {
                                    tasksCubit.addTask(state.task);
                                    MainSnackBar.showSuccessMessageBar(
                                      context,
                                      "task_added".i18n,
                                    );
                                    context.router.maybePop();
                                  } else if (state is UpdateTaskSuccess) {
                                    tasksCubit.updateTask(state.task);
                                    MainSnackBar.showSuccessMessageBar(
                                      context,
                                      "task_updated".i18n,
                                    );
                                    context.router.maybePop();
                                  } else if (state is AddTaskFail) {
                                    MainSnackBar.showErrorMessageBar(
                                      context,
                                      state.message,
                                    );
                                  }
                                },
                                builder: (context, state) {
                                  var onTap = onSave;
                                  Widget? child;
                                  if (state is AddTaskLoading) {
                                    onTap = () {};
                                    child = const LoadingIndicator();
                                  }
                                  return MainActionButton(
                                    onTap: onTap,
                                    text: "save".i18n,
                                    child: child,
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
