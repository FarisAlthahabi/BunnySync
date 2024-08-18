import 'dart:convert';

import 'package:bunny_sync/features/add_customer/model/customer_types/customer_types.dart';
import 'package:bunny_sync/global/utils/json_converters/date_time_nullable_converter.dart';
import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'customer_model.g.dart';

@JsonSerializable()
@immutable
class CustomerModel implements BottomSheetItemModel {
  const CustomerModel({
    required this.id,
    required this.userId,
    required this.type,
    required this.name,
    required this.email,
    this.status,
    this.companyName,
    this.phone,
    this.createdAt,
    this.updatedAt,
    this.date,
    this.street,
    this.city,
    this.country,
    this.zipCode,
    this.note,
    this.dtRowIndex,
    this.state,
  });

  factory CustomerModel.fromJsonStr(String str) =>
      CustomerModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);

  final int id;

  @JsonKey(name: 'user_id')
  final int userId;

  @JsonKey(fromJson: CustomerTypes.fromJson)
  final CustomerTypes type;

  final String name;

  final String email;

  final String? status;

  @JsonKey(name: 'company_name')
  final String? companyName;

  final String? phone;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @DateTimeNullableConverter()
  final DateTime? date;

  final String? street;

  final String? city;

  final String? country;

  @JsonKey(name: 'zip_code')
  final String? zipCode;

  final String? note;

  @JsonKey(name: 'DT_RowIndex')
  final int? dtRowIndex;

  final String? state;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);
}
