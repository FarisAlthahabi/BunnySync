import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/customers/cubit/customers_cubit.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/buttons/main_action_button.dart';
import 'package:bunny_sync/global/widgets/loading_indicator.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:bunny_sync/global/widgets/main_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class QuickAddCustomerViewCallBacks {
  void onNameChanged(String name);

  void onNameSubmitted(String name);

  void onEmailChanged(String email);

  void onEmailSubmitted(String email);

  void onSave();
}

class QuickAddCustomerView extends StatelessWidget {
  const QuickAddCustomerView({
    super.key,
    required this.customersCubit,
  });

  final CustomersCubit customersCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: customersCubit,
      child: const QuickAddCustomerPage(),
    );
  }
}

class QuickAddCustomerPage extends StatefulWidget {
  const QuickAddCustomerPage({super.key});

  @override
  State<QuickAddCustomerPage> createState() => _QuickAddCustomerPageState();
}

class _QuickAddCustomerPageState extends State<QuickAddCustomerPage>
    implements QuickAddCustomerViewCallBacks {
  late final CustomersCubit customersCubit = context.read();

  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();

  @override
  void onEmailChanged(String email) {
    customersCubit.setEmail(email);
  }

  @override
  void onEmailSubmitted(String email) {
    emailFocusNode.unfocus();
  }

  @override
  void onNameChanged(String name) {
    customersCubit.setName(name);
  }

  @override
  void onNameSubmitted(String name) {
    emailFocusNode.requestFocus();
  }

  @override
  void onSave() {
    customersCubit.quickAddCustomer();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConstants.padding16,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          MainTextField(
            onSubmitted: onNameSubmitted,
            onChanged: onNameChanged,
            focusNode: nameFocusNode,
            hintText: 'name'.i18n,
            labelText: 'name'.i18n,
            keyboardType: TextInputType.name,
          ),
          const SizedBox(
            height: 25,
          ),
          MainTextField(
            onSubmitted: onEmailSubmitted,
            onChanged: onEmailChanged,
            focusNode: emailFocusNode,
            hintText: 'email'.i18n,
            labelText: 'email'.i18n,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            width: double.maxFinite,
            child: BlocConsumer<CustomersCubit, GeneralCustomersState>(
              listener: (context, state) {
                if (state is QuickAddCustomerEmailInvalid) {
                  MainSnackBar.showErrorMessageBar(
                    context,
                    state.message,
                  );
                }
                if (state is QuickAddCustomerNameInvalid) {
                  MainSnackBar.showErrorMessageBar(
                    context,
                    state.message,
                  );
                }
                if (state is QuickAddCustomerSuccess) {
                  //TODO .....
                  //widget.onSuccess(state.customer);
                  customersCubit.addCustomer(state.customer);
                  MainSnackBar.showSuccessMessageBar(
                    context,
                    "customer_added".i18n,
                  );
                  context.router.maybePop();
                } else if (state is QuickAddCustomerFail) {
                  MainSnackBar.showErrorMessageBar(
                    context,
                    state.message,
                  );
                }
              },
              builder: (context, state) {
                var onTap = onSave;
                Widget? child;
                if (state is QuickAddCustomerLoading) {
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
