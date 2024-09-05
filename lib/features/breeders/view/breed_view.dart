import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/breeders/cubit/breeders_cubit.dart';
import 'package:bunny_sync/features/breeders/models/breed_time_types/breed_time_types.dart';
import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:bunny_sync/global/blocs/rabbit_concerns_cubit/rabbit_concerns_cubit.dart';
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
import 'package:bunny_sync/global/widgets/radio_selector_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BreedViewCallBacks {
  void onMaleBreederIdSelected(BreederEntryModel? breederEntryModel);

  void onFemaleBreederIdSelected(BreederEntryModel? breederEntryModel);

  void onBreedTimeTypeSelected(BreedTimeTypes? breedTimeType);

  void onDateSelected(DateTime date, List<int> args);

  void onSave();
}

class BreedView extends StatelessWidget {
  const BreedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get<BreedersCubit>(),
      child: const BreedPage(),
    );
  }
}

class BreedPage extends StatefulWidget {
  const BreedPage({super.key});

  @override
  State<BreedPage> createState() => _BreedPageState();
}

class _BreedPageState extends State<BreedPage> implements BreedViewCallBacks {
  late final RabbitConcernsCubit rabbitConcernsCubit = context.read();

  late final BreedersCubit breedersCubit = context.read();

  @override
  void initState() {
    super.initState();
    breedersCubit.getBreedersByAllGenders();
  }

  @override
  void onBreedTimeTypeSelected(BreedTimeTypes? breedTimeType) {
    rabbitConcernsCubit.setBreedTimeType(breedTimeType);
  }

  @override
  void onDateSelected(DateTime date, List<int> args) {
    rabbitConcernsCubit.setBreedDate(date);
  }

  @override
  void onFemaleBreederIdSelected(BreederEntryModel? breederEntryModel) {
    rabbitConcernsCubit.setBreedFemaleBreederId(breederEntryModel?.id);
  }

  @override
  void onMaleBreederIdSelected(BreederEntryModel? breederEntryModel) {
    rabbitConcernsCubit.setBreedMaleBreederId(breederEntryModel?.id);
  }

  @override
  void onSave() {
    rabbitConcernsCubit.breed();
  }

  @override
  Widget build(BuildContext context) {
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
              Text(
                'male_breeder'.i18n,
                style: context.tt.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: context.cs.surfaceContainerHighest,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              BlocBuilder<BreedersCubit, GeneralBreedersState>(
                builder: (context, state) {
                  Widget child;
                  if (state is BreedersByGenderSuccess) {
                    child = Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MainDropDownWidget<BreederEntryModel>(
                          items: state.breedersGenderModel.maleBreeders,
                          text: 'select_male_breeder'.i18n,
                          onChanged: onMaleBreederIdSelected,
                        ),
                      ],
                    );
                  } else if (state is BreedersLoading) {
                    child = Center(
                      child: LoadingIndicator(
                        color: context.cs.primary,
                      ),
                    );
                  } else if (state is MaleBreedersEmpty) {
                    child = MainErrorWidget(
                      error: state.message,
                    );
                  } else if (state is BreedersFail) {
                    child = MainErrorWidget(
                      error: state.message,
                      onTap: () {
                        breedersCubit.getBreedersByAllGenders();
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
              Text(
                'female_breeder'.i18n,
                style: context.tt.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: context.cs.surfaceContainerHighest,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              BlocBuilder<BreedersCubit, GeneralBreedersState>(
                builder: (context, state) {
                  Widget child;
                  if (state is BreedersByGenderSuccess) {
                    child = Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MainDropDownWidget<BreederEntryModel>(
                          items: state.breedersGenderModel.femaleBreeders,
                          text: 'select_female_breeder'.i18n,
                          onChanged: onFemaleBreederIdSelected,
                        ),
                      ],
                    );
                  } else if (state is BreedersLoading) {
                    child = Center(
                      child: LoadingIndicator(
                        color: context.cs.primary,
                      ),
                    );
                  } else if (state is FemaleBreedersEmpty) {
                    child = MainErrorWidget(
                      error: state.message,
                    );
                  } else if (state is BreedersFail) {
                    child = MainErrorWidget(
                      error: state.message,
                      onTap: () {
                        breedersCubit.getBreedersByAllGenders();
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
              Text(
                'breed_time'.i18n,
                style: context.tt.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: context.cs.surfaceContainerHighest,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              RadioSelectorWidget<BreedTimeTypes>(
                items: BreedTimeTypes.values,
                onSelected: onBreedTimeTypeSelected,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "set_date".i18n,
                style: context.tt.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: context.cs.primaryFixed,
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
                child:
                    BlocConsumer<RabbitConcernsCubit, GeneralRabbitConcernsState>(
                  listener: (context, state) {
                    if (state is BreedSuccess) {
                      MainSnackBar.showSuccessMessageBar(
                        context,
                        "breed_success".i18n,
                      );
                      context.router.maybePop();
                    } else if (state is BreedFail) {
                      MainSnackBar.showErrorMessageBar(
                        context,
                        state.message,
                      );
                    }
                  },
                  builder: (context, state) {
                    var onTap = onSave;
                    Widget? child;
                    if (state is BreedLoading) {
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
}
