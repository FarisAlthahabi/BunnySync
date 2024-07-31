import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/buttons/main_action_button.dart';
import 'package:bunny_sync/global/widgets/main_app_bar.dart';
import 'package:bunny_sync/global/widgets/main_text_field.dart';
import 'package:flutter/material.dart';

abstract class AddCategoryViewCallBack {
  void onNameChanged(String name);

  void onNameSubmitted(String name);

  void onDescriptionChanged(String description);

  void onDescriptionSubmitted(String description);

  void onSave();
}

@RoutePage()
class AddCategoryView extends StatelessWidget {
  const AddCategoryView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AddCategoryPage();
  }
}

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({
    super.key,
  });

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage>
    implements AddCategoryViewCallBack {
  final nameFocusNode = FocusNode();

  final descriptionFocusNode = FocusNode();

  @override
  void onDescriptionChanged(String description) {
    // TODO: implement onDescriptionChanged
  }

  @override
  void onDescriptionSubmitted(String description) {
    // TODO: implement onDescriptionSubmitted
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
  void onSave() {
    // TODO: implement onSave
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: Text(
          'create_ledger_category'.i18n,
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
                      hintText: "name".i18n,
                      labelText: "name".i18n,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MainTextField(
                      onSubmitted: onDescriptionSubmitted,
                      onChanged: onDescriptionChanged,
                      focusNode: descriptionFocusNode,
                      hintText: "description".i18n,
                      labelText: "description".i18n,
                      maxLines: 7,
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
