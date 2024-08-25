import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/litter_details/model/kit_model/kit_model.dart';
import 'package:bunny_sync/features/litter_details/model/litter_details_response_model/litter_details_response_fake_model.dart';
import 'package:bunny_sync/features/litters/models/litter_entry_model/litter_entry_model.dart';
import 'package:bunny_sync/global/blocs/rabbit_concerns_cubit/rabbit_concerns_cubit.dart';
import 'package:bunny_sync/global/blocs/weight_cubit/cubit/weight_cubit.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/models/weight_model/weight_model.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/utils/enums/entity_types.dart';
import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:bunny_sync/global/widgets/buttons/main_action_button.dart';
import 'package:bunny_sync/global/widgets/element_tile.dart';
import 'package:bunny_sync/global/widgets/loading_indicator.dart';
import 'package:bunny_sync/global/widgets/main_date_picker.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:bunny_sync/global/widgets/main_show_bottom_sheet.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:bunny_sync/global/widgets/main_text_field.dart';
import 'package:bunny_sync/global/widgets/texts/bordered_textual_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class UpdateBreederWeightViewCallBacks {
  void onTryAgainTap();

  void onWeightTap(WeightModel weightModel);

  void onWeightChanged(String weight, {int? kitId});

  void onDateSelected(DateTime date, List<int> args);

  void onWeightTypeSelected(bool value);

  void onWeightSubmitted(String weight);

  void onWeightsSubmitted(String weight, int index);

  void onSave(
    EntityTypes entityType, {
    int? weightId,
    int? litterId,
    int? kitId,
  });
}

class UpdateBreederWeightView extends StatelessWidget {
  const UpdateBreederWeightView({
    super.key,
    this.breederId,
    required this.entityType,
    this.litterEntryModel,
  });

  final int? breederId;
  final EntityTypes entityType;
  final LitterEntryModel? litterEntryModel;

  @override
  Widget build(BuildContext context) {
    return UpdateBreederWeightPage(
      breederId: breederId,
      entityType: entityType,
      litterEntryModel: litterEntryModel,
    );
  }
}

class UpdateBreederWeightPage extends StatefulWidget {
  const UpdateBreederWeightPage({
    super.key,
    this.breederId,
    required this.entityType,
    this.litterEntryModel,
  });

  final int? breederId;
  final EntityTypes entityType;
  final LitterEntryModel? litterEntryModel;

  @override
  State<UpdateBreederWeightPage> createState() =>
      _UpdateBreederWeightPageState();
}

class _UpdateBreederWeightPageState extends State<UpdateBreederWeightPage>
    implements UpdateBreederWeightViewCallBacks {
  late final RabbitConcernsCubit rabbitConcernsCubit = context.read();

  late final WeightCubit weightCubit = context.read();

  final weightFocusNode = FocusNode();

  List<FocusNode> weightsFocusNode = [];

  bool weightType = true;

  @override
  void initState() {
    super.initState();
    final breederId = widget.breederId;
    if (widget.entityType == EntityTypes.breeder && breederId != null) {
      rabbitConcernsCubit.getBreederWeights(
        breederId,
      );
    }
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
  void onWeightTypeSelected(bool value) {
    setState(() {
      weightType = value;
    });
    weightCubit.setWeightType(value);
  }

  @override
  void onSave(
    EntityTypes entityType, {
    int? weightId,
    int? litterId,
    int? kitId,
  }) {
    weightCubit.saveWeight(
      entityType,
      weightId: weightId,
      litterid: litterId,
      kitId: kitId,
    );
  }

  @override
  void onDateSelected(DateTime date, List<int> args) {
    rabbitConcernsCubit.setWeightDate(date);
  }

  @override
  void onWeightChanged(String weight, {int? kitId}) {
    rabbitConcernsCubit.setWeight(weight);
  }

  @override
  void onWeightTap(WeightModel weightModel) {
    context.router.popForced();
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        isTitleCenter: true,
        title: 'update_weight'.i18n,
        child: Padding(
          padding: AppConstants.paddingH16,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              MainTextField(
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
                  onChange: onDateSelected,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: double.maxFinite,
                child: BlocConsumer<WeightCubit, GeneralWeightState>(
                  listener: (context, state) {
                    if (state is UpdateWeightSuccess) {
                      MainSnackBar.showSuccessMessageBar(
                        context,
                        "weight_updated".i18n,
                      );
                      context.router.maybePop();
                    } else if (state is UpdateWeightFail) {
                      MainSnackBar.showErrorMessageBar(
                        context,
                        state.message,
                      );
                    }
                  },
                  builder: (context, state) {
                    var onTap = () => onSave(
                          widget.entityType,
                          weightId: weightModel.id,
                        );
                    Widget? child;
                    if (state is UpdateWeightLoading) {
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
  }

  @override
  void onTryAgainTap() {
    final breederId = widget.breederId;
    if (widget.entityType == EntityTypes.breeder && breederId != null) {
      rabbitConcernsCubit.getBreederWeights(
        breederId,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.entityType == EntityTypes.breeder) {
      return Padding(
        padding: AppConstants.padding16,
        child: BlocBuilder<RabbitConcernsCubit, GeneralRabbitConcernsState>(
          builder: (context, state) {
            if (state is BreederWeightsLoading) {
              return LoadingIndicator(
                color: context.cs.primary,
              );
            } else if (state is BreederWeightsSuccess) {
              return Column(
                children: [
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.weights.length,
                    itemBuilder: (context, index) {
                      final item = state.weights[index];
                      return ElementTile(
                        model: item,
                        onTap: onWeightTap,
                        leading: BorderedTextualWidget(
                          text: (index + 1).toString(),
                        ),
                        title: Text('${"weight".i18n} : ${item.weight}'),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              );
            } else if (state is BreederWeightsEmpty) {
              return MainErrorWidget(
                error: state.message,
              );
            } else if (state is BreederWeightsFail) {
              return MainErrorWidget(
                error: state.message,
                onTap: onTryAgainTap,
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      );
    } else if (widget.entityType == EntityTypes.kit) {
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
                onChange: onDateSelected,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: double.maxFinite,
              child: BlocConsumer<WeightCubit, GeneralWeightState>(
                listener: (context, state) {
                  if (state is UpdateWeightSuccess) {
                    MainSnackBar.showSuccessMessageBar(
                      context,
                      "weight_updated".i18n,
                    );
                    context.router.maybePop();
                  } else if (state is UpdateWeightFail) {
                    MainSnackBar.showErrorMessageBar(
                      context,
                      state.message,
                    );
                  }
                },
                builder: (context, state) {
                  //TODO .......................
                  var onTap = () => onSave(
                        widget.entityType,
                        //kitId: ,
                        // litterId: ,
                      );
                  Widget? child;
                  if (state is UpdateWeightLoading) {
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
    } else {
      //TODO : fix this , if statement go to else , althought status is not null
      //? status in kit model has to be nullable,
      //? if not , serialization will not work

      final litterEntryModel = widget.litterEntryModel;
       List<KitModel> activeKits = fakeKits;
      if (litterEntryModel != null) {
        activeKits = litterEntryModel.allKits.where((element) {
          final status = element.status;
          if (status != null) {
            return status.isActive;
          } else {
            return true;
          }
        }).toList();
      }
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
                onChange: onDateSelected,
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
                      activeKits.length,
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
              child: BlocConsumer<WeightCubit, GeneralWeightState>(
                listener: (context, state) {
                  if (state is UpdateWeightSuccess) {
                    MainSnackBar.showSuccessMessageBar(
                      context,
                      "weight_updated".i18n,
                    );
                    context.router.maybePop();
                  } else if (state is UpdateWeightFail) {
                    MainSnackBar.showErrorMessageBar(
                      context,
                      state.message,
                    );
                  }
                },
                builder: (context, state) {
                  var onTap = () => onSave(
                        widget.entityType,
                        litterId: widget.litterEntryModel?.id,
                      );
                  Widget? child;
                  if (state is UpdateWeightLoading) {
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
}
