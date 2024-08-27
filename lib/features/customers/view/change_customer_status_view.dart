import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/customers/cubit/customers_cubit.dart';
import 'package:bunny_sync/features/customers/model/customer_model/customer_model.dart';
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

abstract class ChangeCustomerStatusViewCallBacks {
  void onCustomerStatusTypeSelected(StatusTypes customerStatusType);

  void onSaveCustomerStatus();
}

class ChangeCustomerStatusView extends StatelessWidget {
  const ChangeCustomerStatusView({
    super.key,
    required this.customer,
    required this.customersCubit,
  });

  final CustomerModel customer;
  final CustomersCubit customersCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: customersCubit,
      child: ChangeCustomerStatusPage(
        customer: customer,
      ),
    );
  }
}

class ChangeCustomerStatusPage extends StatefulWidget {
  const ChangeCustomerStatusPage({
    super.key,
    required this.customer,
  });

  final CustomerModel customer;

  @override
  State<ChangeCustomerStatusPage> createState() => _ChangeCustomerStatusPageState();
}

class _ChangeCustomerStatusPageState extends State<ChangeCustomerStatusPage>
    implements ChangeCustomerStatusViewCallBacks {
  late final CustomersCubit customersCubit = context.read();

  @override
  void onCustomerStatusTypeSelected(StatusTypes? customerStatusType) {
    customersCubit.setCustomerStatusType(customerStatusType);
  }

  @override
  void onSaveCustomerStatus() {
    customersCubit.changeCustomerStatus(widget.customer.id);
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
            'customer_status'.i18n,
            style: context.tt.bodyLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: context.cs.surfaceContainerHighest,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          RadioSelectorWidget(
            selected: widget.customer.status,
            items: StatusTypes.values,
            onSelected: onCustomerStatusTypeSelected,
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            width: double.maxFinite,
            child: BlocConsumer<CustomersCubit, GeneralCustomersState>(
              listener: (context, state) {
                if (state is ChangeCustomerStatusSuccess) {
                  customersCubit.updateCustomer(state.customer);
                  MainSnackBar.showSuccessMessageBar(
                    context,
                    "customer_status_updated".i18n,
                  );
                  context.router.maybePop();
                } else if (state is ChangeCustomerStatusFail) {
                  MainSnackBar.showErrorMessageBar(
                    context,
                    state.message,
                  );
                }
              },
              builder: (context, state) {
                var onTap = () => onSaveCustomerStatus();
                Widget? child;
                if (state is ChangeCustomerStatusLoading) {
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
