import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/authentication/bloc/authentication_bloc.dart';
import 'package:bunny_sync/features/sign_in/cubit/sign_in_cubit.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/widgets/app_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
}

@RoutePage()
class SignInView extends StatelessWidget {
  const SignInView({
    super.key,
    required this.showBackButton,
    this.onSignedIn,
  });

  final bool showBackButton;
  final VoidCallback? onSignedIn;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get<SignInCubit>(),
      child: SignInPage(
        showBackButton: showBackButton,
        onSignedIn: onSignedIn,
      ),
    );
  }
}

class SignInPage extends StatefulWidget {
  const SignInPage({
    super.key,
    required this.showBackButton,
    this.onSignedIn,
  });

  final bool showBackButton;
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

  bool showSignIn = true;

  bool showSignUp = false;

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
    if (showSignIn) {
      onMainAction();
    } else if (showSignUp) {
      confirmPasswordFocusNode.requestFocus();
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
    if (showSignIn) {
      signInCubit.signIn(onSuccess: widget.onSignedIn);
    } else if (showSignUp) {
      signInCubit.signUp(onSuccess: widget.onSignedIn);
    }
  }

  @override
  void onAlterOption() {
    setState(() {
      showSignIn = !showSignIn;
      showSignUp = !showSignUp;
    });

    if (showSignIn) {
      signInCubit.resetFullName();
      signInCubit.resetConfirmPassword();
    } else if (showSignUp) {
    }
  }

  @override
  void onSignInError(String message) {
    AppSnackBar.showErrorBar(
      context: context,
      content: Text(message),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Center();
  }
}
