import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/add_ledger/models/ledger_types/ledger_types.dart';
import 'package:bunny_sync/features/add_task/model/task_types/task_types.dart';
import 'package:bunny_sync/features/breeders/models/breeder_by_gender_model/breeder_by_gender_model.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/buttons/main_action_button.dart';
import 'package:bunny_sync/global/widgets/main_app_bar.dart';
import 'package:bunny_sync/global/widgets/main_date_picker.dart';
import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';
import 'package:bunny_sync/global/widgets/main_text_field.dart';
import 'package:bunny_sync/global/widgets/radio_selector_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

abstract class AddLedgerViewCallBacks {
  void onTypeSelected(LedgerTypes? type);

  void onNameChanged(String name);

  void onNameSubmitted(String name);

  void onDateSelected(DateTime date, List<int> numbers);

  void onAmountChanged(String amount);

  void onAmountSubmitted(String amount);

  void onCategorySelected(TaskTypes? category);

  void onContactSelected(BreederByGenderModel? contact);

  void onNoteChanged(String note);

  void onNoteSubmitted(String note);

  Future<void> onFilePicked();

  void onSave();
}

@RoutePage()
class AddLedgerView extends StatelessWidget {
  const AddLedgerView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddLedgerPage();
  }
}

class AddLedgerPage extends StatefulWidget {
  const AddLedgerPage({super.key});

  @override
  State<AddLedgerPage> createState() => _AddLedgerPageState();
}

class _AddLedgerPageState extends State<AddLedgerPage>
    implements AddLedgerViewCallBacks {
  final nameFocusNode = FocusNode();

  final amountFocusNode = FocusNode();

  final noteFocusNode = FocusNode();

  @override
  void dispose() {
    nameFocusNode.dispose();
    amountFocusNode.dispose();
    noteFocusNode.dispose();

    super.dispose();
  }

  @override
  void onAmountChanged(String amount) {
    // TODO: implement onAmountChanged
  }

  @override
  void onAmountSubmitted(String amount) {
    // TODO: implement onAmountSubmitted
  }

  @override
  void onCategorySelected(TaskTypes? category) {}

  @override
  void onContactSelected(BreederByGenderModel? contact) {}

  @override
  void onDateSelected(DateTime date, List<int> numbers) {
    // TODO: implement onDateSelected
  }

  @override
  Future<void> onFilePicked() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles();
    final path = result?.files.single.path;
    if (result != null && path != null) {
      final File file = File(path);
    }
    // TODO: implement onFilePicked
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
  void onSave() {
    // TODO: implement onSave
  }

  @override
  void onTypeSelected(LedgerTypes? type) {
    // TODO: implement onTypeSelected
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: Text(
          'create_ledger'.i18n,
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
                      onSubmitted: onNameSubmitted,
                      onChanged: onNameChanged,
                      focusNode: nameFocusNode,
                      hintText: 'name'.i18n,
                      labelText: 'name'.i18n,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MainTextField(
                      onSubmitted: onAmountSubmitted,
                      onChanged: onAmountChanged,
                      focusNode: amountFocusNode,
                      hintText: 'amount'.i18n,
                      labelText: 'amount'.i18n,
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
                      height: 5,
                    ),
                    RadioSelectorWidget<LedgerTypes>(
                      items: LedgerTypes.values,
                      onSelected: onTypeSelected,
                    ),
                    const SizedBox(
                      height: 25,
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
                    MainDropDownWidget<TaskTypes>(
                      items: TaskTypes.values,
                      text: 'select_category'.i18n,
                      onChanged: onCategorySelected,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      'contact'.i18n,
                      style: context.tt.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: context.cs.surfaceContainerHighest,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    //TODO: Creating model for that and don't forget to remove implement models from BreederByGenderModel
                    MainDropDownWidget<BreederByGenderModel>(
                      items: const [],
                      text: 'select_contact'.i18n,
                      onChanged: onContactSelected,
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
                      height: 10,
                    ),
                    MainTextField(
                      onSubmitted: onNoteSubmitted,
                      onChanged: onNoteChanged,
                      focusNode: noteFocusNode,
                      hintText: 'note'.i18n,
                      labelText: 'note'.i18n,
                      maxLines: 4,
                    ),
                    const SizedBox(height: 25),
                    Text(
                      'attach_receipt'.i18n,
                      style: context.tt.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: context.cs.surfaceContainerHighest,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    InkWell(
                      onTap: onFilePicked,
                      child: Container(
                        padding: AppConstants.padding16,
                        decoration: BoxDecoration(
                          border: Border.all(color: context.cs.onSurface),
                          borderRadius: AppConstants.borderRadius12,
                        ),
                        child: Row(
                          children: [
                            Text(
                              'choose_file'.i18n,
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Text(
                                //TODO: To be handled.
                                true ? 'no_file_choosen'.i18n : '',
                              ),
                            ),
                          ],
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
