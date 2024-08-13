import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/add_cage/cubit/add_cage_cubit.dart';
import 'package:bunny_sync/features/add_cage/model/cage_orientation_types/cage_orientation_types.dart';
import 'package:bunny_sync/features/add_cage/model/cage_size_types/cage_size_types.dart';
import 'package:bunny_sync/features/breeders/models/breeder_by_gender_model/breeder_by_gender_model.dart';
import 'package:bunny_sync/features/cage_cards/cubit/cage_cards_cubit.dart';
import 'package:bunny_sync/features/cage_cards/model/cage_model/cage_model.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/utils/enums/answer_types.dart';
import 'package:bunny_sync/features/add_cage/model/cage_placement_types/cage_placement_types.dart';
import 'package:bunny_sync/global/utils/enums/rabbit_types.dart';
import 'package:bunny_sync/global/widgets/buttons/main_action_button.dart';
import 'package:bunny_sync/global/widgets/loading_indicator.dart';
import 'package:bunny_sync/global/widgets/main_app_bar.dart';
import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:bunny_sync/global/widgets/main_text_field.dart';
import 'package:bunny_sync/global/widgets/radio_selector_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AddCageViewCallBacks {
  void onTitleChanged(String title);

  void onTitleSubmitted(String title);

  void onSizeSelected(CageSizeTypes? size);

  void onTypeSelected(RabbitTypes? type);

  void onOrientationSelected(CageOrientationTypes? orientation);

  void onHoleSelected(AnswerTypes hole);

  void onFirstSelected(CagePlacementTypes? value);

  void onSecondSelected(CagePlacementTypes? value);

  void onThirdSelected(CagePlacementTypes? value);

  void onFourthSelected(CagePlacementTypes? value);

  void onFifthSelected(CagePlacementTypes? value);

  void onSixthSelected(CagePlacementTypes? value);

  void onSeventhSelected(CagePlacementTypes? value);

  void onEighthSelected(CagePlacementTypes? value);

  void onNinthSelected(CagePlacementTypes? value);

  void onTenthSelected(CagePlacementTypes? value);

  void onEleventhSelected(CagePlacementTypes? value);

  void onTwelvthSelected(CagePlacementTypes? value);

  void onSave();
}

@RoutePage()
class AddCageView extends StatelessWidget {
  const AddCageView({
    super.key,
    required this.cageCardsCubit,
    this.cageModel,
  });

  final CageCardsCubit cageCardsCubit;
  final CageModel? cageModel;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: cageCardsCubit,
        ),
        BlocProvider(
          create: (context) => get<AddCageCubit>(),
        ),
      ],
      child: AddCagePage(
        cageModel: cageModel,
      ),
    );
  }
}

class AddCagePage extends StatefulWidget {
  const AddCagePage({
    super.key,
    this.cageModel,
  });

  final CageModel? cageModel;

  @override
  State<AddCagePage> createState() => _AddCagePageState();
}

class _AddCagePageState extends State<AddCagePage>
    implements AddCageViewCallBacks {
  late final CageCardsCubit cageCardsCubit = context.read();

  late final AddCageCubit addCageCubit = context.read();

  final titleFocusNode = FocusNode();

  final sizeFocusNode = FocusNode();

  final fieldFocusNode = List.generate(
    12,
    (index) => FocusNode(),
  );

  late final onFieldSelected = [
    onFirstSelected,
    onSecondSelected,
    onThirdSelected,
    onFourthSelected,
    onFifthSelected,
    onSixthSelected,
    onSeventhSelected,
    onEighthSelected,
    onNinthSelected,
    onTenthSelected,
    onEleventhSelected,
    onTwelvthSelected,
  ];

  final types = [
    BreederByGenderModel(id: 1, name: 'breeder'.i18n),
    BreederByGenderModel(id: 2, name: 'litter'.i18n),
  ];

  final orientations = [
    BreederByGenderModel(id: 1, name: 'vertical'.i18n),
    BreederByGenderModel(id: 2, name: 'horizontal'.i18n),
  ];

  BreederByGenderModel? selectedType;
  BreederByGenderModel? selectedOrientation;
  List<CagePlacementTypes?> selectedValue = List.generate(
    21,
    (index) => CagePlacementTypes.blank,
  );

  @override
  void initState() {
    final cage = widget.cageModel;
    if (cage != null) {
      addCageCubit.setTitle(cage.name);
      addCageCubit.setSize(cage.size);
      addCageCubit.setType(cage.type);
      addCageCubit.setHole(cage.hole);
      addCageCubit.setOrientation(cage.orientation);
      //TODO ......................
      // addCageCubit.setSettings(cage.settings)
    }
    super.initState();
  }

  @override
  void onHoleSelected(AnswerTypes hole) {
    addCageCubit.setHole(hole);
  }

  @override
  void onOrientationSelected(CageOrientationTypes? orientation) {
    addCageCubit.setOrientation(orientation);
  }

  @override
  void onSave() {
    addCageCubit.addCage();
  }

  @override
  void onSizeSelected(CageSizeTypes? size) {
    addCageCubit.setSize(size);
  }

  @override
  void onTitleChanged(String title) {
    addCageCubit.setTitle(title);
  }

  @override
  void onTitleSubmitted(String title) {
    sizeFocusNode.requestFocus();
  }

  @override
  void onTypeSelected(RabbitTypes? type) {
    addCageCubit.setType(type);
  }

  @override
  void onEighthSelected(CagePlacementTypes? value) {
    addCageCubit.setSettings(value);
  }

  @override
  void onEleventhSelected(CagePlacementTypes? value) {
    addCageCubit.setSettings(value);
  }

  @override
  void onFifthSelected(CagePlacementTypes? value) {
    addCageCubit.setSettings(value);
  }

  @override
  void onFirstSelected(CagePlacementTypes? value) {
    addCageCubit.setSettings(value);
  }

  @override
  void onFourthSelected(CagePlacementTypes? value) {
    addCageCubit.setSettings(value);
  }

  @override
  void onNinthSelected(CagePlacementTypes? value) {
    addCageCubit.setSettings(value);
  }

  @override
  void onSecondSelected(CagePlacementTypes? value) {
    addCageCubit.setSettings(value);
  }

  @override
  void onSeventhSelected(CagePlacementTypes? value) {
    addCageCubit.setSettings(value);
  }

  @override
  void onSixthSelected(CagePlacementTypes? value) {
    addCageCubit.setSettings(value);
  }

  @override
  void onTenthSelected(CagePlacementTypes? value) {
    addCageCubit.setSettings(value);
  }

  @override
  void onThirdSelected(CagePlacementTypes? value) {
    addCageCubit.setSettings(value);
  }

  @override
  void onTwelvthSelected(CagePlacementTypes? value) {
    addCageCubit.setSettings(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: Text(
          'create_templet'.i18n,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
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
                    MainTextField(
                      onSubmitted: onTitleSubmitted,
                      onChanged: onTitleChanged,
                      focusNode: titleFocusNode,
                      hintText: 'title'.i18n,
                      labelText: 'title'.i18n,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      'size'.i18n,
                      style: context.tt.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: context.cs.surfaceContainerHighest,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    MainDropDownWidget<CageSizeTypes>(
                      items: CageSizeTypes.values,
                      text: 'select_size'.i18n,
                      onChanged: onSizeSelected,
                      selectedValue: widget.cageModel?.size,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      'type'.i18n,
                      style: context.tt.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: context.cs.surfaceContainerHighest,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    MainDropDownWidget<RabbitTypes>(
                      items: RabbitTypes.values,
                      text: 'select_type'.i18n,
                      onChanged: onTypeSelected,
                      selectedValue: widget.cageModel?.type,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      'orientation'.i18n,
                      style: context.tt.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: context.cs.surfaceContainerHighest,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    MainDropDownWidget<CageOrientationTypes>(
                      items: CageOrientationTypes.values,
                      text: 'select_orientation'.i18n,
                      onChanged: onOrientationSelected,
                      selectedValue: widget.cageModel?.orientation,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: AppConstants.paddingH5,
                          child: Text(
                            "hole".i18n,
                            style: context.tt.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.darkGrey,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        RadioSelectorWidget<AnswerTypes>(
                          items: AnswerTypes.values,
                          selected: widget.cageModel?.hole,
                          onSelected: onHoleSelected,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      'cage_card_field_placement'.i18n,
                      style: context.tt.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: context.cs.surfaceContainerHighest,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: AppConstants.paddingH8,
                      child: Text(
                        'type_field'.i18n,
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: onFieldSelected.length,
                      itemBuilder: (context, index) {
                        return MainDropDownWidget<CagePlacementTypes>(
                          items: CagePlacementTypes.values,
                          text: 'blank'.i18n,
                          onChanged: onFieldSelected[index],
                          selectedValue: selectedValue[index],
                          expandedHeight: 400,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 20,
                        );
                      },
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
                    child: BlocConsumer<AddCageCubit, GeneralAddCageState>(
                      listener: (context, state) {
                        if (state is AddCageSuccess) {
                          MainSnackBar.showSuccessMessageBar(
                            context,
                            "cage_added".i18n,
                          );
                          context.router.maybePop();
                          cageCardsCubit.addCageCard(
                            state.cageModel,
                          );
                        } else if (state is UpdateCageSuccess) {
                          MainSnackBar.showSuccessMessageBar(
                            context,
                            "cage_updated".i18n,
                          );
                          context.router.maybePop();
                          cageCardsCubit.updateCageCard(
                            state.cageModel,
                          );
                        } else if (state is AddCageFail) {
                          MainSnackBar.showErrorMessageBar(
                            context,
                            state.message,
                          );
                        }
                      },
                      builder: (context, state) {
                        var onTap = onSave;
                        Widget? child;
                        if (state is AddCageLoading) {
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
      ),
    );
  }
}
