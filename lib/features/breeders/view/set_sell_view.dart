import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/customers/cubit/customers_cubit.dart';
import 'package:bunny_sync/features/customers/model/customer_model/customer_model.dart';
import 'package:bunny_sync/global/blocs/rabbit_concerns_cubit/rabbit_concerns_cubit.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/animation/animated_switchers/animated_switchers.dart';
import 'package:bunny_sync/global/widgets/buttons/main_action_button.dart';
import 'package:bunny_sync/global/widgets/loading_indicator.dart';
import 'package:bunny_sync/global/widgets/main_date_picker.dart';
import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:bunny_sync/global/widgets/main_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SetSellViewCallBacks {
  void onSellDateSelected(DateTime date, List<int> args);

  void onSellCustomerSelected(CustomerModel? contact);

  void onSellPriceChanged(String price);

  void onSellPriceSubmitted(String price);

  void onSaveSell(int breederId);
}

class SetSellView extends StatelessWidget {
  const SetSellView({
    super.key,
    required this.breederId,
  });

  final int breederId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => get<RabbitConcernsCubit>(),
        ),
        BlocProvider(
          create: (context) => get<CustomersCubit>(),
        ),
      ],
      child: SetSellPage(
        breederId: breederId,
      ),
    );
  }
}

class SetSellPage extends StatefulWidget {
  const SetSellPage({
    super.key,
    required this.breederId,
  });

  final int breederId;

  @override
  State<SetSellPage> createState() => _SetSellPageState();
}

class _SetSellPageState extends State<SetSellPage>
    implements SetSellViewCallBacks {
  late final RabbitConcernsCubit rabbitConcernsCubit = context.read();

  late final CustomersCubit customersCubit = context.read();

  final FocusNode sellPriceFocusNode = FocusNode();

  @override
  void dispose() {
    sellPriceFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    customersCubit.getCustomers();
  }

  @override
  void onSaveSell(int breederId) {
    rabbitConcernsCubit.saveSell(breederId);
  }

  @override
  void onSellCustomerSelected(CustomerModel? customer) {
    rabbitConcernsCubit.setCustomerId(customer?.id);
  }

  @override
  void onSellDateSelected(DateTime date, List<int> args) {
    rabbitConcernsCubit.setSellDate(date);
  }

  @override
  void onSellPriceChanged(String price) {
    rabbitConcernsCubit.setSellPrice(price);
  }

  @override
  void onSellPriceSubmitted(String price) {
    sellPriceFocusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConstants.paddingH16,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          MainTextField(
            onSubmitted: onSellPriceSubmitted,
            onChanged: onSellPriceChanged,
            focusNode: sellPriceFocusNode,
            keyboardType: TextInputType.number,
            hintText: "price".i18n,
            labelText: "price".i18n,
          ),
          const SizedBox(
            height: 25,
          ),
          BlocBuilder<CustomersCubit, GeneralCustomersState>(
            builder: (context, state) {
              Widget child;
              if (state is CustomersSuccess) {
                child = MainDropDownWidget<CustomerModel>(
                  items: state.customers,
                  text: 'select_contact'.i18n,
                  onChanged: onSellCustomerSelected,
                );
              } else if (state is CustomersLoading) {
                child = Center(
                  child: LoadingIndicator(
                    color: context.cs.primary,
                  ),
                );
              } else if (state is CustomersFail) {
                child = MainErrorWidget(
                  error: state.message,
                  onTap: () {
                    customersCubit.getCustomers();
                  },
                );
              } else {
                child = const SizedBox();
              }

              return AnimatedSwitcherWithSize(
                child: child,
              );
            },
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            "set_date".i18n,
            style: context.tt.bodyLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.darkGrey,
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: MainDatePicker(
              onChange: onSellDateSelected,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            width: double.maxFinite,
            child: BlocConsumer<RabbitConcernsCubit, GeneralRabbitConcernsState>(
              listener: (context, state) {
                if (state is SaveSellSuccess) {
                  MainSnackBar.showSuccessMessageBar(
                    context,
                    "breeder_sell".i18n,
                  );
                  context.router.maybePop();
                } else if (state is SaveSellFail) {
                  MainSnackBar.showErrorMessageBar(
                    context,
                    state.message,
                  );
                }
              },
              builder: (context, state) {
                var onTap = () => onSaveSell(widget.breederId);
                Widget? child;
                if (state is SaveSellLoading) {
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
