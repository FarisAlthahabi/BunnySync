import 'package:bunny_sync/features/profile/cubit/profile_cubit.dart';
import 'package:bunny_sync/features/profile/model/user_model/user_model.dart';
import 'package:bunny_sync/global/extensions/date_time_x.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/buttons/main_action_button.dart';
import 'package:bunny_sync/global/widgets/images/profile_placeholder_widget.dart';
import 'package:bunny_sync/global/widgets/loading_indicator.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:bunny_sync/global/widgets/main_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class InfoTabCallBacks {
  void onSave();

  void onFirstNameChanged(String firstName);

  void onFirstNameSubmitted(String firstName);
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
    2,
    (index) => FocusNode(),
  );

  @override
  void initState() {
    super.initState();

    profileCubit.setFirstName(widget.user.name);
  }

  @override
  void dispose() {
    for (final node in focusNodes) {
      node.dispose();
    }

    super.dispose();
  }


  @override
  void onFirstNameChanged(String firstName) {
    profileCubit.setFirstName(firstName);
  }

  @override
  void onFirstNameSubmitted(String firstName) {
    focusNodes[0].unfocus();
  }


  @override
  void onSave() {
    profileCubit.updateProfileInfo();
  }

  late final onChanged = [
    onFirstNameChanged,
    null,
  ];

  late final onSubmitted = [
    onFirstNameSubmitted,
    null,
  ];

  final textFieldLabels = [
    'full_name'.i18n,
    'email'.i18n,
  ];

  final hintTexts = [
    'kevins',
    'example@gmail.com',
  ];

  late final initialValue = [
    widget.user.name,
    widget.user.email,
  ];

  final readOnly = [
    false,
    true,
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
                        focusNode: focusNodes[index],
                        onChanged: onChanged[index],
                        onSubmitted: onSubmitted[index],
                        labelText: textFieldLabels[index],
                        initialValue: initialValue[index],
                        hintText: hintTexts[index],
                        readOnly: readOnly[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 15);
                    },
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
