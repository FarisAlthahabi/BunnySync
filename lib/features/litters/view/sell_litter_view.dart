import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/customers/cubit/customers_cubit.dart';
import 'package:bunny_sync/features/customers/models/customer_model/customer_model.dart';
import 'package:bunny_sync/features/litters/models/litter_entry_model/litter_entry_model.dart';
import 'package:bunny_sync/global/blocs/litter_concerns_cubit/cubit/litter_concerns_cubit.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/localization/localization.dart';
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

abstract class SellLitterViewCallBacks {
  void onSellDateSelected(DateTime date, List<int> args);

  void onSellCustomerSelected(CustomerModel? contact);

  void onSellPriceChanged(String price, {int? kitId});

  void onSellPriceSubmitted(String price);

  void onSellPricesSubmitted(String price, int index);

  void onSellTypeSelected(bool value);

  void onSaveSell(int litterId);
}

class SellLitterView extends StatelessWidget {
  const SellLitterView({
    super.key,
    required this.litterEntryModel,
  });

  final LitterEntryModel litterEntryModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get<CustomersCubit>(),
      child: SellLitterPage(
        litterEntryModel: litterEntryModel,
      ),
    );
  }
}

class SellLitterPage extends StatefulWidget {
  const SellLitterPage({
    super.key,
    required this.litterEntryModel,
  });

  final LitterEntryModel litterEntryModel;

  @override
  State<SellLitterPage> createState() => _SellLitterPageState();
}

class _SellLitterPageState extends State<SellLitterPage>
    implements SellLitterViewCallBacks {
  late final LitterConcernsCubit litterConcernsCubit = context.read();

  late final CustomersCubit customersCubit = context.read();

  final sellPriceFocusNode = FocusNode();

  List<FocusNode> sellPricesFocusNode = [];

  bool sellType = true;

  @override
  void dispose() {
    sellPriceFocusNode.dispose();
    for (final element in sellPricesFocusNode) {
      element.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    customersCubit.getCustomers();
    sellPricesFocusNode = List.generate(
      widget.litterEntryModel.allKits.length,
      (index) => FocusNode(),
    );
  }

  @override
  void onSellTypeSelected(bool value) {
    setState(() {
      sellType = value;
    });
    litterConcernsCubit.setSellType(value);
  }

  @override
  void onSaveSell(int litterId) {
    litterConcernsCubit.saveSell(litterId);
  }

  @override
  void onSellCustomerSelected(CustomerModel? customer) {
    litterConcernsCubit.setCustomerId(customer?.id);
  }

  @override
  void onSellDateSelected(DateTime date, List<int> args) {
    litterConcernsCubit.setSellDate(date);
  }

  @override
  void onSellPriceChanged(String price, {int? kitId}) {
    litterConcernsCubit.setSellPrices(
      price,
      kitId: kitId,
    );
  }

  @override
  void onSellPriceSubmitted(String price) {
    sellPriceFocusNode.unfocus();
  }

  @override
  void onSellPricesSubmitted(String price, int index) {
    if (index != sellPricesFocusNode.length - 1) {
      sellPricesFocusNode[index].unfocus();
      sellPricesFocusNode[index + 1].requestFocus();
    } else {
      sellPricesFocusNode[index].unfocus();
    }
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
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Switch(
                inactiveTrackColor: context.cs.onPrimary,
                value: sellType,
                onChanged: onSellTypeSelected,
              ),
              const SizedBox(width: 10),
              Text(
                sellType ? 'individual_kits'.i18n : 'entire_kits'.i18n,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: context.cs.primaryFixed,
                ),
              ),
            ],
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
          if (!sellType)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainTextField(
                  onSubmitted: onSellPriceSubmitted,
                  onChanged: (String price) {
                    onSellPriceChanged(price);
                  },
                  focusNode: sellPriceFocusNode,
                  keyboardType: TextInputType.number,
                  hintText: "price".i18n,
                  labelText: "price".i18n,
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          if (sellType)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'price'.i18n,
                  style: context.tt.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: context.cs.surfaceContainerHighest,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ...List.generate(widget.litterEntryModel.allKits.length,
                    (index) {
                  final item = widget.litterEntryModel.allKits[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MainTextField(
                        onSubmitted: (String price) {
                          onSellPricesSubmitted(price, index);
                        },
                        onChanged: (String price) {
                          onSellPriceChanged(price, kitId: item.id);
                        },
                        focusNode: sellPricesFocusNode[index],
                        keyboardType: TextInputType.number,
                        hintText: "price".i18n,
                        labelText: item.code,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  );
                }),
                if (widget.litterEntryModel.allKits.isEmpty)
                  Column(
                    children: [
                      Center(
                        child: Text(
                          'kits_empty'.i18n,
                          style: context.tt.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: context.cs.surfaceContainerHighest,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
              ],
            ),
          SizedBox(
            width: double.maxFinite,
            child:
                BlocConsumer<LitterConcernsCubit, GeneralLitterConcernsState>(
              listener: (context, state) {
                if (state is SaveSellLitterSuccess) {
                  MainSnackBar.showSuccessMessageBar(
                    context,
                    "litter_sell".i18n,
                  );
                  context.router.maybePop();
                } else if (state is SaveSellLitterFail) {
                  MainSnackBar.showErrorMessageBar(
                    context,
                    state.message,
                  );
                }
              },
              builder: (context, state) {
                var onTap = () => onSaveSell(widget.litterEntryModel.id);
                Widget? child;
                if (state is SaveSellLitterLoading) {
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
