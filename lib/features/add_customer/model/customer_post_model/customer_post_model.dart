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
    String? companyName,
    String? phone,
    String? note,
    String? street,
    String? city,
    String? country,
    String? state,
    String? zipCode,
  })  : _name = name,
        _email = email,
        _type = type,
        _companyName = companyName,
        _phone = phone,
        _note = note,
        _street = street,
        _city = city,
        _country = country,
        _state = state,
        _zipCode = zipCode;

  factory CustomerPostModel.fromJsonStr(String str) =>
      CustomerPostModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory CustomerPostModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerPostModelFromJson(json);

  final String? _name;

  final String? _email;

  final CustomerTypes? _type;

  final String? _companyName;

  final String? _phone;

  final String? _note;

  final String? _street;

  final String? _city;

  final String? _country;

  final String? _state;

  final String? _zipCode;

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
      companyName: companyName != null ? companyName() : _companyName,
      phone: phone != null ? phone() : _phone,
      note: note != null ? note() : _note,
      street: street != null ? street() : _street,
      city: city != null ? city() : _city,
      country: country != null ? country() : _country,
      state: state != null ? state() : _state,
      zipCode: zipCode != null ? zipCode() : _zipCode,
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
    return _name ?? (throw Exception('name is null'));
  }

  String get email {
    return _email ?? (throw Exception('email is null'));
  }

  CustomerTypes get type {
    return _type ?? (throw 'type is null');
  }

  @JsonKey(name: 'company_name')
  String get companyName {
    if (_companyName == null || _companyName.isEmpty) {
      return 'unknown'.i18n;
    } else {
      return _companyName;
    }
  }

  String get phone {
    if (_phone == null || _phone.isEmpty) {
      return 'unknown'.i18n;
    } else {
      return _phone;
    }
  }

  String get note {
    if (_note == null || _note.isEmpty) {
      return 'there_is_no_note'.i18n;
    } else {
      return _note;
    }
  }

  String get street {
    if (_street == null || _street.isEmpty) {
      return 'unknown'.i18n;
    } else {
      return _street;
    }
  }

  String get city {
    if (_city == null || _city.isEmpty) {
      return 'unknown'.i18n;
    } else {
      return _city;
    }
  }

  String get country {
    if (_country == null || _country.isEmpty) {
      return 'unknown'.i18n;
    } else {
      return _country;
    }
  }

  String get state {
    if (_state == null || _state.isEmpty) {
      return 'unknown'.i18n;
    } else {
      return _state;
    }
  }

  @JsonKey(name: 'zip_code')
  String get zipCode {
    if (_zipCode == null || _zipCode.isEmpty) {
      return 'unknown'.i18n;
    } else {
      return _zipCode;
    }
  }
}
