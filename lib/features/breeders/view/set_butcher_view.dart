import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/global/blocs/rabbit_concerns_cubit/rabbit_concerns_cubit.dart';
import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/buttons/main_action_button.dart';
import 'package:bunny_sync/global/widgets/loading_indicator.dart';
import 'package:bunny_sync/global/widgets/main_date_picker.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:bunny_sync/global/widgets/main_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SetButcherViewCallBacks {
  void onButcherDateSelected(DateTime butcherDate, List<int> args);

  void onButcherPreWeightChanged(String butcherPreWeight);

  void onButcherPreWeightSubmitted(String butcherPreWeight);

  void onButcherWeightChanged(String butcherWeight);

  void onButcherWeightSubmitted(String butcherWeight);

  void onButcherPriceChanged(String butcherPrice);

  void onButcherPriceSubmitted(String butcherPrice);

  void onSaveButcher(int breederId);
}

class SetButcherView extends StatelessWidget {
  const SetButcherView({
    super.key,
    required this.breederId,
  });

  final int breederId;

  @override
  Widget build(BuildContext context) {
    return SetButcherPage(
      breederId: breederId,
    );
  }
}

class SetButcherPage extends StatefulWidget {
  const SetButcherPage({
    super.key,
    required this.breederId,
  });

  final int breederId;

  @override
  State<SetButcherPage> createState() => _SetButcherPageState();
}

class _SetButcherPageState extends State<SetButcherPage>
    implements SetButcherViewCallBacks {
  late final RabbitConcernsCubit rabbitConcernsCubit = context.read();

  final FocusNode butcherPriceFocusNode = FocusNode();

  final FocusNode butcherPreWeightFocusNode = FocusNode();

  final FocusNode butcherWeightFocusNode = FocusNode();

  @override
  void dispose() {
    butcherPriceFocusNode.dispose();
    butcherPreWeightFocusNode.dispose();
    butcherWeightFocusNode.dispose();
    super.dispose();
  }

  @override
  void onButcherDateSelected(DateTime butcherDate, List<int> args) {
    rabbitConcernsCubit.setButcherDate(butcherDate);
  }

  @override
  void onButcherPreWeightChanged(String butcherPreWeight) {
    rabbitConcernsCubit.setButcherPreWeight(butcherPreWeight);
  }

  @override
  void onButcherPreWeightSubmitted(String butcherPreWeight) {
    butcherWeightFocusNode.requestFocus();
  }

  @override
  void onButcherPriceChanged(String butcherPrice) {
    rabbitConcernsCubit.setButcherPrice(butcherPrice);
  }

  @override
  void onButcherPriceSubmitted(String butcherPrice) {
    butcherPriceFocusNode.unfocus();
  }

  @override
  void onButcherWeightChanged(String butcherWeight) {
    rabbitConcernsCubit.setButcherWeight(butcherWeight);
  }

  @override
  void onButcherWeightSubmitted(String butcherWeight) {
    butcherPriceFocusNode.requestFocus();
  }

  @override
  void onSaveButcher(int breederId) {
    rabbitConcernsCubit.saveButcher(breederId);
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
          MainTextField(
            onSubmitted: onButcherPreWeightSubmitted,
            onChanged: onButcherPreWeightChanged,
            keyboardType: TextInputType.number,
            focusNode: butcherPreWeightFocusNode,
            hintText: "preWeight".i18n,
            labelText: "preWeight".i18n,
          ),
          const SizedBox(
            height: 25,
          ),
          MainTextField(
            onSubmitted: onButcherWeightSubmitted,
            onChanged: onButcherWeightChanged,
            focusNode: butcherWeightFocusNode,
            keyboardType: TextInputType.number,
            hintText: "weight".i18n,
            labelText: "weight".i18n,
          ),
          const SizedBox(
            height: 25,
          ),
          MainTextField(
            onSubmitted: onButcherPriceSubmitted,
            onChanged: onButcherPriceChanged,
            focusNode: butcherPriceFocusNode,
            keyboardType: TextInputType.number,
            hintText: "price".i18n,
            labelText: "price".i18n,
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: double.maxFinite,
            child:
                BlocConsumer<RabbitConcernsCubit, GeneralRabbitConcernsState>(
              listener: (context, state) {
                if (state is SaveButcherSuccess) {
                  MainSnackBar.showSuccessMessageBar(
                    context,
                    "breeder_butcher".i18n,
                  );
                  context.router.maybePop();
                } else if (state is SaveButcherFail) {
                  MainSnackBar.showErrorMessageBar(
                    context,
                    state.message,
                  );
                }
              },
              builder: (context, state) {
                var onTap = () => onSaveButcher(widget.breederId);
                Widget? child;
                if (state is SaveButcherLoading) {
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
