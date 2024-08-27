import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/tasks/cubit/tasks_cubit.dart';
import 'package:bunny_sync/features/tasks/models/task_model/task_model.dart';
import 'package:bunny_sync/features/tasks/models/task_status_types/task_status_types.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/buttons/main_action_button.dart';
import 'package:bunny_sync/global/widgets/loading_indicator.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:bunny_sync/global/widgets/radio_selector_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


abstract class ChangeTaskStatusViewCallBacks {
  void onTaskStatusTypeSelected(StatusTypes taskStatusType);

  void onSaveTaskStatus();
}

class ChangeTaskStatusView extends StatelessWidget {
  const ChangeTaskStatusView({
    super.key,
    required this.task,
    required this.tasksCubit,
  });

  final TaskModel task;
  final TasksCubit tasksCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: tasksCubit,
      child: ChangeTaskStatusPage(
        task: task,
      ),
    );
  }
}

class ChangeTaskStatusPage extends StatefulWidget {
  const ChangeTaskStatusPage({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  State<ChangeTaskStatusPage> createState() => _ChangeTaskStatusPageState();
}

class _ChangeTaskStatusPageState extends State<ChangeTaskStatusPage>
    implements ChangeTaskStatusViewCallBacks {
  late final TasksCubit tasksCubit = context.read();

  @override
  void onTaskStatusTypeSelected(StatusTypes? taskStatusType) {
    tasksCubit.setTaskStatusType(taskStatusType);
  }

  @override
  void onSaveTaskStatus() {
    tasksCubit.changeTaskStatus(widget.task.id);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConstants.padding16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'task_status'.i18n,
            style: context.tt.bodyLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: context.cs.surfaceContainerHighest,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          RadioSelectorWidget(
            selected: widget.task.status,
            items: StatusTypes.values,
            onSelected: onTaskStatusTypeSelected,
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            width: double.maxFinite,
            child: BlocConsumer<TasksCubit, GeneralTasksState>(
              listener: (context, state) {
                if (state is ChangeTaskStatusSuccess) {
                  tasksCubit.updateTask(state.task);
                  MainSnackBar.showSuccessMessageBar(
                    context,
                    "task_status_updated".i18n,
                  );
                  context.router.maybePop();
                } else if (state is ChangeTaskStatusFail) {
                  MainSnackBar.showErrorMessageBar(
                    context,
                    state.message,
                  );
                }
              },
              builder: (context, state) {
                var onTap = () => onSaveTaskStatus();
                Widget? child;
                if (state is ChangeTaskStatusLoading) {
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
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
