import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'save_sell_model.g.dart';

@JsonSerializable()
@immutable
class SaveSellModel {
  const SaveSellModel({
    double? price,
    int? customerId,
    DateTime? date,
  })  : _price = price,
        _customerId = customerId,
        _date = date;

  factory SaveSellModel.fromJsonStr(String str) =>
      SaveSellModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory SaveSellModel.fromJson(Map<String, dynamic> json) =>
      _$SaveSellModelFromJson(json);

  final double? _price;
  final int? _customerId;
  final DateTime? _date;

  SaveSellModel copyWith({
    double? Function()? price,
    int? Function()? customerId,
    DateTime? Function()? date,
  }) {
    return SaveSellModel(
      price: price != null ? price() : _price,
      customerId: customerId != null ? customerId() : _customerId,
      date: date != null ? date() : _date,
    );
  }

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$SaveSellModelToJson(this);

  double get price {
    return _price == null || _price.toString().isEmpty
        ? (throw Exception("Price can't be empty"))
        : _price;
  }

  @JsonKey(name: 'customer')
  int get customerId {
    return _customerId ?? (throw Exception("Customer can't be empty"));
  }

  DateTime get date {
    return _date ?? (throw Exception("Date can't be empty"));
  }
}
