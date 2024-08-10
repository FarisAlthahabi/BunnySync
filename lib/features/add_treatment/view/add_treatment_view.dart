import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/add_treatment/cubit/add_treatment_cubit.dart';
import 'package:bunny_sync/features/breeders/models/breeder_by_gender_model/breeder_by_gender_model.dart';
import 'package:bunny_sync/features/health/cubit/health_cubit.dart';
import 'package:bunny_sync/features/health/model/ailment_model/ailment_model.dart';
import 'package:bunny_sync/features/health/model/treatment_model/treatment_model.dart';
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

abstract class AddTreatmentViewCallBacks {
  void onCategorySelected(BreederByGenderModel? type);

  void onBreederSelected(BreederByGenderModel? breeder);

  void onKitSelected(BreederByGenderModel? kit);

  void onAilmentSelected(AilmentModel? ailments);

  void onTitleChanged(String title);

  void onTitleSubmitted(String title);

  void onDateSelected(DateTime startDate, List<int> numbers);

  void onMedicationChanged(String medication);

  void onMedicationSubmitted(String medication);

  void onMethodChanged(String method);

  void onMethodSubmitted(String method);

  void onTypeChanged(String type);

  void onTypeSubmitted(String type);

  void onDosageCountChanged(String dosageCount);

  void onDosageCountSubmitted(String dosageCount);

  void onDosageTypeSelected(BreederByGenderModel? dosageType);

  void onDosageCountPerChanged(String dosageCountPer);

  void onDosageCountPerSubmitted(String dosageCountPer);

  void onDosageTypePerSelected(BreederByGenderModel? dosageTypePer);

  void onScheduleCountChanged(String scheduleCount);

  void onScheduleCountSubmitted(String scheduleCount);

  void onScheduleTypeSelected(BreederByGenderModel? scheduleType);

  void onWithDrawalCountChanged(String withDrawalCount);

  void onWithDrawalCountSubmitted(String withDrawalCount);

  void onWithDrawalTypeSelected(BreederByGenderModel? withDrawalType);

  void onNoteChanged(String note);

  void onNoteSubmitted(String note);

  void onSave();
}

@RoutePage()
class AddTreatmentView extends StatelessWidget {
  const AddTreatmentView({
    super.key,
    required this.healthCubit,
    this.treatmentModel,
  });

  final HealthCubit healthCubit;
  final TreatmentModel? treatmentModel;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: healthCubit,
        ),
        BlocProvider(
          create: (context) => get<AddTreatmentCubit>(),
        ),
      ],
      child: AddTreatmentPage(
        treatmentModel: treatmentModel,
      ),
    );
  }
}

class AddTreatmentPage extends StatefulWidget {
  const AddTreatmentPage({
    super.key,
    this.treatmentModel,
  });

  final TreatmentModel? treatmentModel;

  @override
  State<AddTreatmentPage> createState() => _AddTreatmentPageState();
}

class _AddTreatmentPageState extends State<AddTreatmentPage>
    implements AddTreatmentViewCallBacks {
  late final HealthCubit healthCubit = context.read();

  late final AddTreatmentCubit addTreatmentCubit = context.read();

  final titleFocusNode = FocusNode();

  final medicationFocusNode = FocusNode();

  final methodFocusNode = FocusNode();

  final typeFocusNode = FocusNode();

  final dosageCountFocusNode = FocusNode();

  final dosageCountPerFocusNode = FocusNode();

  final scheduleCountFocusNode = FocusNode();

  final withDrawalCountFocusNode = FocusNode();

  final noteFocusNode = FocusNode();

  bool showSelectKit = false;

  // TODO: remove thess and get them from cubit

  final List<BreederByGenderModel> categories = [
    BreederByGenderModel(id: 1, name: 'breeder'.i18n),
    BreederByGenderModel(id: 2, name: 'kits'.i18n),
  ];
  final List<BreederByGenderModel> breeders = [
    const BreederByGenderModel(id: 1, name: 'nux1'),
    const BreederByGenderModel(id: 2, name: 'nux2'),
    const BreederByGenderModel(id: 3, name: 'nux3'),
  ];
  final List<BreederByGenderModel> kits = [
    const BreederByGenderModel(id: 1, name: 'nux1'),
    const BreederByGenderModel(id: 2, name: 'nux2'),
    const BreederByGenderModel(id: 3, name: 'nux3'),
  ];
  final List<BreederByGenderModel> dosageTypes = [
    BreederByGenderModel(id: 1, name: 'ml'.i18n),
    BreederByGenderModel(id: 2, name: 'litter'.i18n),
    BreederByGenderModel(id: 3, name: 'oz'.i18n),
  ];
  final List<BreederByGenderModel> dosageTypesPer = [
    BreederByGenderModel(id: 1, name: 'lbs'.i18n),
    BreederByGenderModel(id: 2, name: 'oz'.i18n),
    BreederByGenderModel(id: 3, name: 'kg'.i18n),
    BreederByGenderModel(id: 4, name: 'grams'.i18n),
  ];
  final List<BreederByGenderModel> scheduleTypes = [
    BreederByGenderModel(id: 1, name: 'days'.i18n),
    BreederByGenderModel(id: 2, name: 'weeks'.i18n),
    BreederByGenderModel(id: 3, name: 'months'.i18n),
    BreederByGenderModel(id: 4, name: 'years'.i18n),
  ];

  final List<BreederByGenderModel> withDrawalsTypes = [
    BreederByGenderModel(id: 1, name: 'days'.i18n),
    BreederByGenderModel(id: 2, name: 'weeks'.i18n),
    BreederByGenderModel(id: 3, name: 'months'.i18n),
    BreederByGenderModel(id: 4, name: 'years'.i18n),
  ];

  BreederByGenderModel? selectedCategory;
  BreederByGenderModel? selectedBreeder;
  BreederByGenderModel? selectedKit;
  AilmentModel? selectedAilment;
  BreederByGenderModel? selectedDosageType;
  BreederByGenderModel? selectedDosageTypePer;
  BreederByGenderModel? selectedScheduleType;
  BreederByGenderModel? selectedWithDrawalType;

  @override
  void initState() {
    final treatmentModel = widget.treatmentModel;
    if (treatmentModel != null) {
      addTreatmentCubit.setAilmentId(treatmentModel.ailmentId);
      addTreatmentCubit.setTitle(treatmentModel.name);
      addTreatmentCubit.setStartDate(treatmentModel.startDate);
      addTreatmentCubit.setMedication(treatmentModel.medication);
      addTreatmentCubit.setMethod(treatmentModel.method);
      addTreatmentCubit.setType(treatmentModel.type);
      addTreatmentCubit.setDosageCount(treatmentModel.dosageCount.toString());
      addTreatmentCubit.setDosageType(treatmentModel.dosageType);
      addTreatmentCubit
          .setDosageCountPer(treatmentModel.dosageCountPer.toString());
      addTreatmentCubit.setDosageTypePer(treatmentModel.dosageTypePer);
      addTreatmentCubit
          .setScheduleCount(treatmentModel.scheduleCount.toString());
      addTreatmentCubit.setScheduleType(treatmentModel.scheduleType);
      addTreatmentCubit
          .setWithDrawalCount(treatmentModel.withDrawalCount.toString());
      addTreatmentCubit.setWithDrawalType(treatmentModel.withDrawalType);
      addTreatmentCubit.setNote(treatmentModel.note);
    }
    healthCubit.getAilments();
    super.initState();
  }

  @override
  void onAilmentSelected(AilmentModel? ailment) {
    addTreatmentCubit.setAilmentId(ailment?.id);
    setState(() {
      selectedAilment = ailment;
    });
  }

  @override
  void onBreederSelected(BreederByGenderModel? breeder) {
    setState(() {
      selectedBreeder = breeder;
    });
  }

  @override
  void onDateSelected(DateTime startDate, List<int> numbers) {
    addTreatmentCubit.setStartDate(startDate);
  }

  @override
  void onDosageCountChanged(String dosageCount) {
    addTreatmentCubit.setDosageCount(dosageCount);
  }

  @override
  void onDosageCountPerChanged(String dosageCountPer) {
    addTreatmentCubit.setDosageCountPer(dosageCountPer);
  }

  @override
  void onDosageCountPerSubmitted(String dosageCountPer) {
    scheduleCountFocusNode.requestFocus();
  }

  @override
  void onDosageCountSubmitted(String dosageCount) {
    dosageCountPerFocusNode.requestFocus();
  }

  @override
  void onDosageTypePerSelected(BreederByGenderModel? dosageTypePer) {
    addTreatmentCubit.setDosageTypePer(dosageTypePer?.name);
    setState(() {
      selectedDosageTypePer = dosageTypePer;
    });
  }

  @override
  void onDosageTypeSelected(BreederByGenderModel? dosageType) {
    addTreatmentCubit.setDosageType(dosageType?.name);
    setState(() {
      selectedDosageType = dosageType;
    });
  }

  @override
  void onKitSelected(BreederByGenderModel? kit) {
    setState(() {
      selectedKit = kit;
    });
  }

  @override
  void onMedicationChanged(String medication) {
    addTreatmentCubit.setMedication(medication);
  }

  @override
  void onMedicationSubmitted(String medication) {
    methodFocusNode.requestFocus();
  }

  @override
  void onMethodChanged(String method) {
    addTreatmentCubit.setMethod(method);
  }

  @override
  void onMethodSubmitted(String method) {
    typeFocusNode.requestFocus();
  }

  @override
  void onNoteChanged(String note) {
    addTreatmentCubit.setNote(note);
  }

  @override
  void onNoteSubmitted(String note) {
    onSave();
  }

  @override
  void onScheduleCountChanged(String scheduleCount) {
    addTreatmentCubit.setScheduleCount(scheduleCount);
  }

  @override
  void onScheduleCountSubmitted(String scheduleCount) {
    withDrawalCountFocusNode.requestFocus();
  }

  @override
  void onScheduleTypeSelected(BreederByGenderModel? scheduleType) {
    addTreatmentCubit.setScheduleType(scheduleType?.name);
    setState(() {
      selectedScheduleType = scheduleType;
    });
  }

  @override
  void onTitleChanged(String title) {
    addTreatmentCubit.setTitle(title);
  }

  @override
  void onTitleSubmitted(String title) {
    medicationFocusNode.requestFocus();
  }

  @override
  void onTypeChanged(String type) {
    addTreatmentCubit.setType(type);
  }

  @override
  void onTypeSubmitted(String type) {
    dosageCountFocusNode.requestFocus();
  }

  @override
  void onWithDrawalCountChanged(String withDrawalCount) {
    addTreatmentCubit.setWithDrawalCount(withDrawalCount);
  }

  @override
  void onWithDrawalCountSubmitted(String withDrawalCount) {
    noteFocusNode.requestFocus();
  }

  @override
  void onWithDrawalTypeSelected(BreederByGenderModel? withDrawalType) {
    addTreatmentCubit.setWithDrawalType(withDrawalType?.name);
    setState(() {
      selectedWithDrawalType = withDrawalType;
    });
  }

  @override
  void onCategorySelected(BreederByGenderModel? category) {
    setState(() {
      selectedCategory = category;
      if (category?.name == 'kits'.i18n) {
        showSelectKit = true;
      } else {
        showSelectKit = false;
      }
    });
  }

  @override
  void onSave() {
    final treatmentModel = widget.treatmentModel;
    if (treatmentModel != null) {
      addTreatmentCubit.updateTreatment(treatmentModel.id);
    } else {
      addTreatmentCubit.addTreatment();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: Text(
          'create_treatment'.i18n,
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
                      'category'.i18n,
                      style: context.tt.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: context.cs.surfaceContainerHighest,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    MainDropDownWidget<BreederByGenderModel>(
                      items: categories,
                      text: 'select_category'.i18n,
                      onChanged: onCategorySelected,
                      selectedValue: selectedCategory,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
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
                    MainDropDownWidget<BreederByGenderModel>(
                      items: kits,
                      text: 'select_breeder'.i18n,
                      onChanged: onBreederSelected,
                      selectedValue: selectedBreeder,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Visibility(
                      visible: showSelectKit,
                      child: Column(
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
                          MainDropDownWidget<BreederByGenderModel>(
                            items: kits,
                            text: 'select_kit'.i18n,
                            onChanged: onKitSelected,
                            selectedValue: selectedKit,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<HealthCubit, GeneralHealthState>(
                      builder: (context, state) {
                        if (state is AilmentsLoading) {
                          return Center(
                            child: LoadingIndicator(
                              color: context.cs.primary,
                            ),
                          );
                        } else if (state is AilmentsSuccess) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ailments'.i18n,
                                style: context.tt.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: context.cs.surfaceContainerHighest,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              MainDropDownWidget<AilmentModel>(
                                items: state.ailments,
                                text: 'select_ailment'.i18n,
                                onChanged: onAilmentSelected,
                                selectedValue: selectedAilment,
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                            ],
                          );
                        } else if (state is AilmentsEmpty) {
                          return MainErrorWidget(error: state.message);
                        } else if (state is AilmentsFail) {
                          return MainErrorWidget(error: state.message);
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                    MainTextField(
                      initialValue: widget.treatmentModel?.name,
                      onSubmitted: onTitleSubmitted,
                      onChanged: onTitleChanged,
                      focusNode: titleFocusNode,
                      hintText: 'treatment'.i18n,
                      labelText: 'treatment'.i18n,
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
                        onChange: onDateSelected,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MainTextField(
                      initialValue: widget.treatmentModel?.medication,
                      onSubmitted: onMedicationSubmitted,
                      onChanged: onMedicationChanged,
                      focusNode: medicationFocusNode,
                      hintText: 'medication'.i18n,
                      labelText: 'medication'.i18n,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MainTextField(
                      initialValue: widget.treatmentModel?.method,
                      onSubmitted: onMethodSubmitted,
                      onChanged: onMethodChanged,
                      focusNode: methodFocusNode,
                      hintText: 'method'.i18n,
                      labelText: 'method'.i18n,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MainTextField(
                      initialValue: widget.treatmentModel?.type,
                      onSubmitted: onTypeSubmitted,
                      onChanged: onTypeChanged,
                      focusNode: typeFocusNode,
                      hintText: 'type'.i18n,
                      labelText: 'type'.i18n,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: SizedBox(
                            child: MainTextField(
                              initialValue:
                                  widget.treatmentModel?.dosageCount.toString(),
                              onSubmitted: onDosageCountSubmitted,
                              onChanged: onDosageCountChanged,
                              focusNode: dosageCountFocusNode,
                              hintText: 'dosageCount'.i18n,
                              labelText: 'dosageCount'.i18n,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'dosage'.i18n,
                                style: context.tt.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: context.cs.surfaceContainerHighest,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              MainDropDownWidget<BreederByGenderModel>(
                                items: dosageTypes,
                                text: 'select_Dosage'.i18n,
                                onChanged: onDosageTypeSelected,
                                selectedValue: selectedDosageType,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: MainTextField(
                            initialValue:
                                widget.treatmentModel?.dosageCount.toString(),
                            onSubmitted: onDosageCountPerSubmitted,
                            onChanged: onDosageCountPerChanged,
                            focusNode: dosageCountPerFocusNode,
                            hintText: 'dosage_count_per'.i18n,
                            labelText: 'dosage_count_per'.i18n,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'dosage_type_per'.i18n,
                                style: context.tt.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: context.cs.surfaceContainerHighest,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              MainDropDownWidget<BreederByGenderModel>(
                                items: dosageTypesPer,
                                text: 'select_dosage_type_per'.i18n,
                                onChanged: onDosageTypePerSelected,
                                selectedValue: selectedDosageTypePer,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: MainTextField(
                            initialValue:
                                widget.treatmentModel?.scheduleCount.toString(),
                            onSubmitted: onScheduleCountSubmitted,
                            onChanged: onScheduleCountChanged,
                            focusNode: scheduleCountFocusNode,
                            hintText: 'schedule_count'.i18n,
                            labelText: 'schedule_count'.i18n,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'schedule'.i18n,
                                style: context.tt.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: context.cs.surfaceContainerHighest,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              MainDropDownWidget<BreederByGenderModel>(
                                items: scheduleTypes,
                                text: 'select_schedule'.i18n,
                                onChanged: onScheduleTypeSelected,
                                selectedValue: selectedScheduleType,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: MainTextField(
                            initialValue: widget.treatmentModel?.withDrawalCount
                                .toString(),
                            onSubmitted: onWithDrawalCountSubmitted,
                            onChanged: onWithDrawalCountChanged,
                            focusNode: withDrawalCountFocusNode,
                            hintText: 'with_drawal_count'.i18n,
                            labelText: 'with_drawal_count'.i18n,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'with_drawal'.i18n,
                                style: context.tt.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: context.cs.surfaceContainerHighest,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              MainDropDownWidget<BreederByGenderModel>(
                                items: withDrawalsTypes,
                                text: 'select_with_drawal'.i18n,
                                onChanged: onWithDrawalTypeSelected,
                                selectedValue: selectedWithDrawalType,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MainTextField(
                      initialValue: widget.treatmentModel?.note,
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
                    child: BlocConsumer<AddTreatmentCubit,
                        GeneralAddTreatmentState>(
                      listener: (context, state) {
                        if (state is AddTreatmentSuccess) {
                          MainSnackBar.showSuccessMessageBar(
                            context,
                            "treatment_added".i18n,
                          );
                          context.router.maybePop();
                          healthCubit.addTreatment(
                            state.treatment,
                          );
                        } else if (state is UpdateTreatmentSuccess) {
                          MainSnackBar.showSuccessMessageBar(
                            context,
                            "treatment_updated".i18n,
                          );
                          context.router.maybePop();
                          healthCubit.updateTreatment(
                            state.treatment,
                          );
                        } else if (state is AddTreatmentFail) {
                          MainSnackBar.showErrorMessageBar(
                            context,
                            state.message,
                          );
                        }
                      },
                      builder: (context, state) {
                        var onTap = onSave;
                        Widget? child;
                        if (state is AddTreatmentLoading) {
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
