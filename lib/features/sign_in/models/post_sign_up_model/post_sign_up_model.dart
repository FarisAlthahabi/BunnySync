import 'dart:convert';

import 'package:bunny_sync/global/extensions/string_x.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/localization/strings.dart';
import 'package:email_validator/email_validator.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'post_sign_up_model.g.dart';

@JsonSerializable()
@immutable
class PostSignUpModel {
  const PostSignUpModel({
    String? fullName,
    String? email,
    String? password,
    String? confirmPassword,
  })  : _fullName = fullName,
        _confirmPassword = confirmPassword,
        _password = password,
        _email = email;

  factory PostSignUpModel.fromJsonStr(String str) =>
      PostSignUpModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory PostSignUpModel.fromJson(Map<String, dynamic> json) =>
      _$PostSignUpModelFromJson(json);

  @JsonKey(name: 'name')
  final String? _fullName;

  @JsonKey(name: 'email')
  final String? _email;

  @JsonKey(name: 'password')
  final String? _password;

  @JsonKey(name: 'c_password')
  final String? _confirmPassword;

  Map<String, dynamic> toJson() => _$PostSignUpModelToJson(this);

  String? validateFullName() {
    if (_fullName.isNullOrEmpty) {
      return 'full_name_empty'.i18n;
    }
    return null;
  }

  String? validateEmail() {
    if (_email.isNullOrEmpty) {
      return Strings.emailEmpty;
    }

    if (_email != null && !EmailValidator.validate(_email)) {
      return Strings.emailInvalid;
    }

    return null;
  }

  String? validatePassword() {
    if (_password.isNullOrEmpty) {
      return Strings.passwordEmpty;
    }

    final length = _password?.length;
    if (length != null && length < 8) {
      return Strings.password8Chars;
    }

    return null;
  }

  String? validateConfirmPassword() {
    final password = _password;

    if (_confirmPassword.isNullOrEmpty) {
      return Strings.confirmPasswordEmpty;
    }

    if (password.isNullOrEmpty) {
      return null;
    }

    if (password != _confirmPassword) {
      return Strings.passwordsNotMatch;
    }

    return null;
  }

  PostSignUpModel copyWith({
    String? Function()? fullName,
    String? Function()? email,
    String? Function()? password,
    String? Function()? confirmPassword,
  }) {
    return PostSignUpModel(
      fullName: fullName != null ? fullName() : _fullName,
      email: email != null ? email() : _email,
      password: password != null ? password() : _password,
      confirmPassword:
          confirmPassword != null ? confirmPassword() : _confirmPassword,
    );
  }

  String get fullName {
    return _fullName ?? (throw Exception('fullName is null'));
  }

  String get email {
    return _email ?? (throw Exception('email is null'));
  }

  String get password {
    return _password ?? (throw Exception('password is null'));
  }

  String get confirmPassword {
    return _confirmPassword ?? (throw Exception('confirmPassword is null'));
  }
}
