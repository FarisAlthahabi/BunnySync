import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/status/cubit/status_cubit.dart';
import 'package:bunny_sync/features/status/models/statusable_model.dart';
import 'package:bunny_sync/features/tasks/models/task_status_types/task_status_types.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/buttons/main_action_button.dart';
import 'package:bunny_sync/global/widgets/loading_indicator.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:bunny_sync/global/widgets/radio_selector_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ChangeStatusViewCallBacks {
  void onStatusTypeSelected(StatusTypes statusType);

  void onSaveStatus();
}

class ChangeStatusView extends StatelessWidget {
  const ChangeStatusView({
    super.key,
    required this.statusableModel,
    required this.onSuccess,
    required this.title,
    required this.successMessgage,
  });

  final StatusableModel statusableModel;
  final ValueSetter<StatusableModel> onSuccess;
  final String title;
  final String successMessgage;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get<StatusCubit>(),
      child: ChangeStatusPage(
        statusableModel: statusableModel,
        onSuccess: onSuccess,
        title: title,
        successMessgage: successMessgage,
      ),
    );
  }
}

class ChangeStatusPage extends StatefulWidget {
  const ChangeStatusPage({
    super.key,
    required this.statusableModel,
    required this.onSuccess,
    required this.title,
    required this.successMessgage,
  });

  final StatusableModel statusableModel;
  final ValueSetter<StatusableModel> onSuccess;
  final String title;
  final String successMessgage;

  @override
  State<ChangeStatusPage> createState() => _ChangeStatusPageState();
}

class _ChangeStatusPageState extends State<ChangeStatusPage>
    implements ChangeStatusViewCallBacks {
  late final StatusCubit statusCubit = context.read();

  @override
  void onStatusTypeSelected(StatusTypes? statusType) {
    statusCubit.setStatusType(statusType);
  }

  @override
  void onSaveStatus() {
    statusCubit.changeStatus(widget.statusableModel);
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
            widget.title,
            style: context.tt.bodyLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: context.cs.surfaceContainerHighest,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          RadioSelectorWidget(
            selected: widget.statusableModel.status,
            items: StatusTypes.values,
            onSelected: onStatusTypeSelected,
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            width: double.maxFinite,
            child: BlocConsumer<StatusCubit, GeneralStatusState>(
              listener: (context, state) {
                if (state is ChangeStatusSuccess) {
                  widget.onSuccess(state.statusableModel);
                  MainSnackBar.showSuccessMessageBar(
                    context,
                    widget.successMessgage,
                  );
                  context.router.maybePop();
                } else if (state is ChangeStatusFail) {
                  MainSnackBar.showErrorMessageBar(
                    context,
                    state.message,
                  );
                }
              },
              builder: (context, state) {
                var onTap = () => onSaveStatus();
                Widget? child;
                if (state is ChangeStatusLoading) {
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
