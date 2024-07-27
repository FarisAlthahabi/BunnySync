import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/add_litter/cubit/add_litter_cubit.dart';
import 'package:bunny_sync/features/breeders/cubit/breeders_cubit.dart';
import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:bunny_sync/features/main_navigation/cubit/main_navigation_cubit.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/buttons/main_action_button.dart';
import 'package:bunny_sync/global/widgets/loading_indicator.dart';
import 'package:bunny_sync/global/widgets/main_app_bar.dart';
import 'package:bunny_sync/global/widgets/main_date_picker.dart';
import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:bunny_sync/global/widgets/main_text_field.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class AddLitterViewCallBack {
  void onTypeChanged(String type);

  void onTypeSubmitted(String type);

  void onBreedChanged(String breed);

  void onBreedSubmitted(String breed);

  void onPrefixChanged(String prefix);

  void onPrefixSubmitted(String prefix);

  void onCageChanged(String cage);

  void onCageSubmitted(String cage);

  void onLitterIdChanged(String litterId);

  void onLitterIdSubmitted(String litterId);

  void onLiveKitsChanged(String liveKits);

  void onLiveKitsSubmitted(String liveKits);

  void onDeadKitsChanged(String deadkits);

  void onDeadKitsSubmitted(String deadkits);

  void onMaleBreederIdChanged(BreederEntryModel? breeder);

  void onMaleBreederIdSubmitted(BreederEntryModel breeder);

  void onFemaleBreederIdChanged(BreederEntryModel? breeder);

  void onFemaleBreederIdSubmitted(BreederEntryModel breeder);

  void onBreedDateSelected(DateTime breedDate, List<int> numbers);

  void onBornDateSelected(DateTime bornDate, List<int> numbers);

  void onSave();
}

@RoutePage()
class AddLitterView extends StatelessWidget {
  const AddLitterView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => get<AddLitterCubit>(),
        ),
        BlocProvider(
          create: (context) => get<BreedersCubit>(),
        ),
      ],
      child: const AddLitterPage(),
    );
  }
}

class AddLitterPage extends StatefulWidget {
  const AddLitterPage({
    super.key,
  });

  @override
  State<AddLitterPage> createState() => _AddLitterPageState();
}

class _AddLitterPageState extends State<AddLitterPage>
    implements AddLitterViewCallBack {
  late final AddLitterCubit addLitterCubit = context.read();

  late final BreedersCubit breedersCubit = context.read();

  late final MainNavigationCubit mainNavigationCubit = context.read();

  final litterIdFocusNode = FocusNode();

  final prefixFocusNode = FocusNode();

  final cageFocusNode = FocusNode();

  final maleBreederIdFocusNode = FocusNode();

  final femaleBreederIdFocusNode = FocusNode();

  final bornDateFocusNode = FocusNode();

  final breedDateFocusNode = FocusNode();

  final breedFocusNode = FocusNode();

  final liveKitsFocusNode = FocusNode();

  final deadKitsFocusNode = FocusNode();

  final typeFocusNode = FocusNode();

  @override
  void onCageChanged(String cage) {
    addLitterCubit.setCage(cage);
  }

  @override
  void onCageSubmitted(String cage) {
    breedFocusNode.requestFocus();
  }

  @override
  void onPrefixChanged(String prefix) {
    addLitterCubit.setPrefix(prefix);
  }

  @override
  void onPrefixSubmitted(String prefix) {
    cageFocusNode.requestFocus();
  }

  @override
  void onBreedChanged(String breed) {
    addLitterCubit.setBreed(breed);
  }

  @override
  void onBreedSubmitted(String breed) {
    liveKitsFocusNode.requestFocus();
  }

  @override
  void onDeadKitsChanged(String deadKits) {
    addLitterCubit.setDeadKits(deadKits);
  }

  @override
  void onDeadKitsSubmitted(String deadKits) {
    deadKitsFocusNode.unfocus();
  }

  @override
  void onFemaleBreederIdChanged(BreederEntryModel? breeder) {
    addLitterCubit.setFemaleBreederId(breeder);
  }

  @override
  void onFemaleBreederIdSubmitted(BreederEntryModel breeder) {
    litterIdFocusNode.requestFocus();
  }

  @override
  void onLitterIdChanged(String litterId) {
    addLitterCubit.setLitterId(litterId);
  }

  @override
  void onLitterIdSubmitted(String litterId) {
    typeFocusNode.requestFocus();
  }

  @override
  void onLiveKitsChanged(String liveKits) {
    addLitterCubit.setLiveKits(liveKits);
  }

  @override
  void onLiveKitsSubmitted(String liveKits) {
    deadKitsFocusNode.requestFocus();
  }

  @override
  void onMaleBreederIdChanged(BreederEntryModel? breeder) {
    addLitterCubit.setMaleBreederId(breeder);
  }

  @override
  void onMaleBreederIdSubmitted(BreederEntryModel breeder) {
    femaleBreederIdFocusNode.requestFocus();
  }

  @override
  void onTypeChanged(String type) {
    addLitterCubit.setType(type);
  }

  @override
  void onTypeSubmitted(String type) {
    prefixFocusNode.requestFocus();
  }

  @override
  void onBreedDateSelected(DateTime breedDate, List<int> numbers) {
    addLitterCubit.setBreedDate(breedDate);
  }

  @override
  void onBornDateSelected(DateTime bornDate, List<int> numbers) {
    addLitterCubit.setBornDate(bornDate);
  }

  @override
  void onSave() {
    addLitterCubit.addLitter();
  }

  @override
  void initState() {
    super.initState();

    breedersCubit.getBreedersByAllGenders();
    addLitterCubit.emitUpdateAddLitterState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: Text(
          'new_litter'.i18n,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocBuilder<BreedersCubit, GeneralBreedersState>(
          builder: (context, state) {
            return Skeletonizer(
              enabled: state is BreedersLoading,
              child: Stack(
                children: [
                  BlocBuilder<AddLitterCubit, GeneralAddLitterState>(
                    buildWhen: (prev, curr) => curr is UpdateAddLitterState,
                    builder: (context, innerState) {
                      if (innerState is UpdateAddLitterState) {
                        return SingleChildScrollView(
                          child: Padding(
                            padding: AppConstants.paddingH16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                BlocBuilder<BreedersCubit,
                                    GeneralBreedersState>(
                                  builder: (context, state) {
                                    if (state is BreedersByGenderSuccess) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'male_breeder'.i18n,
                                            style:
                                                context.tt.bodyLarge?.copyWith(
                                              fontWeight: FontWeight.w700,
                                              color: context
                                                  .cs.surfaceContainerHighest,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          MainDropDownWidget<BreederEntryModel>(
                                            items: state.breedersGenderModel
                                                .maleBreeders,
                                            text: 'select_male_breeder'.i18n,
                                            onChanged: onMaleBreederIdChanged,
                                            selectedValue: state
                                                .breedersGenderModel
                                                .maleBreeders
                                                .firstWhereOrNull(
                                              (element) =>
                                                  element.id ==
                                                  innerState.addLitterModel
                                                      .maleBreederId,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 25,
                                          ),
                                          Text(
                                            'female_breeder'.i18n,
                                            style:
                                                context.tt.bodyLarge?.copyWith(
                                              fontWeight: FontWeight.w700,
                                              color: context
                                                  .cs.surfaceContainerHighest,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          MainDropDownWidget<BreederEntryModel>(
                                            items: state.breedersGenderModel
                                                .femaleBreeders,
                                            text: 'select_female_breeder'.i18n,
                                            onChanged: onFemaleBreederIdChanged,
                                            selectedValue: state
                                                .breedersGenderModel
                                                .femaleBreeders
                                                .firstWhereOrNull(
                                              (element) =>
                                                  element.id ==
                                                  innerState.addLitterModel
                                                      .femaleBreederId,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 25,
                                          ),
                                        ],
                                      );
                                    } else if (state is BreedersFail) {
                                      return Text(state.message);
                                    } else {
                                      return const SizedBox();
                                    }
                                  },
                                ),
                                MainTextField(
                                  onSubmitted: onLitterIdSubmitted,
                                  onChanged: onLitterIdChanged,
                                  focusNode: litterIdFocusNode,
                                  hintText: 'litter_id'.i18n,
                                  labelText: 'litter_id'.i18n,
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                MainTextField(
                                  onSubmitted: onTypeSubmitted,
                                  onChanged: onTypeChanged,
                                  focusNode: typeFocusNode,
                                  hintText: 'type'.i18n,
                                  labelText: 'type'.i18n,
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                MainTextField(
                                  onSubmitted: onPrefixSubmitted,
                                  onChanged: onPrefixChanged,
                                  focusNode: prefixFocusNode,
                                  hintText: 'prefix'.i18n,
                                  labelText: 'prefix'.i18n,
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                MainTextField(
                                  onSubmitted: onCageSubmitted,
                                  onChanged: onCageChanged,
                                  focusNode: cageFocusNode,
                                  hintText: "cage".i18n,
                                  labelText: "cage".i18n,
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                MainTextField(
                                  onSubmitted: onBreedSubmitted,
                                  onChanged: onBreedChanged,
                                  focusNode: breedFocusNode,
                                  hintText: 'breed'.i18n,
                                  labelText: 'breed'.i18n,
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                MainTextField(
                                  onSubmitted: onLiveKitsSubmitted,
                                  onChanged: onLiveKitsChanged,
                                  focusNode: liveKitsFocusNode,
                                  hintText: 'live_kits_count'.i18n,
                                  labelText: 'live_kits_count'.i18n,
                                  keyboardType: TextInputType.number,
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                MainTextField(
                                  onSubmitted: onDeadKitsSubmitted,
                                  onChanged: onDeadKitsChanged,
                                  focusNode: deadKitsFocusNode,
                                  hintText: 'dead_kits_count'.i18n,
                                  labelText: 'dead_kits_count'.i18n,
                                  keyboardType: TextInputType.number,
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  "set_breed_date".i18n,
                                  style: context.tt.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.darkGrey,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Center(
                                  child: MainDatePicker(
                                    onChange: onBreedDateSelected,
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  "set_born_date".i18n,
                                  style: context.tt.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.darkGrey,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Center(
                                  child: MainDatePicker(
                                    onChange: onBornDateSelected,
                                  ),
                                ),
                                const SizedBox(
                                  height: 100,
                                ),
                              ],
                            ),
                          ),
                        );
                      }

                      return const SizedBox();
                    },
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: AppConstants.paddingH16,
                        child: SizedBox(
                          width: double.maxFinite,
                          child: BlocConsumer<AddLitterCubit,
                              GeneralAddLitterState>(
                            listener: (context, state) {
                              if (state is AddLitterSuccess) {
                                mainNavigationCubit.addLitter();
                                MainSnackBar.showSuccessMessageBar(
                                  context,
                                  "litter_added".i18n,
                                );
                                context.router.maybePop();
                              } else if (state is AddLitterFail) {
                                MainSnackBar.showErrorMessageBar(
                                  context,
                                  state.message,
                                );
                              }
                            },
                            builder: (context, state) {
                              var onTap = onSave;
                              Widget? child;
                              if (state is AddLitterLoading) {
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
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
