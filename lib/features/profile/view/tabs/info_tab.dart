import 'package:bunny_sync/features/profile/cubit/profile_cubit.dart';
import 'package:bunny_sync/features/profile/model/profile_types/profile_types.dart';
import 'package:bunny_sync/features/profile/model/user_model/user_model.dart';
import 'package:bunny_sync/global/extensions/date_time_x.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/buttons/main_action_button.dart';
import 'package:bunny_sync/global/widgets/images/profile_placeholder_widget.dart';
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

  void onPhoneNumberChanged(String phoneNumber);

  void onAddressChanged(String address);

  void onCityChanged(String city);

  void onStateChanged(String state);

  void onSearchChanged(String search);

  void onFirstNameSubmitted(String firstName);

  void onLastNameSubmitted(String lastName);

  void onPhoneNumberSubmitted(String phoneNumber);

  void onAddressSubmitted(String address);

  void onCitySubmitted(String city);

  void onStateSubmitted(String state);

  void onSearchSubmitted(String search);

  void onTypeSelected(ProfileTypes? type);
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
    7,
    (index) => FocusNode(),
  );
  final searchFocusNode = FocusNode();

  @override
  void initState() {
    profileCubit.setFirstName(widget.user.name);
    profileCubit.setLastName('Co');
    super.initState();
  }

  @override
  void onAddressChanged(String address) {
    profileCubit.setAddress(address);
  }

  @override
  void onAddressSubmitted(String address) {
    focusNodes[4].requestFocus();
  }

  @override
  void onFirstNameChanged(String firstName) {
    profileCubit.setFirstName(firstName);
  }

  @override
  void onFirstNameSubmitted(String firstName) {
    focusNodes[1].requestFocus();
  }

  @override
  void onLastNameChanged(String lastName) {
    profileCubit.setLastName(lastName);
  }

  @override
  void onLastNameSubmitted(String lastName) {
    focusNodes[3].requestFocus();
  }

  @override
  void onPhoneNumberChanged(String phoneNumber) {
    profileCubit.setPhoneNumber(phoneNumber);
  }

  @override
  void onPhoneNumberSubmitted(String phoneNumber) {
    focusNodes[5].requestFocus();
  }

  @override
  void onCityChanged(String city) {
    profileCubit.setCity(city);
  }

  @override
  void onCitySubmitted(String city) {
    focusNodes[6].requestFocus();
  }

  @override
  void onStateChanged(String state) {
    profileCubit.setState(state);
  }

  @override
  void onStateSubmitted(String state) {
    searchFocusNode.requestFocus();
  }

  @override
  void onSearchChanged(String search) {
    profileCubit.setSearch(search);
  }

  @override
  void onSearchSubmitted(String search) {
    searchFocusNode.unfocus();
  }

  @override
  void onTypeSelected(ProfileTypes? type) {
    profileCubit.setType(type);
  }

  @override
  void onSave() {
    profileCubit.updateProfileInfo();
  }

  late final onChanged = [
    onFirstNameChanged,
    onLastNameChanged,
    null,
    onAddressChanged,
    onPhoneNumberChanged,
    onCityChanged,
    onStateChanged,
  ];

  late final onSubmitted = [
    onFirstNameSubmitted,
    onLastNameSubmitted,
    null,
    onAddressSubmitted,
    onPhoneNumberSubmitted,
    onCitySubmitted,
    onStateSubmitted,
  ];

  final textFieldLabels = [
    'first_name'.i18n,
    'last_name'.i18n,
    'email'.i18n,
    'address'.i18n,
    'phone_number'.i18n,
    'city'.i18n,
    'state'.i18n,
  ];

  final hintTexts = [
    'kevins',
    'Co',
    'example@gmail.com',
    'address'.i18n,
    '202 555 0111',
    'New York',
    'California',
  ];
  late final initialValue = [
    widget.user.name,
    'Co',
    widget.user.email,
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
                  const Center(
                    child: Skeleton.shade(
                      child: ProfilePlaceholderWidget(
                        padding: 20,
                        imageSize: 80,
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
                  Text(
                    'types'.i18n,
                    style: context.tt.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: context.cs.surfaceContainerHighest,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  BlocBuilder<ProfileCubit, GeneralProfileState>(
                    buildWhen: (previous, current) =>
                        current is SetSelectedTypeState,
                    builder: (context, state) {
                      return MainDropDownWidget<ProfileTypes>(
                        items: ProfileTypes.values,
                        text: 'select_type'.i18n,
                        onChanged: onTypeSelected,
                        selectedValue:
                            state is SetSelectedTypeState ? state.status : null,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  MainTextField(
                    focusNode: searchFocusNode,
                    onChanged: onSearchChanged,
                    onSubmitted: onSearchSubmitted,
                    labelText: 'search'.i18n,
                    hintText: 'my_friends'.i18n,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
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
