import 'dart:convert';

import 'package:bunny_sync/global/localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'customer_post_model.g.dart';

@JsonSerializable()
@immutable
class CustomerPostModel {
  const CustomerPostModel({
    String? email,
    String? name,
    String? type,
    String? companyName,
    String? phone,
    String? note,
    String? street,
    String? city,
    String? country,
    String? state,
    String? zipCode,
  })  : _email = email,
        _name = name,
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

  final String? _email;

  final String? _name;

  final String? _type;

  final String? _companyName;

  final String? _phone;

  final String? _note;

  final String? _street;

  final String? _city;

  final String? _country;

  final String? _state;

  final String? _zipCode;

   CustomerPostModel copyWith({
    String? Function()? email,
    String? Function()? name,
    String? Function()? type,
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
      email: email != null ? email() : _email,
      name: name != null ? name() : _name,
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

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$CustomerPostModelToJson(this);

  String get email {
    return _email ?? (throw Exception('email is null'));
  }

  @JsonKey(name: 'contact_name')
  String get name {
    return _name ?? (throw Exception('name is null'));
  }

  String get type {
    return _type ?? 'unknown'.i18n;
  }

  @JsonKey(name: 'company_name')
   String get companyName {
    return _companyName ?? 'unknown'.i18n;
  }

   String get phone {
    return _phone ?? 'unknown'.i18n;
  }

   String get note {
    return _note ?? 'there_is_no_note'.i18n;
  }

   String get street {
    return _street ?? 'unknown'.i18n;
  }

   String get city {
    return _city ?? 'unknown'.i18n;
  }

   String get country {
    return _country ?? 'unknown'.i18n;
  }

   String get state {
    return _state ?? 'unknown'.i18n;
  }

  @JsonKey(name: 'zip_code')
   String get zipCode {
    return _type ?? 'unknown'.i18n;
  }

}
