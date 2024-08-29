import 'dart:convert';

import 'package:bunny_sync/features/add_customer/model/customer_types/customer_types.dart';
import 'package:bunny_sync/features/status/models/statusable_model.dart';
import 'package:bunny_sync/features/tasks/models/task_status_types/task_status_types.dart';
import 'package:bunny_sync/global/utils/enums/http_methods.dart';
import 'package:bunny_sync/global/utils/enums/statusable_entity_types.dart';
import 'package:bunny_sync/global/utils/json_converters/date_time_nullable_converter.dart';
import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'customer_model.g.dart';

@JsonSerializable()
@immutable
class CustomerModel
    implements BottomSheetItemModel, DropDownItemModel, StatusableModel {
  const CustomerModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.email,
    this.type,
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
  }) : entityType = StatusableEntityTypes.customer;

  factory CustomerModel.fromJsonStr(String str) =>
      CustomerModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);

  @override
  final StatusableEntityTypes entityType;

  @override
  final int id;

  @JsonKey(name: 'user_id')
  final int userId;

  @JsonKey(fromJson: CustomerTypes.fromJson)
  final CustomerTypes? type;

  final String name;

  final String email;

  @override
  final StatusTypes? status;

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

  @override
  String get displayName => name;

  @override
  String get httpEndpoint => 'finance/customer/$id/change-status/';

  @override
  HttpMethods get httpMethod => HttpMethods.get;

  @override
  StatusableModel copyWithStatus({StatusTypes? status}) {
    return CustomerModel(
      email: email,
      id: id,
      name: name,
      type: type,
      userId: userId,
      city: city,
      companyName: companyName,
      country: country,
      createdAt: createdAt,
      date: date,
      dtRowIndex: dtRowIndex,
      note: note,
      phone: phone,
      state: state,
      status: status ?? this.status,
      street: street,
      updatedAt: updatedAt,
      zipCode: zipCode,
    );
  }
}
