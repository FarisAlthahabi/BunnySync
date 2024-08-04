import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/breeders/models/breeder_by_gender_model/breeder_by_gender_model.dart';
import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/buttons/main_action_button.dart';
import 'package:bunny_sync/global/widgets/main_app_bar.dart';
import 'package:bunny_sync/global/widgets/main_date_picker.dart';
import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';
import 'package:bunny_sync/global/widgets/main_text_field.dart';
import 'package:flutter/material.dart';

abstract class AddTreatmentViewCallBacks {
  void onCategorySelected(BreederByGenderModel? type);

  void onBreederSelected(BreederByGenderModel? breeder);

  void onKitSelected(BreederByGenderModel? kit);

  void onAilmentSelected(BreederByGenderModel? ailments);

  void onTreatmentChanged(String treatment);

  void onTreatmentSubmitted(String treatment);

  void onDateSelected(DateTime date, List<int> numbers);

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
  const AddTreatmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddTreatmentPage();
  }
}

class AddTreatmentPage extends StatefulWidget {
  const AddTreatmentPage({super.key});

  @override
  State<AddTreatmentPage> createState() => _AddTreatmentPageState();
}

class _AddTreatmentPageState extends State<AddTreatmentPage>
    implements AddTreatmentViewCallBacks {
  final treatmentFocusNode = FocusNode();

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
  final List<BreederByGenderModel> ailments = [
    const BreederByGenderModel(id: 1, name: "can't walk"),
    const BreederByGenderModel(id: 2, name: "can't walk"),
    const BreederByGenderModel(id: 3, name: "can't walk"),
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
  BreederByGenderModel? selectedAilment;
  BreederByGenderModel? selectedDosageType;
  BreederByGenderModel? selectedDosageTypePer;
  BreederByGenderModel? selectedScheduleType;
  BreederByGenderModel? selectedWithDrawalType;

  @override
  void onAilmentSelected(BreederByGenderModel? ailment) {
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
  void onDateSelected(DateTime date, List<int> numbers) {
    // TODO: implement onDateSelected
  }

  @override
  void onDosageCountChanged(String dosageCount) {
    // TODO: implement onDosageCountChanged
  }

  @override
  void onDosageCountPerChanged(String dosageCountPer) {
    // TODO: implement onDosageCountPerChanged
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
    selectedDosageTypePer = dosageTypePer;
  }

  @override
  void onDosageTypeSelected(BreederByGenderModel? dosageType) {
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
    // TODO: implement onMedicationChanged
  }

  @override
  void onMedicationSubmitted(String medication) {
    methodFocusNode.requestFocus();
  }

  @override
  void onMethodChanged(String method) {
    // TODO: implement onMethodChanged
  }

  @override
  void onMethodSubmitted(String method) {
    typeFocusNode.requestFocus();
  }

  @override
  void onNoteChanged(String note) {
    // TODO: implement onNoteChanged
  }

  @override
  void onNoteSubmitted(String note) {
    onSave();
  }

  @override
  void onScheduleCountChanged(String scheduleCount) {
    // TODO: implement onScheduleCountChanged
  }

  @override
  void onScheduleCountSubmitted(String scheduleCount) {
    withDrawalCountFocusNode.requestFocus();
  }

  @override
  void onScheduleTypeSelected(BreederByGenderModel? scheduleType) {
    setState(() {
      selectedScheduleType = scheduleType;
    });
  }

  @override
  void onTreatmentChanged(String treatment) {
    // TODO: implement onTreatmentChanged
  }

  @override
  void onTreatmentSubmitted(String treatment) {
    medicationFocusNode.requestFocus();
  }

  @override
  void onTypeChanged(String type) {
    // TODO: implement onTypeChanged
  }

  @override
  void onTypeSubmitted(String type) {
    dosageCountFocusNode.requestFocus();
  }

  @override
  void onWithDrawalCountChanged(String withDrawalCount) {
    // TODO: implement onWithDrawalCountChanged
  }

  @override
  void onWithDrawalCountSubmitted(String withDrawalCount) {
    noteFocusNode.requestFocus();
  }

  @override
  void onWithDrawalTypeSelected(BreederByGenderModel? withDrawalType) {
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
    // TODO: implement onSave
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
                    MainDropDownWidget<BreederByGenderModel>(
                      items: ailments,
                      text: 'select_ailment'.i18n,
                      onChanged: onAilmentSelected,
                      selectedValue: selectedAilment,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MainTextField(
                      onSubmitted: onTreatmentSubmitted,
                      onChanged: onTreatmentChanged,
                      focusNode: treatmentFocusNode,
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
                    MainTextField(
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
                    child: MainActionButton(
                      onTap: onSave,
                      text: "save".i18n,
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
