import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/global/blocs/set_value_cubit/set_value_cubit.dart';
import 'package:bunny_sync/global/di/di.dart';
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
    return BlocProvider(
      create: (context) => get<SetValueCubit>(),
      child: SetButcherPage(
        breederId: breederId,
      ),
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
  late final SetValueCubit setValueCubit = context.read();

  final FocusNode butcherPriceFocusNode = FocusNode();

  final FocusNode butcherPreWeightFocusNode = FocusNode();

  final FocusNode butcherWeightFocusNode = FocusNode();

  @override
  void onButcherDateSelected(DateTime butcherDate, List<int> args) {
    setValueCubit.setDate(butcherDate);
  }

  @override
  void onButcherPreWeightChanged(String butcherPreWeight) {
    setValueCubit.setPreWeight(butcherPreWeight);
  }

  @override
  void onButcherPreWeightSubmitted(String butcherPreWeight) {
    // TODO: implement onButcherPreWeightSubmitted
  }

  @override
  void onButcherPriceChanged(String butcherPrice) {
    setValueCubit.setPrice(butcherPrice);
  }

  @override
  void onButcherPriceSubmitted(String butcherPrice) {
    // TODO: implement onButcherPriceSubmitted
  }

  @override
  void onButcherWeightChanged(String butcherWeight) {
    setValueCubit.setWeight(butcherWeight);
  }

  @override
  void onButcherWeightSubmitted(String butcherWeight) {
    // TODO: implement onButcherWeightSubmitted
  }

  @override
  void onSaveButcher(int breederId) {
    setValueCubit.saveButcher(breederId);
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
            onSubmitted: onButcherPreWeightChanged,
            onChanged: onButcherPreWeightSubmitted,
            focusNode: butcherPreWeightFocusNode,
            hintText: "preWeight".i18n,
            labelText: "preWeight".i18n,
          ),
          const SizedBox(
            height: 25,
          ),
          MainTextField(
            onSubmitted: onButcherWeightChanged,
            onChanged: onButcherWeightSubmitted,
            focusNode: butcherWeightFocusNode,
            hintText: "weight".i18n,
            labelText: "weight".i18n,
          ),
          const SizedBox(
            height: 25,
          ),
          MainTextField(
            onSubmitted: onButcherPriceSubmitted,
            onChanged: onButcherPriceSubmitted,
            focusNode: butcherPriceFocusNode,
            hintText: "price".i18n,
            labelText: "price".i18n,
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: double.maxFinite,
            child: BlocConsumer<SetValueCubit, GeneralSetValueState>(
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
