import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/breeder_details/view/widgets/task_tile.dart';
import 'package:bunny_sync/global/extensions/date_time_x.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';

abstract class TasksTabCallBacks {
  void onAddTap();
}

@RoutePage()
class TasksTab extends StatefulWidget {
  const TasksTab({
    super.key,
    this.title,
  });

  final String? title;

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> implements TasksTabCallBacks {
  @override
  void onAddTap() {
    // TODO: implement onAddTap
  }
  @override
  Widget build(BuildContext context) {
    final title = widget.title;

    return Scaffold(
      appBar: title != null ? const MainAppBar() : null,
      body: SingleChildScrollView(
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
                itemBuilder: (context, index) {
                  //TODO : from cubit
                  return TaskTile(
                    id: '${index + 1}',
                    breederName: 'Breeder Name',
                    createdAt: DateTime.now().formatMMddYYYY,
                    description:
                        'Cupidatat consequat aute nostrud proident duis Lorem elit',
                    icon: 'cds',
                    type: 'Custom-heart',
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 16,
                  );
                },
                itemCount: 5,
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
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
