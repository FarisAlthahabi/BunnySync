import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/add_ledger/models/ledger_model/ledger_model.dart';
import 'package:bunny_sync/features/ledger/cubit/ledgers_cubit.dart';
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

abstract class ChangeLedgerStatusViewCallBacks {
  void onLedgerStatusTypeSelected(StatusTypes ledgerStatusType);

  void onSaveLedgerStatus();
}

class ChangeLedgerStatusView extends StatelessWidget {
  const ChangeLedgerStatusView({
    super.key,
    required this.ledger,
    required this.ledgersCubit,
  });

  final LedgerModel ledger;
  final LedgersCubit ledgersCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: ledgersCubit,
      child: ChangeLedgerStatusPage(
        ledger: ledger,
      ),
    );
  }
}

class ChangeLedgerStatusPage extends StatefulWidget {
  const ChangeLedgerStatusPage({
    super.key,
    required this.ledger,
  });

  final LedgerModel ledger;

  @override
  State<ChangeLedgerStatusPage> createState() => _ChangeLedgerStatusPageState();
}

class _ChangeLedgerStatusPageState extends State<ChangeLedgerStatusPage>
    implements ChangeLedgerStatusViewCallBacks {
  late final LedgersCubit ledgersCubit = context.read();

  @override
  void onLedgerStatusTypeSelected(StatusTypes? ledgerStatusType) {
    ledgersCubit.setLedgerStatusType(ledgerStatusType);
  }

  @override
  void onSaveLedgerStatus() {
    ledgersCubit.changeLedgerStatus(widget.ledger.id);
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
            'ledger_status'.i18n,
            style: context.tt.bodyLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: context.cs.surfaceContainerHighest,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          RadioSelectorWidget(
            selected: widget.ledger.status,
            items: StatusTypes.values,
            onSelected: onLedgerStatusTypeSelected,
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            width: double.maxFinite,
            child: BlocConsumer<LedgersCubit, GeneralLedgersState>(
              listener: (context, state) {
                if (state is ChangeLedgerStatusSuccess) {
                  ledgersCubit.updateLedger(state.ledger);
                  MainSnackBar.showSuccessMessageBar(
                    context,
                    "ledger_status_updated".i18n,
                  );
                  context.router.maybePop();
                } else if (state is ChangeLedgerStatusFail) {
                  MainSnackBar.showErrorMessageBar(
                    context,
                    state.message,
                  );
                }
              },
              builder: (context, state) {
                var onTap = () => onSaveLedgerStatus();
                Widget? child;
                if (state is ChangeLedgerStatusLoading) {
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
