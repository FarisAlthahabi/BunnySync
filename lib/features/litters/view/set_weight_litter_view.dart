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

abstract class SetWeightLitterViewCallBacks {
  void onWeightDateSelected(DateTime date, List<int> args);

  void onWeightChanged(String weight, {int? kitId});

  void onWeightSubmitted(String weight);

  void onWeightsSubmitted(String weight, int index);

  void onWeightTypeSelected(bool value);

  void onSaveWeight(int litterId);
}

class SetWeightLitterView extends StatelessWidget {
  const SetWeightLitterView({
    super.key,
    required this.litterEntryModel,
  });

  final LitterEntryModel litterEntryModel;

  @override
  Widget build(BuildContext context) {
    return SetWeightLitterPage(
      litterEntryModel: litterEntryModel,
    );
  }
}

class SetWeightLitterPage extends StatefulWidget {
  const SetWeightLitterPage({
    super.key,
    required this.litterEntryModel,
  });

  final LitterEntryModel litterEntryModel;

  @override
  State<SetWeightLitterPage> createState() => _SetWeightLitterPageState();
}

class _SetWeightLitterPageState extends State<SetWeightLitterPage>
    implements SetWeightLitterViewCallBacks {
  late final LitterConcernsCubit litterConcernsCubit = context.read();

  final weightFocusNode = FocusNode();

  List<FocusNode> weightsFocusNode = [];

  bool weightType = true;

  @override
  void dispose() {
    weightFocusNode.dispose();
    super.dispose();
  }

  @override
  void onWeightTypeSelected(bool value) {
    setState(() {
      weightType = value;
    });
    litterConcernsCubit.setWeightType(value);
  }

  @override
  void onSaveWeight(int litterId) {
    litterConcernsCubit.saveWeight(litterId);
  }


  @override
  void onWeightDateSelected(DateTime date, List<int> args) {
    litterConcernsCubit.setWeightDate(date);
  }

  @override
  void onWeightChanged(String weight, {int? kitId}) {
    litterConcernsCubit.setWeights(
      weight,
      kitId: kitId,
    );
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
    
    final activeKits =
        widget.litterEntryModel.allKits.where((element) {
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
                        textFieldLabelText: item.code,
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
                if (state is SaveWeightLitterSuccess) {
                  MainSnackBar.showSuccessMessageBar(
                    context,
                    "weight_updated".i18n,
                  );
                  context.router.maybePop();
                } else if (state is SaveWeightLitterFail) {
                  MainSnackBar.showErrorMessageBar(
                    context,
                    state.message,
                  );
                }
              },
              builder: (context, state) {
                var onTap = () => onSaveWeight(widget.litterEntryModel.id);
                Widget? child;
                if (state is SaveWeightLitterLoading) {
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
