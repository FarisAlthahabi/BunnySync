import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/add_ailment/cubit/add_ailment_cubit.dart';
import 'package:bunny_sync/features/breeders/cubit/breeders_cubit.dart';
import 'package:bunny_sync/features/breeders/models/breeder_by_gender_model/breeder_by_gender_model.dart';
import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:bunny_sync/features/health/cubit/health_cubit.dart';
import 'package:bunny_sync/features/health/model/ailment_model/ailment_model.dart';
import 'package:bunny_sync/features/litter_details/cubit/litter_details_cubit.dart';
import 'package:bunny_sync/features/litter_details/model/kit_model/kit_model.dart';
import 'package:bunny_sync/features/litters/cubit/litters_cubit.dart';
import 'package:bunny_sync/features/litters/models/litter_entry_model/litter_entry_model.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/buttons/main_action_button.dart';
import 'package:bunny_sync/global/widgets/loading_indicator.dart';
import 'package:bunny_sync/global/widgets/main_app_bar.dart';
import 'package:bunny_sync/global/widgets/main_date_picker.dart';
import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:bunny_sync/global/widgets/main_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AddAilmentViewCallBacks {
  void onTypeSelected(BreederByGenderModel? type);

  void onBreederSelected(BreederEntryModel? breeder);

  void onLitterSelected(LitterEntryModel? litter);

  void onKitSelected(KitModel? kit);

  void onSymptomsChanged(String symptoms);

  void onSymptomsSubmitted(String symptoms);

  void onTitleChanged(String title);

  void onTitleSubmitted(String title);

  void onDateSelected(DateTime startDate, List<int> numbers);

  void onStatusSelected(BreederByGenderModel? status);

  void onNoteChanged(String note);

  void onNoteSubmitted(String note);

  void onSave();
}

@RoutePage()
class AddAilmentView extends StatelessWidget {
  const AddAilmentView({
    super.key,
    required this.healthCubit,
    this.ailmentModel,
  });

  final HealthCubit healthCubit;
  final AilmentModel? ailmentModel;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: healthCubit,
        ),
        BlocProvider(
          create: (context) => get<AddAilmentCubit>(),
        ),
        BlocProvider(
          create: (context) => get<BreedersCubit>(),
        ),
        BlocProvider(
          create: (context) => get<LittersCubit>(),
        ),
        BlocProvider(
          create: (context) => get<LitterDetailsCubit>(),
        ),
      ],
      child: AddAilmentPage(
        ailmentModel: ailmentModel,
      ),
    );
  }
}

class AddAilmentPage extends StatefulWidget {
  const AddAilmentPage({
    super.key,
    this.ailmentModel,
  });

  final AilmentModel? ailmentModel;

  @override
  State<AddAilmentPage> createState() => _AddAilmentPageState();
}

class _AddAilmentPageState extends State<AddAilmentPage>
    implements AddAilmentViewCallBacks {
  late final HealthCubit healthCubit = context.read();

  late final BreedersCubit breedersCubit = context.read();

  late final LittersCubit littersCubit = context.read();

  late final AddAilmentCubit addAilmentCubit = context.read();

  late final LitterDetailsCubit litterDetailsCubit = context.read();
  final titleFocusNode = FocusNode();

  final symptomsFocusNode = FocusNode();

  final noteFocusNode = FocusNode();

  bool showSelectKit = false;

  // TODO: remove thess and get them from cubit

  final List<BreederByGenderModel> types = [
    BreederByGenderModel(id: 1, name: 'breeder'.i18n),
    BreederByGenderModel(id: 2, name: 'kits'.i18n),
  ];
  final List<BreederByGenderModel> status = [
    BreederByGenderModel(id: 1, name: 'active'.i18n),
    BreederByGenderModel(id: 2, name: 'suspended'.i18n),
    BreederByGenderModel(id: 3, name: 'cured'.i18n),
  ];
  final List<BreederByGenderModel> recurringPeriods = [
    const BreederByGenderModel(id: 1, name: 'Once'),
    const BreederByGenderModel(id: 2, name: 'Every Week'),
    const BreederByGenderModel(id: 3, name: 'Every 2 Weeks'),
    const BreederByGenderModel(id: 4, name: 'Every Month'),
  ];
  BreederByGenderModel? selectedType;
  KitModel? selectedKit;
  BreederEntryModel? selectedBreeder;
  LitterEntryModel? selectedLitter;
  BreederByGenderModel? selectedStatus;

  @override
  void initState() {
    final ailmentModel = widget.ailmentModel;
    if (ailmentModel != null) {
      if (ailmentModel.breederId != null) {
        showSelectKit = false;
        addAilmentCubit.setType('off');
        addAilmentCubit.setBreederId(ailmentModel.breederId);
      }
      if (ailmentModel.kitId != null) {
        showSelectKit = true;
        addAilmentCubit.setType('on');
        addAilmentCubit.setKitId(ailmentModel.kitId);
      }
      addAilmentCubit.setStatus(ailmentModel.status);
      addAilmentCubit.setTitle(ailmentModel.name);
      addAilmentCubit.setSymptoms(ailmentModel.symptoms);
      addAilmentCubit.setNote(ailmentModel.note);
      addAilmentCubit.setStartDate(ailmentModel.startDate);
    }
    breedersCubit.getBreeders();
    littersCubit.getLitters();

    super.initState();
  }

  @override
  void onTitleChanged(String title) {
    addAilmentCubit.setTitle(title);
  }

  @override
  void onTitleSubmitted(String title) {
    symptomsFocusNode.requestFocus();
  }

  @override
  void onBreederSelected(BreederEntryModel? breeder) {
    addAilmentCubit.setBreederId(breeder?.id);
    setState(() {
      selectedBreeder = breeder;
    });
  }

  @override
  void onLitterSelected(LitterEntryModel? litter) {
    setState(() {
      selectedLitter = litter;
    });
    final litterModel = litter;
    if (litterModel != null) {
      litterDetailsCubit.getLitterDetails(litterModel.id);
    }
  }

  @override
  void onKitSelected(KitModel? kit) {
    addAilmentCubit.setKitId(kit?.id);
    setState(() {
      selectedKit = kit;
    });
  }

  @override
  void onDateSelected(DateTime startDate, List<int> numbers) {
    addAilmentCubit.setStartDate(startDate);
  }

  @override
  void onStatusSelected(BreederByGenderModel? status) {
    addAilmentCubit.setStatus(status?.name);
    setState(() {
      selectedStatus = status;
    });
  }

  @override
  void onSymptomsChanged(String symptoms) {
    addAilmentCubit.setSymptoms(symptoms);
  }

  @override
  void onSymptomsSubmitted(String symptoms) {
    noteFocusNode.requestFocus();
  }

  @override
  void onNoteChanged(String note) {
    addAilmentCubit.setNote(note);
  }

  @override
  void onNoteSubmitted(String note) {
    onSave();
  }

  @override
  void onTypeSelected(BreederByGenderModel? type) {
    if (type?.name == 'breeder'.i18n) {
      addAilmentCubit.setType('off');
    } else {
      addAilmentCubit.setType('on');
    }

    setState(() {
      selectedType = type;
      if (type?.name == 'kits'.i18n) {
        showSelectKit = true;
      } else {
        showSelectKit = false;
      }
    });
  }

  @override
  void onSave() {
    final ailmentModel = widget.ailmentModel;
    if (ailmentModel != null) {
      addAilmentCubit.updateAilment(ailmentModel.id);
    } else {
      addAilmentCubit.addAilment();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: Text(
          'create_ailment'.i18n,
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
                    MainDropDownWidget<BreederByGenderModel>(
                      items: types,
                      text: 'select_type'.i18n,
                      onChanged: onTypeSelected,
                      selectedValue: selectedType,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    BlocBuilder<BreedersCubit, GeneralBreedersState>(
                      builder: (context, state) {
                        if (state is BreedersLoading) {
                          return Center(
                            child: LoadingIndicator(
                              color: context.cs.primary,
                            ),
                          );
                        } else if (state is BreedersSuccess) {
                          if (showSelectKit == false) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'breeders'.i18n,
                                  style: context.tt.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: context.cs.surfaceContainerHighest,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                MainDropDownWidget<BreederEntryModel>(
                                  items: state.breedersStatusModel.all,
                                  text: 'select_breeder'.i18n,
                                  onChanged: onBreederSelected,
                                  selectedValue: selectedBreeder,
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                              ],
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        } else if (state is BreedersFail) {
                          return MainErrorWidget(error: state.message);
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                    BlocBuilder<LittersCubit, GeneralLittersState>(
                      builder: (context, state) {
                        if (state is LittersSuccess) {
                          if (showSelectKit == true) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'litters'.i18n,
                                  style: context.tt.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: context.cs.surfaceContainerHighest,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                MainDropDownWidget<LitterEntryModel>(
                                  items: state.littersStatusModel.all,
                                  text: 'select_litter'.i18n,
                                  onChanged: onLitterSelected,
                                  selectedValue: selectedLitter,
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                              ],
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        } else if (state is LittersFail) {
                          return MainErrorWidget(error: state.message);
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                    Visibility(
                      visible: showSelectKit,
                      child: BlocBuilder<LitterDetailsCubit,
                          GeneralLitterDetailsState>(
                        builder: (context, state) {
                          if (state is LitterDetailsSuccess) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'kits'.i18n,
                                  style: context.tt.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: context.cs.surfaceContainerHighest,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                MainDropDownWidget<KitModel>(
                                  items: state
                                      .litterDetailsResponseModel.litter.kits,
                                  text: 'select_kit'.i18n,
                                  onChanged: onKitSelected,
                                  selectedValue: selectedKit,
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                              ],
                            );
                          } else if (state is LitterDetailsFail) {
                            return const SizedBox.shrink();
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    ),
                    MainTextField(
                      initialValue: widget.ailmentModel?.name,
                      onSubmitted: onTitleSubmitted,
                      onChanged: onTitleChanged,
                      focusNode: titleFocusNode,
                      hintText: 'ailments'.i18n,
                      labelText: 'ailments'.i18n,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MainTextField(
                      initialValue: widget.ailmentModel?.symptoms,
                      onSubmitted: onSymptomsSubmitted,
                      onChanged: onSymptomsChanged,
                      focusNode: symptomsFocusNode,
                      hintText: 'symptoms'.i18n,
                      labelText: 'symptoms'.i18n,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "date".i18n,
                      style: context.tt.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: context.cs.primaryFixed,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: MainDatePicker(
                        initialDate: widget.ailmentModel?.startDate,
                        onChange: onDateSelected,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      'status'.i18n,
                      style: context.tt.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: context.cs.surfaceContainerHighest,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    MainDropDownWidget<BreederByGenderModel>(
                      items: status,
                      text: 'select_status'.i18n,
                      onChanged: onStatusSelected,
                      selectedValue: selectedStatus,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MainTextField(
                      initialValue: widget.ailmentModel?.note,
                      onSubmitted: onNoteSubmitted,
                      onChanged: onNoteChanged,
                      focusNode: noteFocusNode,
                      hintText: 'note'.i18n,
                      labelText: 'note'.i18n,
                      maxLines: 4,
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
                    child:
                        BlocConsumer<AddAilmentCubit, GeneralAddAilmentState>(
                      listener: (context, state) {
                        if (state is AddAilmentSuccess) {
                          MainSnackBar.showSuccessMessageBar(
                            context,
                            "ailment_added".i18n,
                          );
                          context.router.maybePop();
                          healthCubit.addAilment(
                            state.ailment,
                          );
                        } else if (state is UpdateAilmentSuccess) {
                          MainSnackBar.showSuccessMessageBar(
                            context,
                            "ailment_updated".i18n,
                          );
                          context.router.maybePop();
                          healthCubit.updateAilment(
                            state.ailment,
                          );
                        } else if (state is AddAilmentFail) {
                          MainSnackBar.showErrorMessageBar(
                            context,
                            state.message,
                          );
                        }
                      },
                      builder: (context, state) {
                        var onTap = onSave;
                        Widget? child;
                        if (state is AddAilmentLoading) {
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
