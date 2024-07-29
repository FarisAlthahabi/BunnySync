import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/global/extensions/date_time_x.dart';
import 'package:bunny_sync/global/router/router.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/element_tile.dart';
import 'package:bunny_sync/global/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';

abstract class TasksViewCallBacks {
  void onAddTap();
}

@RoutePage()
class TasksView extends StatefulWidget {
  const TasksView({
    super.key,
    this.title,
    this.scrollController,
  });

  final String? title;
  final ScrollController? scrollController;

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> implements TasksViewCallBacks {
  @override
  void onAddTap() {
    context.router.push(const AddTaskRoute());
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.title;

    return Scaffold(
      appBar: title != null ? const MainAppBar() : null,
      body: SingleChildScrollView(
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
                itemBuilder: (context, index) {
                  //TODO : from cubit
                  return ElementTile(
                    no: '${index + 1}',
                    tag: 'Breeder Name',
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
