import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/authentication/bloc/authentication_bloc.dart';
import 'package:bunny_sync/features/sign_in/models/log_out_model/log_out_model.dart';
import 'package:bunny_sync/features/sign_in/models/post_sign_up_model/post_sign_up_model.dart';
import 'package:bunny_sync/features/sign_in/models/sign_in_model/sign_in_model.dart';
import 'package:bunny_sync/features/sign_in/models/sign_up_exception/sign_up_exception.dart';
import 'package:bunny_sync/features/sign_in/repo/sign_in_repo.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/localization/strings.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'states/general_sign_in_state.dart';

part 'states/sign_in_state.dart';

part 'states/text_field_state.dart';

@injectable
class SignInCubit extends Cubit<GeneralSignInState> {
  SignInCubit(
    this._signInRepo,
    this._authenticationBloc,
  ) : super(GeneralSignUpInitial());

  final SignInRepo _signInRepo;

  final AuthenticationBloc? _authenticationBloc;

  PostSignUpModel _postSignUpModel = const PostSignUpModel();

  void setFullName(String fullName) {
    _postSignUpModel = _postSignUpModel.copyWith(fullName: () => fullName);
    emit(TextFieldState(TextFieldType.fullName));
  }

  void setEmail(String email) {
    _postSignUpModel = _postSignUpModel.copyWith(email: () => email);
    emit(TextFieldState(TextFieldType.email));
  }

  void setPassword(String password) {
    _postSignUpModel = _postSignUpModel.copyWith(password: () => password);
    emit(TextFieldState(TextFieldType.password));
  }

  void setConfirmPassword(String confirmPassword) {
    _postSignUpModel =
        _postSignUpModel.copyWith(confirmPassword: () => confirmPassword);
    emit(TextFieldState(TextFieldType.confirmPassword));
  }

  Future<void> signIn({VoidCallback? onSuccess}) async {
    bool shouldReturn = false;

    final emailError = _postSignUpModel.validateEmail();
    if (emailError != null) {
      emit(TextFieldState(TextFieldType.email, error: emailError));
      shouldReturn = true;
    } else {
      emit(TextFieldState(TextFieldType.email));
    }

    final passwordError = _postSignUpModel.validatePassword();
    if (passwordError != null) {
      emit(TextFieldState(TextFieldType.password, error: passwordError));
      shouldReturn = true;
    } else {
      emit(TextFieldState(TextFieldType.password));
    }

    if (shouldReturn) {
      return;
    }

    emit(SignInLoading());

    try {
      final response = await _signInRepo.signIn(
        _postSignUpModel.email,
        _postSignUpModel.password,
      );
      emit(SignInSuccess(response.data));

      _authenticationBloc?.add(
        SignInRequested(
          response.data,
          onSuccess: onSuccess,
        ),
      );
    } catch (e) {
      emit(SignInError(Strings.wentWrong.i18n));
    }
  }

  Future<void> signUp({VoidCallback? onSuccess}) async {
    bool shouldReturn = false;

    final fullNameError = _postSignUpModel.validateFullName();
    if (fullNameError != null) {
      emit(TextFieldState(TextFieldType.fullName, error: fullNameError));
      shouldReturn = true;
    } else {
      emit(TextFieldState(TextFieldType.fullName));
    }

    final emailError = _postSignUpModel.validateEmail();
    if (emailError != null) {
      emit(TextFieldState(TextFieldType.email, error: emailError));
      shouldReturn = true;
    } else {
      emit(TextFieldState(TextFieldType.email));
    }

    final passwordError = _postSignUpModel.validatePassword();
    if (passwordError != null) {
      emit(TextFieldState(TextFieldType.password, error: passwordError));
      shouldReturn = true;
    } else {
      emit(TextFieldState(TextFieldType.password));
    }

    final confirmPasswordError = _postSignUpModel.validateConfirmPassword();
    if (confirmPasswordError != null) {
      emit(
        TextFieldState(
          TextFieldType.confirmPassword,
          error: confirmPasswordError,
        ),
      );
      shouldReturn = true;
    } else {
      emit(TextFieldState(TextFieldType.confirmPassword));
    }

    if (shouldReturn) {
      return;
    }

    emit(SignInLoading());

    try {
      final response = await _signInRepo.signUp(_postSignUpModel);
      emit(SignUpSuccess(response.data));
      _authenticationBloc?.add(
        SignInRequested(
          response.data,
          onSuccess: onSuccess,
        ),
      );
    } catch (e, stackTrace) {
      addError(e, stackTrace);
      if (e is SignUpException) {
        final emailErrors = e.errors[TextFieldType.email];
        if (emailErrors != null && emailErrors.isNotEmpty) {
          emit(
            TextFieldState(
              TextFieldType.email,
              error: emailErrors.join('\n'),
            ),
          );
        }
      } else {
        emit(SignInError(Strings.wentWrong.i18n));
      }
    }
  }

  void resetFullName() {
    _postSignUpModel = _postSignUpModel.copyWith(fullName: () => null);
    emit(TextFieldState(TextFieldType.fullName));
  }

  void resetConfirmPassword() {
    _postSignUpModel = _postSignUpModel.copyWith(confirmPassword: () => null);
    emit(TextFieldState(TextFieldType.confirmPassword));
  }

  Future<void>logout({VoidCallback? onSuccess}) async{
    emit(SignInLoading());

    try {
      final response = await _signInRepo.logout();
      emit(LogOutSuccess(response.data));
      _authenticationBloc?.add(
        SignOutRequested(),
      );
    } catch (e) {
      emit(SignInError(Strings.wentWrong.i18n));
    }
  }
}
