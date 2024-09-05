import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/litters/models/litter_entry_model/litter_entry_model.dart';
import 'package:bunny_sync/features/litters/view/widgets/kit_butcher_text_fields_widget.dart';
import 'package:bunny_sync/global/blocs/litter_concerns_cubit/cubit/litter_concerns_cubit.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/buttons/main_action_button.dart';
import 'package:bunny_sync/global/widgets/loading_indicator.dart';
import 'package:bunny_sync/global/widgets/main_date_picker.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:bunny_sync/global/widgets/main_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ButcherLitterViewCallBacks {
  void onButcherTypeSelected(bool value);

  void onButcherDateSelected(DateTime date, List<int> args);

  void onWeightChanged(String weight, {int? kitId});

  void onPreWeightChanged(String weight, {int? kitId});

  void onPriceChanged(String weight, {int? kitId});

  void onPreWeightSubmitted(String weight);

  void onPriceSubmitted(String price);

  void onWeightSubmitted(String weight);

  void onPreWeightsSubmitted(String weight, int index);

  void onPricesSubmitted(String price, int index);

  void onWeightsSubmitted(String weight, int index);

  void onButcher();
}

class ButcherLitterView extends StatelessWidget {
  const ButcherLitterView({
    super.key,
    required this.litterEntryModel,
  });

  final LitterEntryModel litterEntryModel;

  @override
  Widget build(BuildContext context) {
    return ButcherLitterPage(
      litterEntryModel: litterEntryModel,
    );
  }
}

class ButcherLitterPage extends StatefulWidget {
  const ButcherLitterPage({
    super.key,
    required this.litterEntryModel,
  });

  final LitterEntryModel litterEntryModel;

  @override
  State<ButcherLitterPage> createState() => _ButcherLitterPageState();
}

class _ButcherLitterPageState extends State<ButcherLitterPage>
    implements ButcherLitterViewCallBacks {
  late final LitterConcernsCubit litterConcernsCubit = context.read();

  final weightFocusNode = FocusNode();
  final preWeightFocusNode = FocusNode();
  final priceFocusNode = FocusNode();

  List<FocusNode> weightsFocusNode = [];
  List<FocusNode> preWeightsFocusNode = [];
  List<FocusNode> pricesFocusNode = [];

  bool isIndividualKits = false;

  @override
  void initState() {
    super.initState();
    litterConcernsCubit.setButcherType(false);
    weightsFocusNode = List.generate(
      widget.litterEntryModel.allKits.length,
      (index) => FocusNode(),
    );
    preWeightsFocusNode = List.generate(
      widget.litterEntryModel.allKits.length,
      (index) => FocusNode(),
    );
    pricesFocusNode = List.generate(
      widget.litterEntryModel.allKits.length,
      (index) => FocusNode(),
    );
  }

  @override
  void dispose() {
    weightFocusNode.dispose();
    preWeightFocusNode.dispose();
    priceFocusNode.dispose();

    for (final element in weightsFocusNode) {
      element.dispose();
    }
    for (final element in preWeightsFocusNode) {
      element.dispose();
    }
    for (final element in pricesFocusNode) {
      element.dispose();
    }
    super.dispose();
  }

  @override
  void onButcherTypeSelected(bool value) {
    litterConcernsCubit.setButcherType(value);
  }

  @override
  void onButcher() {
    litterConcernsCubit.butcher(widget.litterEntryModel.id);
  }

  @override
  void onButcherDateSelected(DateTime date, List<int> args) {
    litterConcernsCubit.setButcherDate(date);
  }

  @override
  void onWeightChanged(String weight, {int? kitId}) {
    litterConcernsCubit.setButcherWeight(
      weight,
      kitId: kitId,
    );
  }

  @override
  void onPreWeightChanged(String weight, {int? kitId}) {
    litterConcernsCubit.setButcherPreWeight(
      weight,
      kitId: kitId,
    );
  }

  @override
  void onPriceChanged(String weight, {int? kitId}) {
    litterConcernsCubit.setButcherPrice(
      weight,
      kitId: kitId,
    );
  }

  @override
  void onPreWeightSubmitted(String weight) {
    priceFocusNode.requestFocus();
  }

  @override
  void onPriceSubmitted(String weight) {
    priceFocusNode.unfocus();
  }

  @override
  void onWeightSubmitted(String weight) {
    preWeightFocusNode.requestFocus();
  }

  @override
  void onPreWeightsSubmitted(String weight, int index) {
    pricesFocusNode[index].requestFocus();
  }

  @override
  void onPricesSubmitted(String price, int index) {
    if (index != pricesFocusNode.length - 1) {
      weightsFocusNode[index + 1].requestFocus();
    } else {
      pricesFocusNode[index].unfocus();
    }
  }

  @override
  void onWeightsSubmitted(String price, int index) {
    preWeightsFocusNode[index].requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LitterConcernsCubit, GeneralLitterConcernsState>(
      builder: (context, state) {
        if (state is SetLitterButcherTypeState) {
          isIndividualKits = state.isIndividualKits;
        }
        return Padding(
          padding: AppConstants.paddingH16,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
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
                      value: isIndividualKits,
                      onChanged: onButcherTypeSelected,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      isIndividualKits
                          ? 'individual_kits'.i18n
                          : 'entire_kits'.i18n,
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
                    onChange: onButcherDateSelected,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                AnimatedHeightAndFade(
                  child: !isIndividualKits
                      ? Column(
                          key: const Key('individual_kits'),
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MainTextField(
                              onSubmitted: onWeightSubmitted,
                              focusNode: weightFocusNode,
                              onChanged: (String weight) {
                                onWeightChanged(weight);
                              },
                              keyboardType: TextInputType.number,
                              hintText: "weight".i18n,
                              labelText: "weight".i18n,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            MainTextField(
                              onSubmitted: onPreWeightSubmitted,
                              focusNode: preWeightFocusNode,
                              onChanged: (String weight) {
                                onPreWeightChanged(weight);
                              },
                              keyboardType: TextInputType.number,
                              hintText: "preWeight".i18n,
                              labelText: "preWeight".i18n,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            MainTextField(
                              onSubmitted: onPriceSubmitted,
                              focusNode: priceFocusNode,
                              onChanged: (String price) {
                                onPriceChanged(price);
                              },
                              keyboardType: TextInputType.number,
                              hintText: "price".i18n,
                              labelText: "price".i18n,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                          ],
                        )
                      : Column(
                          key: const Key('entire_kits'),
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...List.generate(
                              widget.litterEntryModel.allKits.length,
                              (index) {
                                final item =
                                    widget.litterEntryModel.allKits[index];
                                return LitterButcherTextFieldsWidget(
                                  index: index,
                                  kit: item,
                                  isInitiallyExpanded: index == 0,
                                  onPreWeightChanged: onPreWeightChanged,
                                  onPreWeightsSubmitted: onPreWeightsSubmitted,
                                  onPriceChanged: onPriceChanged,
                                  onPricesSubmitted: onPricesSubmitted,
                                  onWeightChanged: onWeightChanged,
                                  onWeightsSubmitted: onWeightsSubmitted,
                                  preWeightFocusNode:
                                      preWeightsFocusNode[index],
                                  weightFocusNode: weightsFocusNode[index],
                                  priceFocusNode: pricesFocusNode[index],
                                );
                              },
                            ),
                          ],
                        ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                  child: BlocConsumer<LitterConcernsCubit,
                      GeneralLitterConcernsState>(
                    listener: (context, state) {
                      if (state is ButcherLitterSuccess) {
                        MainSnackBar.showSuccessMessageBar(
                          context,
                          "litter_butcher".i18n,
                        );
                        context.router.maybePop();
                      } else if (state is ButcherLitterFail) {
                        MainSnackBar.showErrorMessageBar(
                          context,
                          state.message,
                        );
                      }
                    },
                    builder: (context, state) {
                      var onTap = onButcher;
                      Widget? child;
                      if (state is ButcherLitterLoading) {
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
          ),
        );
      },
    );
  }
}
