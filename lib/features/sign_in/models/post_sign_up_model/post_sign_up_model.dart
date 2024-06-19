import 'dart:convert';

import 'package:bunny_sync/global/extensions/string_x.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/localization/strings.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:email_validator/email_validator.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'post_sign_up_model.g.dart';

@JsonSerializable()
@CopyWith(skipFields: true, copyWithNull: true)
@immutable
class PostSignUpModel {
  const PostSignUpModel({
    this.fullName,
    this.email,
    this.password,
    this.confirmPassword,
  });

  factory PostSignUpModel.fromJsonStr(String str) =>
      PostSignUpModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory PostSignUpModel.fromJson(Map<String, dynamic> json) =>
      _$PostSignUpModelFromJson(json);

  @JsonKey(name: 'name')
  final String? fullName;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'password')
  final String? password;

  @JsonKey(name: 'c_password')
  final String? confirmPassword;

  Map<String, dynamic> toJson() => _$PostSignUpModelToJson(this);

  String? validateFullName() {
    if (fullName.isNullOrEmpty) {
      return 'full_name_empty'.i18n;
    }
    return null;
  }

  String? validateEmail() {
    if (email.isNullOrEmpty) {
      return Strings.emailEmpty;
    }

    if (email != null && !EmailValidator.validate(email!)) {
      return Strings.emailInvalid;
    }

    return null;
  }

  String? validatePassword() {
    if (password.isNullOrEmpty) {
      return Strings.passwordEmpty;
    }

    final length = password?.length;
    if (length != null && length < 8) {
      return Strings.password8Chars;
    }

    return null;
  }

  String? validateConfirmPassword() {
    final password = this.password;

    if (confirmPassword.isNullOrEmpty) {
      return Strings.confirmPasswordEmpty;
    }

    if (password.isNullOrEmpty) {
      return null;
    }

    if (password != confirmPassword) {
      return Strings.passwordsNotMatch;
    }

    return null;
  }
}
