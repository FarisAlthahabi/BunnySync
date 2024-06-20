import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/authentication/bloc/authentication_bloc.dart';
import 'package:bunny_sync/features/sign_in/cubit/sign_in_cubit.dart';
import 'package:bunny_sync/features/sign_in/view/widgets/agree_terms_widget.dart';
import 'package:bunny_sync/features/sign_in/view/widgets/social_login_option_widget.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/gen/assets.gen.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/router/router.dart';
import 'package:bunny_sync/global/theme/theme_x.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/bunny_logo.dart';
import 'package:bunny_sync/global/widgets/buttons/main_action_button.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:bunny_sync/global/widgets/main_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class SignInViewCallback {
  void onBackButton();

  void onFullNameChanged(String fullName);

  void onFullNameSubmitted(String fullName);

  void onEmailChanged(String email);

  void onEmailSubmitted(String email);

  void onPasswordChanged(String password);

  void onPasswordSubmitted(String password);

  void onConfirmPasswordChanged(String confirmPassword);

  void onConfirmPasswordSubmitted(String confirmPassword);

  void onForgotPassword();

  void onMainAction();

  void onAlterOption();

  void onSignInError(String message);

  void onSignUp();
}

@RoutePage()
class SignInView extends StatelessWidget {
  const SignInView({
    super.key,
    this.onSignedIn,
  });

  final VoidCallback? onSignedIn;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get<SignInCubit>(),
      child: SignInPage(
        onSignedIn: onSignedIn,
      ),
    );
  }
}

class SignInPage extends StatefulWidget {
  const SignInPage({
    super.key,
    this.onSignedIn,
  });

  final VoidCallback? onSignedIn;

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> implements SignInViewCallback {
  late final AuthenticationBloc authenticationBloc = context.read();

  late final SignInCubit signInCubit = context.read();

  final fullNameFocusNode = FocusNode();

  final emailFocusNode = FocusNode();

  final passwordFocusNode = FocusNode();

  final confirmPasswordFocusNode = FocusNode();

  bool showSignInOrUp = true;

  @override
  void dispose() {
    fullNameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();

    super.dispose();
  }

  @override
  void onBackButton() {
    authenticationBloc.add(GuestRequested());
  }

  @override
  void onFullNameChanged(String fullName) {
    signInCubit.setFullName(fullName);
  }

  @override
  void onFullNameSubmitted(String fullName) {
    emailFocusNode.requestFocus();
  }

  @override
  void onEmailChanged(String email) {
    signInCubit.setEmail(email);
  }

  @override
  void onEmailSubmitted(String email) {
    passwordFocusNode.requestFocus();
  }

  @override
  void onPasswordChanged(String password) {
    signInCubit.setPassword(password);
  }

  @override
  void onPasswordSubmitted(String password) {
    if (showSignInOrUp) {
      onMainAction();
    }
  }

  @override
  void onConfirmPasswordChanged(String confirmPassword) {
    signInCubit.setConfirmPassword(confirmPassword);
  }

  @override
  void onConfirmPasswordSubmitted(String confirmPassword) {
    onMainAction();
  }

  @override
  void onForgotPassword() {
  }

  @override
  void onMainAction() {
    context.router.push(const DashboardRoute());
  }

  @override
  void onAlterOption() {
    setState(() {
      showSignInOrUp = !showSignInOrUp;
    });

    if (showSignInOrUp) {
      signInCubit.resetFullName();
      signInCubit.resetConfirmPassword();
    }
  }

  @override
  void onSignInError(String message) {
    MainSnackBar.showErrorBar(
      context: context,
      content: Text(message),
    );
  }

  @override
  void onSignUp() {
    setState(() {
      showSignInOrUp = !showSignInOrUp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: AppConstants.paddingHorizontal28,
            child: SizedBox(
              height: 1.sh,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const BunnyLogo(),
                  const SizedBox(height: 17),
                  AnimatedHeightAndFade(
                    child: showSignInOrUp
                        ? Column(
                            key: ValueKey(showSignInOrUp),
                            children: [
                              Text(
                                'hello_again'.i18n,
                                style: context.tt.displayLarge,
                              ),
                              Text(
                                'log_into_your_account'.i18n,
                                style: context.tt.labelLarge,
                              ),
                            ],
                          )
                        : Column(
                            key: ValueKey(showSignInOrUp),
                            children: [
                              Text(
                                'nice_to_see_you'.i18n,
                                style: context.tt.displayLarge,
                              ),
                              Text(
                                'create_account'.i18n,
                                style: context.tt.labelLarge,
                              ),
                            ],
                          ),
                  ),
                  const SizedBox(height: 56),
                  AnimatedHeightAndFade.showHide(
                    show: !showSignInOrUp,
                    child: Column(
                      children: [
                        AppTextField(
                          onChanged: onFullNameChanged,
                          onSubmitted: onFullNameSubmitted,
                          prefixIcon: Assets.icons.profile.svg(),
                          hintText: 'full_name'.i18n,
                        ),
                        const SizedBox(height: 25),
                      ],
                    ),
                  ),
                  AppTextField(
                    onChanged: onEmailChanged,
                    onSubmitted: onEmailSubmitted,
                    focusNode: emailFocusNode,
                    prefixIcon: Assets.icons.mail.svg(),
                    hintText: 'enter_email'.i18n,
                  ),
                  const SizedBox(height: 25),
                  AppTextField(
                    onChanged: onPasswordChanged,
                    onSubmitted: onPasswordSubmitted,
                    focusNode: passwordFocusNode,
                    prefixIcon: Assets.icons.lock.svg(),
                    hintText: 'enter_password'.i18n,
                    isPassword: true,
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: TextButton(
                      onPressed: onForgotPassword,
                      child: Text('forget_password_question'.i18n),
                    ),
                  ),
                  AnimatedHeightAndFade(
                    child: showSignInOrUp
                        ? const SizedBox(height: 20)
                        : const Column(
                            children: [
                              SizedBox(height: 8),
                              AgreeTermsWidget(),
                            ],
                          ),
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: MainActionButton(
                      text: 'continue'.i18n,
                      onTap: onMainAction,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: context.cs.onTertiaryFixedVariant,
                        ),
                      ),
                      Padding(
                        padding: AppConstants.paddingHorizontal16,
                        child: Text('or'.i18n),
                      ),
                      Expanded(
                        child: Divider(
                          color: context.cs.onTertiaryFixedVariant,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SocialLoginOptionWidget(
                        color: const Color.fromRGBO(219, 68, 55, 1),
                        onTap: onAlterOption,
                        icon: Assets.icons.google.path,
                      ),
                      const SizedBox(width: 14),
                      SocialLoginOptionWidget(
                        color: const Color.fromRGBO(24, 119, 242, 1),
                        onTap: onAlterOption,
                        icon: Assets.icons.facebook.path,
                      ),
                      const SizedBox(width: 14),
                      SocialLoginOptionWidget(
                        color: const Color.fromRGBO(23, 26, 31, 1),
                        onTap: onAlterOption,
                        icon: Assets.icons.apple.path,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: onSignUp,
                    child: Text(
                      showSignInOrUp ? 'sign_up'.i18n : 'sign_in'.i18n,
                      style: context.tt.labelMedium?.copyWith(
                        color: context.cs.onSurfaceVariant,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
