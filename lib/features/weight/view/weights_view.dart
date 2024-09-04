import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/weight/cubit/weight_cubit.dart';
import 'package:bunny_sync/features/weight/models/weightable_model/weightable_model.dart';
import 'package:bunny_sync/features/weight/view/add_weight_view.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:bunny_sync/global/widgets/buttons/main_action_button.dart';
import 'package:bunny_sync/global/widgets/element_tile.dart';
import 'package:bunny_sync/global/widgets/loading_indicator.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:bunny_sync/global/widgets/main_show_bottom_sheet.dart';
import 'package:bunny_sync/global/widgets/texts/bordered_textual_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class WeightViewCallBacks {
  void onTryAgainTap();

  void onAddWeightTap();
}

class WeightView extends StatelessWidget {
  const WeightView({
    super.key,
    required this.weightableModel,
  });

  final WeightableModel weightableModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get<WeightCubit>(),
      child: WeightPage(
        weightableModel: weightableModel,
      ),
    );
  }
}

class WeightPage extends StatefulWidget {
  const WeightPage({
    super.key,
    required this.weightableModel,
  });

  final WeightableModel weightableModel;

  @override
  State<WeightPage> createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage>
    implements WeightViewCallBacks {
  late final WeightCubit weightCubit = context.read();

  @override
  void initState() {
    super.initState();
    weightCubit.getEntityWeights(widget.weightableModel);
  }

  @override
  void onAddWeightTap() {
    context.router.popForced();
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        isTitleCenter: true,
        title: 'add_weight'.i18n,
        child: AddWeightView(
          weightableModel: widget.weightableModel,
        ),
      ),
    );
  }

  @override
  void onTryAgainTap() {
    weightCubit.getEntityWeights(widget.weightableModel);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeightCubit, GeneralWeightState>(
      builder: (context, state) {
        Widget child = const SizedBox.shrink();

        if (state is GetAllWeightsLoading) {
          child = LoadingIndicator(
            color: context.cs.primary,
          );
        } else if (state is GetAllWeightsSuccess) {
          child = Column(
            children: [
              ListView.separated(
                padding: AppConstants.padding16,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.weights.length,
                itemBuilder: (context, index) {
                  final item = state.weights[index];
                  return ElementTile(
                    model: item,
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
              const SizedBox(height: 4),
              MainActionButton(
                onTap: onAddWeightTap,
                text: 'add'.i18n,
              ),
            ],
          );
        } else if (state is GetAllWeightsEmpty) {
          child = Column(
            children: [
              const SizedBox(height: 20),
              MainErrorWidget(
                error: state.message,
              ),
              const SizedBox(height: 20),
              MainActionButton(
                onTap: onAddWeightTap,
                text: 'add'.i18n,
              ),
            ],
          );
        } else if (state is GetAllWeightsFail) {
          child = MainErrorWidget(
            error: state.message,
            height: 130,
            onTap: onTryAgainTap,
          );
        }

        return AnimatedHeightAndFade(
          child: child,
        );
      },
    );
  }
}
