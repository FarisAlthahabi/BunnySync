import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/tasks/cubit/tasks_cubit.dart';
import 'package:bunny_sync/features/tasks/model/task_model/task_model.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/extensions/date_time_x.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/router/router.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:bunny_sync/global/widgets/element_tile.dart';
import 'package:bunny_sync/global/widgets/main_app_bar.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:bunny_sync/global/widgets/main_show_bottom_sheet.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:bunny_sync/global/widgets/texts/bordered_textual_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class TasksViewCallBacks {
  void onAddTap();

  void onTryAgain();

  void onTaskTap(TaskModel taskModel);

  void onEditTap(TaskModel taskModel);

  void onDeleteTap(TaskModel taskModel);
}

@RoutePage()
class TasksView extends StatelessWidget {
  const TasksView({super.key, this.title, this.scrollController});

  final String? title;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get<TasksCubit>(),
      child: TasksPage(
        scrollController: scrollController,
        title: title,
      ),
    );
  }
}

class TasksPage extends StatefulWidget {
  const TasksPage({
    super.key,
    this.title,
    this.scrollController,
  });

  final String? title;
  final ScrollController? scrollController;

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> implements TasksViewCallBacks {
  late final TasksCubit tasksCubit = context.read();

  @override
  void initState() {
    tasksCubit.getTasks();
    super.initState();
  }

  @override
  void onTryAgain() {
    tasksCubit.getTasks();
  }

  @override
  void onAddTap() {
    context.router.push(AddTaskRoute(tasksCubit: tasksCubit));
  }

  @override
  void onDeleteTap(TaskModel taskModel) {
    context.router.popForced();
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        title: 'are_you_sure_to_delete_task'.i18n,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {
                context.router.popForced();
                tasksCubit.deleteTask(taskModel.id);
              },
              child: Text('yes'.i18n),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onEditTap(TaskModel taskModel) {
    Navigator.pop(context);
    context.router.push(
      AddTaskRoute(
        tasksCubit: tasksCubit,
        task: taskModel,
      ),
    );
  }

  @override
  void onTaskTap(TaskModel taskModel) {
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        title: 'task_options'.i18n,
        onEdit: onEditTap,
        onDelete: onDeleteTap,
        model: taskModel,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.title;

    return Scaffold(
      appBar: title != null ? const MainAppBar() : null,
      body: BlocConsumer<TasksCubit, GeneralTasksState>(
        listener: (context, state) {
          if (state is DeleteTaskSuccess) {
            context.loaderOverlay.hide();
            MainSnackBar.showSuccessMessageBar(
              context,
              'task_deleted'.i18n,
            );
          } else if (state is TasksFail) {
            context.loaderOverlay.hide();
            MainSnackBar.showErrorMessageBar(
              context,
              state.message,
            );
          } else if (state is DeleteTaskLoading) {
            context.loaderOverlay.show();
          } else if (state is DeleteTaskFail) {
            context.loaderOverlay.hide();
            MainSnackBar.showErrorMessageBar(
              context,
              state.message,
            );
          }
        },
        buildWhen: (prev, curr) => curr is TasksState,
        builder: (context, state) {
          if (state is TasksFetch) {
            return Skeletonizer(
              enabled: state is TasksLoading,
              child: SingleChildScrollView(
                controller: widget.scrollController,
                child: Padding(
                  padding: AppConstants.padding16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (title != null)
                        Text(
                          title,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      const SizedBox(height: 10),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.tasks.length,
                        itemBuilder: (context, index) {
                          final item = state.tasks[index];
                          return ElementTile(
                            onTap: onTaskTap,
                            model: item,
                            leading: Skeleton.shade(
                              child: BorderedTextualWidget(
                                text: (index + 1).toString(),
                              ),
                            ),
                            tag: item.who,
                            createdAt: item.startDate.formatMMMMMDoYYYY,
                            title: Text(
                              strutStyle: const StrutStyle(height: 1.6),
                              item.name,
                              style: context.tt.titleMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            type: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  item.type.displayName,
                                  style: context.tt.labelMedium
                                      ?.copyWith(color: context.cs.tertiary),
                                ),
                              ],
                            ),
                            note: item.note,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 16,
                          );
                        },
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is TasksEmpty) {
            return MainErrorWidget(error: state.message);
          } else if (state is TasksFail) {
            return MainErrorWidget(
              error: state.message,
              onTap: onTryAgain,
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
      floatingActionButton: Padding(
        padding: AppConstants.padding16,
        child: FloatingActionButton(
          onPressed: onAddTap,
          shape: RoundedRectangleBorder(
            borderRadius: AppConstants.circularBorderRadius,
          ),
          backgroundColor: context.cs.secondaryContainer,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
