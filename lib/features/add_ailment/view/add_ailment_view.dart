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

abstract class AddAilmentViewCallBacks {
  void onTypeSelected(BreederByGenderModel? type);

  void onBreederSelected(BreederByGenderModel? breeder);

  void onKitSelected(BreederByGenderModel? kit);

  void onSymptomsChanged(String symptoms);

  void onSymptomsSubmitted(String symptoms);

  void onAilmentsChanged(String ailments);

  void onAilmentsSubmitted(String ailments);

  void onDateSelected(DateTime date, List<int> numbers);

  void onStatusSelected(BreederByGenderModel? status);

  void onNoteChanged(String note);

  void onNoteSubmitted(String note);

  void onSave();
}

@RoutePage()
class AddAilmentView extends StatelessWidget {
  const AddAilmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddAilmentPage();
  }
}

class AddAilmentPage extends StatefulWidget {
  const AddAilmentPage({super.key});

  @override
  State<AddAilmentPage> createState() => _AddAilmentPageState();
}

class _AddAilmentPageState extends State<AddAilmentPage>
    implements AddAilmentViewCallBacks {
  final ailmentsFocusNode = FocusNode();

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
  final List<BreederByGenderModel> recurringPeriods = [
    const BreederByGenderModel(id: 1, name: 'Once'),
    const BreederByGenderModel(id: 2, name: 'Every Week'),
    const BreederByGenderModel(id: 3, name: 'Every 2 Weeks'),
    const BreederByGenderModel(id: 4, name: 'Every Month'),
  ];
  BreederByGenderModel? selectedType;
  BreederByGenderModel? selectedKit;
  BreederByGenderModel? selectedBreeder;
  BreederByGenderModel? selectedStatus;

  @override
  void onAilmentsChanged(String ailments) {
    // TODO: implement onAilmentsChanged
  }

  @override
  void onAilmentsSubmitted(String ailments) {
    symptomsFocusNode.requestFocus();
  }

  @override
  void onBreederSelected(BreederByGenderModel? breeder) {
    setState(() {
      selectedBreeder = breeder;
    });
  }

  @override
  void onKitSelected(BreederByGenderModel? kit) {
    setState(() {
      selectedKit = kit;
    });
  }

  @override
  void onDateSelected(DateTime date, List<int> numbers) {
    // TODO: implement onDateSelected
  }

  @override
  void onStatusSelected(BreederByGenderModel? status) {
    setState(() {
      selectedStatus = status;
    });
  }

  @override
  void onSymptomsChanged(String symptoms) {
    // TODO: implement onSymptomsChanged
  }

  @override
  void onSymptomsSubmitted(String symptoms) {
    noteFocusNode.requestFocus();
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
  void onTypeSelected(BreederByGenderModel? type) {
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
    // TODO: implement onSave
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
                    MainTextField(
                      onSubmitted: onAilmentsSubmitted,
                      onChanged: onAilmentsChanged,
                      focusNode: ailmentsFocusNode,
                      hintText: 'ailments'.i18n,
                      labelText: 'ailments'.i18n,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MainTextField(
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
                        onChange: onDateSelected,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
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
                      items: status,
                      text: 'select_status'.i18n,
                      onChanged: onStatusSelected,
                      selectedValue: selectedStatus,
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
