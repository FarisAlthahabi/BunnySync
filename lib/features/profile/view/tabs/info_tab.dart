import 'package:bunny_sync/features/breeders/models/breeder_by_gender_model/breeder_by_gender_model.dart';
import 'package:bunny_sync/features/profile/cubit/profile_cubit.dart';
import 'package:bunny_sync/features/profile/model/user_model/user_model.dart';
import 'package:bunny_sync/global/extensions/date_time_x.dart';
import 'package:bunny_sync/global/gen/assets.gen.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/breeder_image_widget.dart';
import 'package:bunny_sync/global/widgets/buttons/main_action_button.dart';
import 'package:bunny_sync/global/widgets/loading_indicator.dart';
import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:bunny_sync/global/widgets/main_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class InfoTabCallBacks {
  void onSave();

  void onFirstNameChanged(String firstName);

  void onLastNameChanged(String lastName);

  void onRabbitryNameChanged(String rabbitryName);

  void onPhoneNumberChanged(String phoneNumber);

  void onAddressChanged(String address);

  void onStateChanged(String state);

  void onZipCodeChanged(String zipCode);

  void onFirstNameSubmitted(String firstName);

  void onLastNameSubmitted(String lastName);

  void onRabbitryNameSubmitted(String rabbitryName);

  void onPhoneNumberSubmitted(String phoneNumber);

  void onAddressSubmitted(String address);

  void onStateSubmitted(String state);

  void onZipCodeSubmitted(String zipCode);

  void onCountrySelected(BreederByGenderModel? country);

  void onLanguageSelected(BreederByGenderModel? language);

  void onTimeZoneSelected(BreederByGenderModel? timeZone);

  void onCurrencySelected(BreederByGenderModel? currency);
}

class InfoTab extends StatelessWidget {
  const InfoTab({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return InfoPage(user: user);
  }
}

class InfoPage extends StatefulWidget {
  const InfoPage({super.key, required this.user});

  final UserModel user;

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> implements InfoTabCallBacks {
  late final ProfileCubit profileCubit = context.read();

  final focusNodes = List.generate(
    8,
    (index) => FocusNode(),
  );

  BreederByGenderModel? selectedCountry;
  BreederByGenderModel? selectedLanguage;
  BreederByGenderModel? selectedTimeZone;
  BreederByGenderModel? selectedCurrency;

  final languages = [
    BreederByGenderModel(id: 1, name: 'english'.i18n),
    BreederByGenderModel(id: 2, name: 'french'.i18n),
    BreederByGenderModel(id: 3, name: 'german'.i18n),
    BreederByGenderModel(id: 4, name: 'portugeuse'.i18n),
  ];

  final countries = [
    const BreederByGenderModel(id: 1, name: 'Australia'),
    const BreederByGenderModel(id: 2, name: 'Bangladesh'),
    const BreederByGenderModel(id: 3, name: 'Belarus'),
    const BreederByGenderModel(id: 4, name: 'Brazil'),
  ];

  final timeZones = [
    const BreederByGenderModel(id: 1, name: '(GMT-10:00) Hawaii'),
    const BreederByGenderModel(id: 2, name: '(GMT-09:00) Alaska'),
    const BreederByGenderModel(id: 3, name: '(GMT-07:00) Arizona'),
    const BreederByGenderModel(id: 4, name: '(GMT-06:00) Central America'),
  ];

  final currencies = [
    const BreederByGenderModel(id: 1, name: 'USD'),
    const BreederByGenderModel(id: 2, name: 'Euro'),
    const BreederByGenderModel(id: 3, name: 'Pound'),
    const BreederByGenderModel(id: 4, name: 'Bitcoin'),
  ];

  late final items = [
    languages,
    countries,
    timeZones,
    currencies,
  ];

  late final List<BreederByGenderModel?> selectedValue = [
    selectedCountry,
    selectedLanguage,
    selectedTimeZone,
    selectedCurrency,
  ];

  late final List<ValueSetter<BreederByGenderModel?>> onValueSelected = [
    onCountrySelected,
    onLanguageSelected,
    onTimeZoneSelected,
    onCurrencySelected,
  ];

  @override
  void onAddressChanged(String address) {
    // TODO: implement onAddressChanged
  }

  @override
  void onAddressSubmitted(String address) {
    focusNodes[6].requestFocus();
  }

  @override
  void onFirstNameChanged(String firstName) {
    // TODO: implement onFirstNameChanged
  }

  @override
  void onFirstNameSubmitted(String firstName) {
    focusNodes[1].requestFocus();
  }

  @override
  void onLastNameChanged(String lastName) {
    // TODO: implement onLastNameChanged
  }

  @override
  void onLastNameSubmitted(String lastName) {
    focusNodes[3].requestFocus();
  }

  @override
  void onPhoneNumberChanged(String phoneNumber) {
    // TODO: implement onPhoneNumberChanged
  }

  @override
  void onPhoneNumberSubmitted(String phoneNumber) {
    focusNodes[5].requestFocus();
  }

  @override
  void onRabbitryNameChanged(String rabbitryName) {
    // TODO: implement onRabbitryNameChanged
  }

  @override
  void onRabbitryNameSubmitted(String rabbitryName) {
    focusNodes[4].requestFocus();
  }

  @override
  void onStateChanged(String state) {
    // TODO: implement onStateChanged
  }

  @override
  void onStateSubmitted(String state) {
    focusNodes[7].requestFocus();
  }

  @override
  void onZipCodeChanged(String zipCode) {
    // TODO: implement onZipCodeChanged
  }

  @override
  void onZipCodeSubmitted(String zipCode) {
    focusNodes[7].unfocus();
  }

  @override
  void onCountrySelected(BreederByGenderModel? country) {
    setState(() {
      selectedValue[0] = country;
    });
  }

  @override
  void onCurrencySelected(BreederByGenderModel? currency) {
    setState(() {
      selectedValue[3] = currency;
    });
  }

  @override
  void onLanguageSelected(BreederByGenderModel? language) {
    setState(() {
      selectedValue[1] = language;
    });
  }

  @override
  void onTimeZoneSelected(BreederByGenderModel? timeZone) {
    setState(() {
      selectedValue[2] = timeZone;
    });
  }

  @override
  void onSave() {
    //TODO ......................
    //profileCubit.updateProfileInfo();
  }

  late final onChanged = [
    onFirstNameChanged,
    onLastNameChanged,
    null,
    onRabbitryNameChanged,
    onPhoneNumberChanged,
    onAddressChanged,
    onStateChanged,
    onZipCodeChanged,
  ];

  late final onSubmitted = [
    onFirstNameSubmitted,
    onLastNameSubmitted,
    null,
    onRabbitryNameSubmitted,
    onPhoneNumberSubmitted,
    onAddressSubmitted,
    onStateSubmitted,
    onZipCodeSubmitted,
  ];

  final dropDownLabels = [
    'country'.i18n,
    'language'.i18n,
    'time_zone'.i18n,
    'currency'.i18n,
  ];

  final dropDownSelect = [
    'select_country'.i18n,
    'select_language'.i18n,
    'select_time_zone'.i18n,
    'select_currency'.i18n,
  ];

  final textFieldLabels = [
    'first_name'.i18n,
    'last_name'.i18n,
    'email'.i18n,
    'rabbitry_name'.i18n,
    'phone_number'.i18n,
    'address'.i18n,
    'state'.i18n,
    'zip_code'.i18n,
  ];

  final hintTexts = [
    'kevins',
    'Co',
    'example@gmail.com',
    'XYZ Rabbitry',
    '202 555 0111',
    'address'.i18n,
    'California',
    '231456',
  ];
  late final initialValue = [
    widget.user.name,
    'Co',
    widget.user.email,
    null,
    null,
    null,
    null,
    null,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: AppConstants.padding30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Center(
                    child: Skeleton.shade(
                      child: BreederImageWidget(
                        url: Assets.icons.logo.path,
                        color: context.cs.primary,
                        size: 100,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: textFieldLabels.length,
                    itemBuilder: (context, index) {
                      return MainTextField(
                        enabled: index != 2,
                        focusNode: focusNodes[index],
                        onChanged: onChanged[index],
                        onSubmitted: onSubmitted[index],
                        labelText: textFieldLabels[index],
                        initialValue: initialValue[index],
                        hintText: hintTexts[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 15);
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dropDownLabels[index],
                            style: context.tt.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: context.cs.surfaceContainerHighest,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          MainDropDownWidget<BreederByGenderModel>(
                            items: items[index],
                            text: dropDownSelect[index],
                            onChanged: onValueSelected[index],
                            selectedValue: selectedValue[index],
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10);
                    },
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'trials'.i18n,
                        style: context.tt.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: context.cs.surfaceContainerHighest,
                        ),
                      ),
                      Text(
                        widget.user.trials.toString(),
                        style: context.tt.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: context.cs.surfaceContainerHighest,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'account_creation_date'.i18n,
                        style: context.tt.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: context.cs.surfaceContainerHighest,
                        ),
                      ),
                      Text(
                        widget.user.registeredAt.formatMMddYYYY,
                        style: context.tt.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: context.cs.surfaceContainerHighest,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: AppConstants.paddingH16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BlocConsumer<ProfileCubit, GeneralProfileState>(
                      listener: (context, state) {
                        if (state is UpdateProfileSuccess) {
                          MainSnackBar.showSuccessMessageBar(
                            context,
                            "profile_updated".i18n,
                          );
                        } else if (state is UpdateProfileFail) {
                          MainSnackBar.showErrorMessageBar(
                            context,
                            state.message,
                          );
                        }
                      },
                      builder: (context, state) {
                        var onTap = onSave;
                        Widget? child;
                        if (state is UpdateProfileLoading) {
                          onTap = () {};
                          child = const LoadingIndicator();
                        }
                        return Skeleton.keep(
                          child: MainActionButton(
                            onTap: onTap,
                            text: "apply_changes".i18n,
                            child: child,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ],
      ),
    );
  }
}
