part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class IsAuthenticatedOrFirstTime extends AuthenticationEvent {}

class ShowSignIn extends AuthenticationEvent {
  const ShowSignIn({
    this.showBackButton = false,
    this.onSignedIn,
  });

  final bool showBackButton;
  final VoidCallback? onSignedIn;
}

class SignInRequested extends AuthenticationEvent {
  const SignInRequested(
    this.signInModel, {
    this.onSuccess,
  });

  final SignInModel signInModel;
  final VoidCallback? onSuccess;
}

class SignOutRequested extends AuthenticationEvent {}

class GuestRequested extends AuthenticationEvent {}

class VerifyRequested extends AuthenticationEvent {
  const VerifyRequested(this.email, this.message);

  final String email;
  final String message;
}

class ForgetPasswordRequested extends AuthenticationEvent {
  const ForgetPasswordRequested();
}
