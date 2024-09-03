import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/weight/cubit/add_weight_cubit/add_weight_cubit.dart';
import 'package:bunny_sync/features/weight/models/weightable_model/weightable_model.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:bunny_sync/global/models/weight_model/weight_model.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/utils/enums/entity_types.dart';
import 'package:bunny_sync/global/widgets/buttons/main_action_button.dart';
import 'package:bunny_sync/global/widgets/loading_indicator.dart';
import 'package:bunny_sync/global/widgets/main_date_picker.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:bunny_sync/global/widgets/main_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AddWeightViewCallBacks {
  void onWeightChanged(String weight);

  void onDateSelected(DateTime date, List<int> args);

  void onWeightTypeSelected(bool value);

  void onWeightSubmitted(String weight);

  void onWeightsSubmitted(String weight, int index);

  void onSave();
}

class AddWeightView extends StatelessWidget {
  const AddWeightView({
    super.key,
    required this.weightableModel,
    this.weightModel,
  });

  final WeightableModel weightableModel;
  final WeightModel? weightModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get<AddWeightCubit>(),
      child: UpdateWeightPage(
        weightableModel: weightableModel,
        weightModel: weightModel,
      ),
    );
  }
}

class UpdateWeightPage extends StatefulWidget {
  const UpdateWeightPage({
    super.key,
    required this.weightableModel,
    this.weightModel,
  });

  final WeightableModel weightableModel;
  final WeightModel? weightModel;

  @override
  State<UpdateWeightPage> createState() => _UpdateWeightPageState();
}

class _UpdateWeightPageState extends State<UpdateWeightPage>
    implements AddWeightViewCallBacks {
  late final AddWeightCubit addWeightCubit = context.read();

  List<FocusNode> weightsFocusNode = [];
  bool isIndividualKits = false;

  @override
  void initState() {
    super.initState();
    final weightModel = widget.weightModel;
    if (weightModel != null) {
      addWeightCubit.setWeight(
        weightModel.weight,
        widget.weightableModel.entityType,
      );
      addWeightCubit.setWeightDate(
        weightModel.date,
      );
    }
    addWeightCubit.setWeightType(false);
    addWeightCubit.setWeightDate(DateTime.now());
  }

  @override
  void dispose() {
    for (final element in weightsFocusNode) {
      element.dispose();
    }

    super.dispose();
  }

  @override
  void onWeightSubmitted(String weight) {}

  @override
  void onWeightsSubmitted(String price, int index) {}

  @override
  void onWeightTypeSelected(bool value) {
    addWeightCubit.setWeightType(value);
  }

  @override
  void onDateSelected(DateTime date, List<int> args) {
    addWeightCubit.setWeightDate(
      date,
    );
  }

  @override
  void onWeightChanged(String weight, {int? kitId}) {
    addWeightCubit.setWeight(
      weight,
      widget.weightableModel.entityType,
      kitId: kitId,
    );
  }

  @override
  void onSave() {
    final weightModel = widget.weightModel;
    if (weightModel != null) {
      addWeightCubit.updateWeight(
        widget.weightableModel,
        weightId: weightModel.id,
      );
    } else {
      addWeightCubit.addWeight(
        widget.weightableModel,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.weightableModel.entityType == EntityTypes.breeder) {
      return Padding(
        padding: AppConstants.paddingH16,
        child: SingleChildScrollView(
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
                MainTextField(
                  initialValue: widget.weightModel?.weight,
                  onChanged: onWeightChanged,
                  keyboardType: TextInputType.number,
                  hintText: "weight".i18n,
                  labelText: "weight".i18n,
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
                    initialDate: widget.weightModel?.date,
                    onChange: onDateSelected,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: BlocConsumer<AddWeightCubit, GeneralAddWeightState>(
                    listener: (context, state) {
                      if (state is AddWeightSuccess) {
                        MainSnackBar.showSuccessMessageBar(
                          context,
                          "weight_added".i18n,
                        );
                        context.router.maybePop();
                      } else if (state is UpdateWeightSuccess) {
                        MainSnackBar.showSuccessMessageBar(
                          context,
                          "weight_updated".i18n,
                        );
                        context.router.maybePop();
                      } else if (state is AddWeightFail) {
                        MainSnackBar.showErrorMessageBar(
                          context,
                          state.message,
                        );
                      }
                    },
                    builder: (context, state) {
                      var onTap = () => onSave();
                      Widget? child;
                      if (state is AddWeightLoading) {
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
        ),
      );
    } else if (widget.weightableModel.entityType == EntityTypes.litter) {
      return BlocBuilder<AddWeightCubit, GeneralAddWeightState>(
        builder: (context, state) {
          if (state is SetLitterWeightTypeState) {
            isIndividualKits = state.isIndividualKits;
            if (isIndividualKits) {
              weightsFocusNode = List.generate(
                widget.weightableModel.subEntities.length,
                (index) => FocusNode(),
              );
            }
          }
          return Padding(
            padding: AppConstants.paddingH16,
            child: SingleChildScrollView(
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
                          onChanged: onWeightTypeSelected,
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
                        onChange: onDateSelected,
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
                                  initialValue: widget.weightModel?.weight,
                                  onSubmitted: onWeightSubmitted,
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
                              ],
                            )
                          : Column(
                              key: const Key('entire_kits'),
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
                                ...List.generate(
                                    widget.weightableModel.subEntities.length,
                                    (index) {
                                  weightsFocusNode = List.generate(
                                    widget.weightableModel.subEntities.length,
                                    (index) => FocusNode(),
                                  );
                                  final item =
                                      widget.weightableModel.subEntities[index];
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
                                        labelText: item.displayName,
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                    ],
                                  );
                                }),
                                if (widget.weightableModel.subEntities.isEmpty)
                                  Column(
                                    children: [
                                      Center(
                                        child: Text(
                                          'kits_empty'.i18n,
                                          style: context.tt.bodyLarge?.copyWith(
                                            fontWeight: FontWeight.w700,
                                            color:
                                                context.cs.surfaceContainerHighest,
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
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: BlocConsumer<AddWeightCubit, GeneralAddWeightState>(
                        listener: (context, state) {
                          if (state is AddWeightSuccess) {
                            MainSnackBar.showSuccessMessageBar(
                              context,
                              "weight_updated".i18n,
                            );
                            context.router.maybePop();
                          } else if (state is AddWeightFail) {
                            MainSnackBar.showErrorMessageBar(
                              context,
                              state.message,
                            );
                          }
                        },
                        builder: (context, state) {
                          var onTap = () => onSave();
                          Widget? child;
                          if (state is AddWeightLoading) {
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
            ),
          );
        },
      );
    }

    return const SizedBox.shrink();
  }
}
