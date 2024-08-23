import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/global/blocs/rabbit_concerns_cubit/rabbit_concerns_cubit.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/models/weight_model/weight_model.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
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

  void onWeightChanged(String weight);

  void onDateSelected(DateTime date, List<int> args);

  void onSave(int weightId);
}

class UpdateBreederWeightView extends StatelessWidget {
  const UpdateBreederWeightView({
    super.key,
    required this.breederId,
  });

  final int breederId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get<RabbitConcernsCubit>(),
      child: UpdateBreederWeightpage(
        breederId: breederId,
      ),
    );
  }
}

class UpdateBreederWeightpage extends StatefulWidget {
  const UpdateBreederWeightpage({
    super.key,
    required this.breederId,
  });

  final int breederId;

  @override
  State<UpdateBreederWeightpage> createState() =>
      _UpdateBreederWeightpageState();
}

class _UpdateBreederWeightpageState extends State<UpdateBreederWeightpage>
    implements UpdateBreederWeightViewCallBacks {
  late final RabbitConcernsCubit rabbitConcernsCubit = context.read();

  @override
  void initState() {
    super.initState();
    rabbitConcernsCubit.getBreederWeights(
      widget.breederId,
    );
  }

  @override
  void onSave(int weightId) {
    rabbitConcernsCubit.updateBreederWeight(weightId);
  }

  @override
  void onDateSelected(DateTime date, List<int> args) {
    rabbitConcernsCubit.setWeightDate(date);
  }

  @override
  void onWeightChanged(String weight) {
    rabbitConcernsCubit.setWeight(weight);
  }

  @override
  void onWeightTap(WeightModel weightModel) {
    context.router.popForced();
    mainShowBottomSheet(
      context,
      widget: BlocProvider(
        create: (context) => get<RabbitConcernsCubit>(),
        child: BottomSheetWidget(
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
                  child: BlocConsumer<RabbitConcernsCubit,
                      GeneralRabbitConcernsState>(
                    listener: (context, state) {
                      if (state is UpdateBreederWeightSuccess) {
                        MainSnackBar.showSuccessMessageBar(
                          context,
                          "weight_updated".i18n,
                        );
                        context.router.maybePop();
                      } else if (state is UpdateBreederWeightFail) {
                        MainSnackBar.showErrorMessageBar(
                          context,
                          state.message,
                        );
                      }
                    },
                    builder: (context, state) {
                      var onTap = () => onSave(weightModel.id);
                      Widget? child;
                      if (state is UpdateBreederWeightLoading) {
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
      ),
    );
  }

  @override
  void onTryAgainTap() {
    rabbitConcernsCubit.getBreederWeights(
      widget.breederId,
    );
  }

  @override
  Widget build(BuildContext context) {
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
  }
}
