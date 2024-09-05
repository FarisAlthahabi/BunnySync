import 'dart:convert';

import 'package:bunny_sync/global/localization/localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'customer_quick_post_model.g.dart';

@JsonSerializable()
@immutable
class CustomerQuickPostModel {
  const CustomerQuickPostModel({
    String? name,
    String? email,
  })  : _name = name,
        _email = email;

  factory CustomerQuickPostModel.fromJsonStr(String str) =>
      CustomerQuickPostModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory CustomerQuickPostModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerQuickPostModelFromJson(json);

      String? validateName() {
    if (_name == null || _name.isEmpty) {
      return 'name_empty'.i18n;
    }
    return null;
  }

  String? validateEmail() {
    if (_email == null) {
      return 'email_empty'.i18n;
    } else if (!EmailValidator.validate(_email)) {
      return 'email_invalid'.i18n;
    }
    return null;
  }


  final String? _name;

  final String? _email;

  CustomerQuickPostModel copyWith({
    String? Function()? name,
    String? Function()? email,
  }) {
    return CustomerQuickPostModel(
      name: name != null ? name() : _name,
      email: email != null ? email() : _email,
    );
  }

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$CustomerQuickPostModelToJson(this);

  String get name {
    return _name == null || _name.isEmpty
        ? (throw "Name can't be empty")
        : _name;
  }

  String get email {
    return _email == null || _email.isEmpty
        ? (throw "Email can't be empty")
        : _email;
  }
}
