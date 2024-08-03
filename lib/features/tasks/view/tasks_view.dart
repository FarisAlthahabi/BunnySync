import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/tasks/cubit/tasks_cubit.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/router/router.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/element_tile.dart';
import 'package:bunny_sync/global/widgets/main_app_bar.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:bunny_sync/global/widgets/texts/bordered_textual_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class TasksViewCallBacks {
  void onAddTap();

  void onTryAgain();
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
    context.router.push(const AddTaskRoute());
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.title;

    return Scaffold(
      appBar: title != null ? const MainAppBar() : null,
      body: BlocBuilder<TasksCubit, GeneralTasksState>(
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
                            leading: Skeleton.shade(
                              child: BorderedTextualWidget(
                                text: item.id.toString(),
                              ),
                            ),
                            tag: item.who,
                            createdAt: item.startDate.toString(),
                            title: Text(
                              strutStyle: const StrutStyle(height: 1.6),
                              item.name,
                              style: context.tt.titleSmall?.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            type: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.favorite_outline_outlined,
                                  color: context.cs.onSurface,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  item.type,
                                  style: context.tt.labelSmall
                                      ?.copyWith(color: context.cs.tertiary),
                                ),
                              ],
                            ),
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
            return MainErrorWidget(error: state.message);
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
