part of '../sign_in_cubit.dart';

class TextFieldState extends GeneralSignInState {
  TextFieldState(this.type, {this.error});

  final TextFieldType type;
  final String? error;
}

enum TextFieldType {
  fullName,
  email,
  password,
  confirmPassword,
}
