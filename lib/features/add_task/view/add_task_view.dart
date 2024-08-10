import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/breeders/models/breeder_by_gender_model/breeder_by_gender_model.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/buttons/main_action_button.dart';
import 'package:bunny_sync/global/widgets/main_app_bar.dart';
import 'package:bunny_sync/global/widgets/main_date_picker.dart';
import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';
import 'package:bunny_sync/global/widgets/main_text_field.dart';
import 'package:flutter/material.dart';

abstract class AddTaskViewCallBacks {
  void onTypeSelected(BreederByGenderModel? type);

  void onTaskTypeSelected(BreederByGenderModel? type);

  void onNameChanged(String name);

  void onNameSubmitted(String name);

  void onBreederSelected(BreederByGenderModel? breeder);

  void onDateSelected(DateTime date, List<int> numbers);

  void onRecurringSelected(BreederByGenderModel? recurringPeriod);

  void onNoteChanged(String note);

  void onNoteSubmitted(String note);

  void onSave();
}

@RoutePage()
class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddTaskPage();
  }
}

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage>
    implements AddTaskViewCallBacks {
  final nameFocusNode = FocusNode();

  final noteFocusNode = FocusNode();

  bool showSelectBreeder = false;

  // TODO: remove thess and get them from cubit

  final List<BreederByGenderModel> types = [
    const BreederByGenderModel(id: 1, name: 'General'),
    const BreederByGenderModel(id: 2, name: 'Breeder'),
    const BreederByGenderModel(id: 3, name: 'Litter'),
  ];
  final List<BreederByGenderModel> taskTypes = [
    const BreederByGenderModel(id: 1, name: 'General'),
    const BreederByGenderModel(id: 2, name: 'Breeder'),
    const BreederByGenderModel(id: 3, name: 'Litter'),
  ];
  final List<BreederByGenderModel> breeders = [
    const BreederByGenderModel(id: 1, name: 'nux1'),
    const BreederByGenderModel(id: 2, name: 'nux2'),
    const BreederByGenderModel(id: 3, name: 'nux3'),
  ];
  final List<BreederByGenderModel> recurringPeriods = [
    const BreederByGenderModel(id: 1, name: 'Once'),
    const BreederByGenderModel(id: 2, name: 'Every Week'),
    const BreederByGenderModel(id: 3, name: 'Every 2 Weeks'),
    const BreederByGenderModel(id: 4, name: 'Every Month'),
  ];
  BreederByGenderModel? selectedType;
  BreederByGenderModel? selectedTaskType;
  BreederByGenderModel? selectedBreeder;
  BreederByGenderModel? selectedRecurringPeriod;
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
  void onNameChanged(String name) {
    // TODO: implement onNameChanged
  }

  @override
  void onNameSubmitted(String name) {
    // TODO: implement onNameSubmitted
  }

  @override
  void onNoteChanged(String note) {
    // TODO: implement onNoteChanged
  }

  @override
  void onNoteSubmitted(String note) {
    // TODO: implement onNoteSubmitted
  }

  @override
  void onRecurringSelected(BreederByGenderModel? recurringPeriod) {
    setState(() {
      selectedRecurringPeriod = recurringPeriod;
    });
  }

  @override
  void onTaskTypeSelected(BreederByGenderModel? type) {
    setState(() {
      selectedTaskType = type;
    });
  }

  @override
  void onTypeSelected(BreederByGenderModel? type) {
    setState(() {
      selectedType = type;
      if (type?.name != 'General') {
        showSelectBreeder = true;
      } else {
        showSelectBreeder = false;
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
          'create_task'.i18n,
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
                    Visibility(
                      visible: showSelectBreeder,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'who'.i18n,
                            style: context.tt.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: context.cs.surfaceContainerHighest,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          MainDropDownWidget<BreederByGenderModel>(
                            items: breeders,
                            text: 'select_breeder'.i18n,
                            onChanged: onBreederSelected,
                            selectedValue: selectedBreeder,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'task_type'.i18n,
                      style: context.tt.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: context.cs.surfaceContainerHighest,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    MainDropDownWidget<BreederByGenderModel>(
                      items: taskTypes,
                      text: 'select_type'.i18n,
                      onChanged: onTaskTypeSelected,
                      selectedValue: selectedTaskType,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MainTextField(
                      onSubmitted: onNameSubmitted,
                      onChanged: onNameChanged,
                      focusNode: nameFocusNode,
                      hintText: 'name'.i18n,
                      labelText: 'name'.i18n,
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
                    Text(
                      'recurring'.i18n,
                      style: context.tt.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: context.cs.surfaceContainerHighest,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    MainDropDownWidget<BreederByGenderModel>(
                      items: recurringPeriods,
                      text: 'select_recurring'.i18n,
                      onChanged: onRecurringSelected,
                      selectedValue: selectedRecurringPeriod,
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
