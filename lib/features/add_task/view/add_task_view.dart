import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/add_task/cubit/add_task_cubit.dart';
import 'package:bunny_sync/features/breeders/cubit/breeders_cubit.dart';
import 'package:bunny_sync/features/breeders/models/breeder_by_gender_model/breeder_by_gender_model.dart';
import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:bunny_sync/features/litters/cubit/litters_cubit.dart';
import 'package:bunny_sync/features/litters/models/litter_entry_model/litter_entry_model.dart';
import 'package:bunny_sync/features/tasks/cubit/tasks_cubit.dart';
import 'package:bunny_sync/features/tasks/model/task_model/task_model.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/localization/localization.dart';
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

abstract class AddTaskPageCallBacks {
  void onTypeSelected(BreederByGenderModel? type);

  void onTaskTypeSelected(BreederByGenderModel? type);

  void onNameChanged(String name);

  void onNameSubmitted(String name);

  void onBreederSelected(BreederEntryModel? breeder);

  void onLitterSelected(LitterEntryModel? litter);

  void onDateSelected(DateTime date, List<int> numbers);

  void onRecurringSelected(BreederByGenderModel? recurringPeriod);

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
        BlocProvider.value(value: tasksCubit),
        BlocProvider(create: (context) => get<AddTaskCubit>()),
        BlocProvider(create: (context) => get<BreedersCubit>()),
        BlocProvider(create: (context) => get<LittersCubit>()),
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
    implements AddTaskPageCallBacks {
  late final AddTaskCubit addTaskCubit = context.read();

  late final TasksCubit tasksCubit = context.read();

  late final BreedersCubit breedersCubit = context.read();

  late final LittersCubit littersCubit = context.read();

  final nameFocusNode = FocusNode();

  final noteFocusNode = FocusNode();

  bool showSelectBreeder = false;

  // TODO: remove thess and get them from cubit

  final List<BreederByGenderModel> types = [
    BreederByGenderModel(id: 1, name: 'general'.i18n),
    BreederByGenderModel(id: 2, name: 'breeder'.i18n),
    BreederByGenderModel(id: 3, name: 'litter'.i18n),
  ];
  final List<BreederByGenderModel> taskTypes = [
    const BreederByGenderModel(id: 1, name: 'Breed'),
    const BreederByGenderModel(id: 2, name: 'Pregnancy check'),
    const BreederByGenderModel(id: 3, name: 'Birth'),
    const BreederByGenderModel(id: 4, name: 'Weight'),
    const BreederByGenderModel(id: 5, name: 'Nest box'),
    const BreederByGenderModel(id: 6, name: 'Medical'),
    const BreederByGenderModel(id: 7, name: 'Calendar'),
    const BreederByGenderModel(id: 8, name: 'Heart'),
    const BreederByGenderModel(id: 9, name: 'Ribbon'),
    const BreederByGenderModel(id: 10, name: 'Eye'),
    const BreederByGenderModel(id: 11, name: 'Flag'),
    const BreederByGenderModel(id: 12, name: 'Paw'),
    const BreederByGenderModel(id: 13, name: 'Trophy'),
  ];
  final List<BreederByGenderModel> recurringPeriods = [
    const BreederByGenderModel(id: 1, name: 'Once'),
    const BreederByGenderModel(id: 2, name: 'Every Week'),
    const BreederByGenderModel(id: 3, name: 'Every 2 Weeks'),
    const BreederByGenderModel(id: 4, name: 'Every Month'),
  ];
  BreederByGenderModel? selectedType;
  BreederByGenderModel? selectedTaskType;
  BreederEntryModel? selectedBreeder;
  LitterEntryModel? selectedLitter;
  BreederByGenderModel? selectedRecurringPeriod;
  @override
  void initState() {
    breedersCubit.getBreeders();
    littersCubit.getLitters();
    final task = widget.task;
    if (task != null) {
      addTaskCubit.setType(
        task.litterId == null ? 'breeder'.i18n : 'litter'.i18n,
      );
      addTaskCubit.setTaskType(task.type);
      //  addTaskCubit.setWho(task.who);
      addTaskCubit.setName(task.name);
      addTaskCubit.setDate(task.startDate);
      addTaskCubit.setRecurring(task.recurring);
      addTaskCubit.setNote(task.note);
    }
    super.initState();
  }

  @override
  void onBreederSelected(BreederEntryModel? breeder) {
    addTaskCubit.setWho(breeder?.name);
    setState(() {
      selectedBreeder = breeder;
    });
  }

  @override
  void onLitterSelected(LitterEntryModel? litter) {
    addTaskCubit.setWho(litter?.litterId);
    setState(() {
      selectedLitter = litter;
    });
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
  void onRecurringSelected(BreederByGenderModel? recurringPeriod) {
      addTaskCubit.setRecurring(recurringPeriod?.id.toString());
    setState(() {
      selectedRecurringPeriod = recurringPeriod;
    });
  }

  @override
  void onTaskTypeSelected(BreederByGenderModel? taskType) {
    addTaskCubit.setTaskType(taskType?.name);
    setState(() {
      selectedTaskType = taskType;
    });
  }

  @override
  void onTypeSelected(BreederByGenderModel? type) {
    addTaskCubit.setType(type?.name);
    setState(() {
      selectedType = type;
      if (type?.name != 'general'.i18n) {
        showSelectBreeder = true;
      } else {
        showSelectBreeder = false;
      }
    });
  }

  @override
  void onSave() {
    addTaskCubit.addTask();
  }

  @override
  void dispose() {
    nameFocusNode.dispose();
    noteFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: Text(
          'create_task'.i18n,
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
                              BlocBuilder<LittersCubit, GeneralLittersState>(
                                builder: (context, innerState2) {
                                  if (innerState2 is LittersSuccess &&
                                      state is BreedersSuccess) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Text(
                                          'type'.i18n,
                                          style: context.tt.bodyLarge?.copyWith(
                                            fontWeight: FontWeight.w700,
                                            color: context
                                                .cs.surfaceContainerHighest,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        MainDropDownWidget<
                                            BreederByGenderModel>(
                                          items: types,
                                          text: 'select_type'.i18n,
                                          onChanged: onTypeSelected,
                                          selectedValue: selectedType,
                                        ),
                                        const SizedBox(
                                          height: 25,
                                        ),
                                        Visibility(
                                          visible: showSelectBreeder,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'who'.i18n,
                                                style: context.tt.bodyLarge
                                                    ?.copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  color: context.cs
                                                      .surfaceContainerHighest,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              if (selectedType?.name ==
                                                  'breeder'.i18n)
                                                MainDropDownWidget<
                                                    BreederEntryModel>(
                                                  items: state
                                                      .breedersStatusModel.all,
                                                  text: 'select_breeder'.i18n,
                                                  onChanged: onBreederSelected,
                                                  selectedValue:
                                                      selectedBreeder,
                                                ),
                                              if (selectedType?.name ==
                                                  'litter'.i18n)
                                                MainDropDownWidget<
                                                    LitterEntryModel>(
                                                  items: innerState2
                                                      .littersStatusModel.all,
                                                  text: 'select_litter'.i18n,
                                                  onChanged: onLitterSelected,
                                                  selectedValue: selectedLitter,
                                                ),
                                              const SizedBox(
                                                height: 25,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          'task_type'.i18n,
                                          style: context.tt.bodyLarge?.copyWith(
                                            fontWeight: FontWeight.w700,
                                            color: context
                                                .cs.surfaceContainerHighest,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        MainDropDownWidget<
                                            BreederByGenderModel>(
                                          items: taskTypes,
                                          text: 'select_type'.i18n,
                                          onChanged: onTaskTypeSelected,
                                          selectedValue: selectedTaskType,
                                        ),
                                        const SizedBox(
                                          height: 25,
                                        ),
                                      ],
                                    );
                                  } else if (innerState is LittersFail) {
                                    return Text(innerState.message);
                                  } else {
                                    return const SizedBox();
                                  }
                                },
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
                              MainDropDownWidget<BreederByGenderModel>(
                                items: recurringPeriods,
                                text: 'select_recurring'.i18n,
                                onChanged: onRecurringSelected,
                                selectedValue: selectedRecurringPeriod,
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
