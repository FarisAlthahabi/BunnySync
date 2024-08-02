import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/buttons/main_action_button.dart';
import 'package:bunny_sync/global/widgets/main_app_bar.dart';
import 'package:bunny_sync/global/widgets/main_text_field.dart';
import 'package:flutter/material.dart';

abstract class AddCustomerViewCallBack {
  void onNameChanged(String name);

  void onNameSubmitted(String name);

  void onEmailChanged(String email);

  void onEmailSubmitted(String email);

  void onTypeChanged(String type);

  void onTypeSubmitted(String type);

  void onCompanyNameChanged(String companyName);

  void onCompanyNameSubmitted(String companyName);

  void onPhoneChanged(String phone);

  void onPhoneSubmitted(String phone);

  void onNoteChanged(String note);

  void onNoteSubmitted(String note);

  void onStreetChanged(String street);

  void onStreetSubmitted(String street);

  void onCityChanged(String city);

  void onCitySubmitted(String city);

  void onCountryChanged(String country);

  void onCountrySubmitted(String country);

  void onStateChanged(String state);

  void onStateSubmitted(String state);

  void onZipCodeChanged(String zipCode);

  void onZipCodeSubmitted(String zipCode);

  void onSave();
}

@RoutePage()
class AddCustomerView extends StatelessWidget {
  const AddCustomerView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AddCustomerPage();
  }
}

class AddCustomerPage extends StatefulWidget {
  const AddCustomerPage({
    super.key,
  });

  @override
  State<AddCustomerPage> createState() => _AddCustomerPageState();
}

class _AddCustomerPageState extends State<AddCustomerPage>
    implements AddCustomerViewCallBack {
  final focusNode = List.generate(11, (index) => FocusNode());

  @override
  void onNameChanged(String name) {}

  @override
  void onNameSubmitted(String name) {
    focusNode[1].requestFocus();
  }

  @override
  void onEmailChanged(String email) {}

  @override
  void onEmailSubmitted(String email) {
    focusNode[2].requestFocus();
  }

  @override
  void onCityChanged(String city) {
    // TODO: implement onCityChanged
  }

  @override
  void onCitySubmitted(String city) {
    focusNode[8].requestFocus();
  }

  @override
  void onCompanyNameChanged(String companyName) {
    // TODO: implement onCompanyNameChanged
  }

  @override
  void onCompanyNameSubmitted(String companyName) {
    focusNode[4].requestFocus();
  }

  @override
  void onCountryChanged(String country) {
    // TODO: implement onCountryChanged
  }

  @override
  void onCountrySubmitted(String country) {
    focusNode[9].requestFocus();
  }

  @override
  void onNoteChanged(String note) {
    // TODO: implement onNoteChanged
  }

  @override
  void onNoteSubmitted(String note) {
    focusNode[6].requestFocus();
  }

  @override
  void onPhoneChanged(String phone) {
    // TODO: implement onPhoneChanged
  }

  @override
  void onPhoneSubmitted(String phone) {
    focusNode[5].requestFocus();
  }

  @override
  void onStateChanged(String state) {
    // TODO: implement onStateChanged
  }

  @override
  void onStateSubmitted(String state) {
    focusNode[10].requestFocus();
  }

  @override
  void onStreetChanged(String street) {
    // TODO: implement onStreetChanged
  }

  @override
  void onStreetSubmitted(String street) {
    focusNode[7].requestFocus();
  }

  @override
  void onTypeChanged(String type) {
    // TODO: implement onTypeChanged
  }

  @override
  void onTypeSubmitted(String type) {
    focusNode[3].requestFocus();
  }

  @override
  void onZipCodeChanged(String zipCode) {
    // TODO: implement onZipCodeChanged
  }

  @override
  void onZipCodeSubmitted(String zipCode) {
    onSave();
  }

  @override
  void onSave() {}

  late final List<ValueSetter<String>> onPropertyChanged = [
    onNameChanged,
    onEmailChanged,
    onTypeChanged,
    onCompanyNameChanged,
    onPhoneChanged,
    onNoteChanged,
    onStreetChanged,
    onCityChanged,
    onCountryChanged,
    onStateChanged,
    onZipCodeChanged,
  ];

  late final List<ValueSetter<String>> onPropertySubmitted = [
    onNameSubmitted,
    onEmailSubmitted,
    onTypeSubmitted,
    onCompanyNameSubmitted,
    onPhoneSubmitted,
    onNoteSubmitted,
    onStreetSubmitted,
    onCitySubmitted,
    onCountrySubmitted,
    onStateSubmitted,
    onZipCodeSubmitted,
  ];

  final List<String> propertyLabelText = [
    '${"name".i18n} *',
    '${"email".i18n} *',
    "type".i18n,
    "company_name".i18n,
    "phone".i18n,
    "note".i18n,
    "street".i18n,
    "city".i18n,
    "country".i18n,
    "state".i18n,
    "zip_code".i18n,
  ];

  final propertyHintText = [
    "name".i18n,
    "email".i18n,
    "type".i18n,
    "company_name".i18n,
    "phone".i18n,
    "note".i18n,
    "street".i18n,
    "city".i18n,
    "country".i18n,
    "state".i18n,
    "zip_code".i18n,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: Text(
          'new_customer'.i18n,
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
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: propertyLabelText.length,
                      itemBuilder: (context, index) {
                        return MainTextField(
                          onSubmitted: onPropertySubmitted[index],
                          onChanged: onPropertyChanged[index],
                          focusNode: focusNode[index],
                          hintText: propertyHintText[index],
                          labelText: propertyLabelText[index],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 25,
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
