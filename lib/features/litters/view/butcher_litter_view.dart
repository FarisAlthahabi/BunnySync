import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/litters/models/litter_entry_model/litter_entry_model.dart';
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
  void onWeightDateSelected(DateTime date, List<int> args);

  void onWeightChanged(String weight, {int? kitId});

  void onWeightSubmitted(String weight);

  void onPreWeightChanged(String weight, {int? kitId});

  void onPreWeightSubmitted(String weight);

  void onPriceChanged(String weight, {int? kitId});

  void onPriceSubmitted(String weight);

  void onWeightsSubmitted(String weight, int index);

  void onWeightTypeSelected(bool value);

  void onButcher(int litterId);
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

  final preweightFocusNode = FocusNode();

  final priceFocusNode = FocusNode();

  List<FocusNode> weightsFocusNode = [];

  bool weightType = true;

  @override
  void dispose() {
    weightFocusNode.dispose();
    priceFocusNode.dispose();
    preweightFocusNode.dispose();
    super.dispose();
  }

  @override
  void onWeightTypeSelected(bool value) {
    setState(() {
      weightType = value;
    });
  }

  @override
  void onButcher(int litterId) {
    litterConcernsCubit.butcher(litterId);
  }

  @override
  void onWeightDateSelected(DateTime date, List<int> args) {}

  @override
  void onWeightChanged(String weight, {int? kitId}) {}

  @override
  void onPreWeightChanged(String weight, {int? kitId}) {
    litterConcernsCubit.setButcherPreWeight(weight, kitId: kitId);
  }

  @override
  void onPreWeightSubmitted(String weight) {
    // TODO: implement onPreWeightSubmitted
  }

  @override
  void onPriceChanged(String weight, {int? kitId}) {
    litterConcernsCubit.setButcherPrice(weight, kitId: kitId);
  }

  @override
  void onPriceSubmitted(String weight) {
    // TODO: implement onPriceSubmitted
  }

  @override
  void onWeightSubmitted(String weight) {
    weightFocusNode.unfocus();
  }

  @override
  void onWeightsSubmitted(String price, int index) {
    //TODO : fix this logic
    if (index != weightsFocusNode.length - 1) {
      weightsFocusNode[index].unfocus();
      weightsFocusNode[index + 1].requestFocus();
    } else {
      weightsFocusNode[index].unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    //TODO : fix this , if statement go to else , althought status is not null
    //? status in kit model has to be nullable,
    //? if not , serialization will not work

    final activeKits = widget.litterEntryModel.allKits.where((element) {
      final status = element.status;
      if (status != null) {
        return status.isActive;
      } else {
        return true;
      }
    }).toList();
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
                value: weightType,
                onChanged: onWeightTypeSelected,
              ),
              const SizedBox(width: 10),
              Text(
                weightType ? 'individual_kits'.i18n : 'entire_kits'.i18n,
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
              onChange: onWeightDateSelected,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          if (!weightType)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainTextField(
                  onSubmitted: onWeightSubmitted,
                  onChanged: (String weight) {
                    onWeightChanged(weight);
                  },
                  focusNode: weightFocusNode,
                  keyboardType: TextInputType.number,
                  hintText: "weight".i18n,
                  labelText: "weight".i18n,
                ),
                const SizedBox(
                  height: 25,
                ),
                MainTextField(
                  onSubmitted: onPreWeightSubmitted,
                  onChanged: (String weight) {
                    onPreWeightChanged(weight);
                  },
                  focusNode: preweightFocusNode,
                  keyboardType: TextInputType.number,
                  hintText: "preWeight".i18n,
                  labelText: "preWeight".i18n,
                ),
                const SizedBox(
                  height: 25,
                ),
                MainTextField(
                  onSubmitted: onPriceSubmitted,
                  onChanged: (String weight) {
                    onPriceChanged(weight);
                  },
                  focusNode: priceFocusNode,
                  keyboardType: TextInputType.number,
                  hintText: "price".i18n,
                  labelText: "price".i18n,
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          if (weightType)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'weight'.i18n,
                  style: context.tt.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: context.cs.surfaceContainerHighest,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ...List.generate(activeKits.length, (index) {
                  weightsFocusNode = List.generate(
                    widget.litterEntryModel.allKits.length,
                    (index) => FocusNode(),
                  );
                  final item = activeKits[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MainTextField(
                        onSubmitted: (String weight) {
                          onWeightsSubmitted(weight, index);
                        },
                        onChanged: (String weight) {
                          onWeightChanged(weight, kitId: item.id);
                        },
                        focusNode: weightsFocusNode[index],
                        keyboardType: TextInputType.number,
                        hintText: "weight".i18n,
                        labelText: item.code,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  );
                }),
                if (activeKits.isEmpty)
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
                var onTap = () => onButcher(widget.litterEntryModel.id);
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
    );
  }
}
