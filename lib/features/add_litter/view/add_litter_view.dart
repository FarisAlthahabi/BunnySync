import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/add_litter/cubit/add_litter_cubit.dart';
import 'package:bunny_sync/features/breeders/cubit/breeders_cubit.dart';
import 'package:bunny_sync/features/main_navigation/cubit/main_navigation_cubit.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/buttons/main_action_button.dart';
import 'package:bunny_sync/global/widgets/loading_indicator.dart';
import 'package:bunny_sync/global/widgets/main_app_bar.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:bunny_sync/global/widgets/main_text_field.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_holo_date_picker/date_picker_theme.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  void onDeadkitsChanged(String deadkits);

  void onDeadkitsSubmitted(String deadkits);

  void onMaleBreederIdChanged(String maleBreederId);

  void onMaleBreederIdSubmitted(String maleBreederId);

  void onFemaleBreederIdChanged(String femaleBreederId);

  void onFemaleBreederIdSubmitted(String femaleBreederId);

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
          create: (context) => get<MainNavigationCubit>(),
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

  DateTime selectedBreedDate = DateTime.now();

  DateTime selectedBornDate = DateTime.now();

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
  void onDeadkitsChanged(String deadkits) {
    addLitterCubit.setDeadKits(deadkits);
  }

  @override
  void onDeadkitsSubmitted(String deadkits) {
    deadKitsFocusNode.unfocus();
  }

  @override
  void onFemaleBreederIdChanged(String femaleBreederId) {
    addLitterCubit.setFemaleBreederId(femaleBreederId);
  }

  @override
  void onFemaleBreederIdSubmitted(String femaleBreederId) {
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
  void onMaleBreederIdChanged(String maleBreederId) {
    addLitterCubit.setMaleBreederId(maleBreederId);
  }

  @override
  void onMaleBreederIdSubmitted(String maleBreederId) {
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
    setState(() {
      selectedBreedDate = breedDate;
    });
    addLitterCubit.setBreedDate(breedDate);
  }

  @override
  void onBornDateSelected(DateTime bornDate, List<int> numbers) {
    setState(() {
      selectedBornDate = bornDate;
    });
    addLitterCubit.setBornDate(bornDate);
  }

  @override
  void onSave() {
    addLitterCubit.addLitter();
  }

  @override
  void initState() {
    breedersCubit.getBreedersByGender();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  String? selectedMaleBreeder;
  String? selectedFemaleBreeder;
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
                  SingleChildScrollView(
                    child: Padding(
                      padding: AppConstants.paddingH16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          BlocBuilder<BreedersCubit, GeneralBreedersState>(
                            builder: (context, state) {
                              if (state is BreedersByGenderSuccess) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Male Breeder',
                                      style: context.tt.bodyLarge?.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color:
                                            context.cs.surfaceContainerHighest,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    DropdownButtonHideUnderline(
                                      child: DropdownButton2<String>(
                                        isExpanded: true,
                                        value: selectedMaleBreeder,
                                        hint: Text(
                                          selectedMaleBreeder ??
                                              'Select Male Breeder',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Theme.of(context).hintColor,
                                          ),
                                        ),
                                        items: state.breedersGenderModel
                                            .maleBreedersNames
                                            .map(
                                              (String item) =>
                                                  DropdownMenuItem<String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                        onChanged: (String? value) {
                                          setState(() {
                                            selectedMaleBreeder = value;
                                          });
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Text(
                                      'Female Breeder',
                                      style: context.tt.bodyLarge?.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color:
                                            context.cs.surfaceContainerHighest,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    DropdownButtonHideUnderline(
                                      child: DropdownButton2<String>(
                                        isExpanded: true,
                                        value: selectedFemaleBreeder,
                                        hint: Text(
                                          selectedMaleBreeder ??
                                              'Select Female Breeder',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Theme.of(context).hintColor,
                                          ),
                                        ),
                                        items: state.breedersGenderModel
                                            .femaleBreedersNames
                                            .map(
                                              (String item) =>
                                                  DropdownMenuItem<String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                        onChanged: (String? value) {
                                          setState(() {
                                            selectedFemaleBreeder = value;
                                          });
                                        },
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
                            onSubmitted: onMaleBreederIdSubmitted,
                            onChanged: onMaleBreederIdChanged,
                            focusNode: maleBreederIdFocusNode,
                            hintText: 'Male breeder id',
                            labelText: 'Male breeder id',
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          MainTextField(
                            onSubmitted: onFemaleBreederIdSubmitted,
                            onChanged: onFemaleBreederIdChanged,
                            focusNode: femaleBreederIdFocusNode,
                            hintText: 'Female breeder id',
                            labelText: 'Female breeder id',
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          MainTextField(
                            onSubmitted: onLitterIdSubmitted,
                            onChanged: onLitterIdChanged,
                            focusNode: litterIdFocusNode,
                            hintText: 'Litter id',
                            labelText: 'Litter id',
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          MainTextField(
                            onSubmitted: onTypeSubmitted,
                            onChanged: onTypeChanged,
                            focusNode: typeFocusNode,
                            hintText: 'Type',
                            labelText: 'Type',
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          MainTextField(
                            onSubmitted: onPrefixSubmitted,
                            onChanged: onPrefixChanged,
                            focusNode: prefixFocusNode,
                            hintText: 'prefix',
                            labelText: 'prefix',
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
                            hintText: 'Breed',
                            labelText: 'Breed',
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          MainTextField(
                            onSubmitted: onLiveKitsSubmitted,
                            onChanged: onLiveKitsChanged,
                            focusNode: liveKitsFocusNode,
                            hintText: 'Live kits count',
                            labelText: 'Live kits count',
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          MainTextField(
                            onSubmitted: onDeadkitsSubmitted,
                            onChanged: onDeadkitsChanged,
                            focusNode: deadKitsFocusNode,
                            hintText: 'Dead kits count',
                            labelText: 'Dead kits count',
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
                            child: SizedBox(
                              width: 0.7.sw,
                              child: DatePickerWidget(
                                initialDate: selectedBreedDate,
                                looping: true,
                                dateFormat: "dd/MMM/yyyy",
                                onChange: onBreedDateSelected,
                                pickerTheme: DateTimePickerTheme(
                                  itemTextStyle: context.tt.bodyLarge?.copyWith(
                                        fontSize: 18,
                                        color: context.cs.secondaryContainer,
                                        fontWeight: FontWeight.w700,
                                      ) ??
                                      const TextStyle(),
                                  dividerColor: context.cs.secondaryContainer,
                                ),
                              ),
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
                            child: SizedBox(
                              width: 0.7.sw,
                              child: DatePickerWidget(
                                initialDate: selectedBornDate,
                                looping: true,
                                dateFormat: "dd/MMM/yyyy",
                                onChange: onBornDateSelected,
                                pickerTheme: DateTimePickerTheme(
                                  itemTextStyle: context.tt.bodyLarge?.copyWith(
                                        fontSize: 18,
                                        color: context.cs.secondaryContainer,
                                        fontWeight: FontWeight.w700,
                                      ) ??
                                      const TextStyle(),
                                  dividerColor: context.cs.secondaryContainer,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                        ],
                      ),
                    ),
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
                                mainNavigationCubit
                                    .addLitter(state.addLitterModel);
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
