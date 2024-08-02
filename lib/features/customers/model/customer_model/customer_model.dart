import 'dart:convert';

import 'package:bunny_sync/global/utils/json_converters/date_parser.dart';
import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'customer_model.g.dart';

@JsonSerializable()
@immutable
class CustomerModel implements BottomSheetItemModel{
  const CustomerModel({
    required this.id,
    required this.userId,
    required this.status,
    required this.email,
    required this.name,
    required this.type,
    required this.companyName,
    required this.phone,
    required this.note,
    required this.street,
    required this.city,
    required this.country,
    required this.state,
    required this.zipCode,
    required this.createdAt,
    required this.updatedAt,
    required this.date,
    required this.dtRowIndex,
  });

  factory CustomerModel.fromJsonStr(String str) =>
      CustomerModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);

  final int id;

  @JsonKey(name: 'user_id')
  final int userId;

  final String status;

  final String email;

  final String name;

  final String type;

  @JsonKey(name: 'company_name')
  final String companyName;

  final String phone;

  final String note;

  final String street;

  final String city;

  final String country;

  final String state;

  @JsonKey(name: 'zip_code')
  final String zipCode;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @DateParser()
  final DateTime? date;

  @JsonKey(name: 'DT_RowIndex')
  final int? dtRowIndex;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);
}
