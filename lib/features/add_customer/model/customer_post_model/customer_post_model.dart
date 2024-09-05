import 'dart:convert';

import 'package:bunny_sync/features/add_customer/model/customer_types/customer_types.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'customer_post_model.g.dart';

@JsonSerializable()
@immutable
class CustomerPostModel {
  const CustomerPostModel({
    String? name,
    String? email,
    CustomerTypes? type,
    this.companyName,
    this.phone,
    this.note,
    this.street,
    this.city,
    this.country,
    this.state,
    this.zipCode,
  })  : _name = name,
        _email = email,
        _type = type;

  factory CustomerPostModel.fromJsonStr(String str) =>
      CustomerPostModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory CustomerPostModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerPostModelFromJson(json);

  final String? _name;

  final String? _email;

  final CustomerTypes? _type;

  @JsonKey(name: 'company_name')
  final String? companyName;

  final String? phone;

  final String? note;

  final String? street;

  final String? city;

  final String? country;

  final String? state;

  @JsonKey(name: 'zip_code')
  final String? zipCode;

  CustomerPostModel copyWith({
    String? Function()? name,
    String? Function()? email,
    CustomerTypes? Function()? type,
    String? Function()? companyName,
    String? Function()? phone,
    String? Function()? note,
    String? Function()? street,
    String? Function()? city,
    String? Function()? country,
    String? Function()? state,
    String? Function()? zipCode,
  }) {
    return CustomerPostModel(
      name: name != null ? name() : _name,
      email: email != null ? email() : _email,
      type: type != null ? type() : _type,
      companyName: companyName != null ? companyName() : this.companyName,
      phone: phone != null ? phone() : this.phone,
      note: note != null ? note() : this.note,
      street: street != null ? street() : this.street,
      city: city != null ? city() : this.city,
      country: country != null ? country() : this.country,
      state: state != null ? state() : this.state,
      zipCode: zipCode != null ? zipCode() : this.zipCode,
    );
  }

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

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$CustomerPostModelToJson(this);

  @JsonKey(name: 'contact_name')
  String get name {
    return _name ?? (throw "name can't be empty");
  }

  String get email {
    return _email ?? (throw "email can't be empty");
  }

  CustomerTypes get type {
    return _type ?? (throw "type can't be empty");
  }
}
