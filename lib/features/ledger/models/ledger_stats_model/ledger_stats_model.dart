import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ledger_stats_model.g.dart';

@JsonSerializable()
@immutable
class LedgerStatsModel {
  const LedgerStatsModel({
    this.income = 0,
    this.expenses = 0,
    this.incomeByBreeder = 0,
    this.expensesByBreeder = 0,
  });

  factory LedgerStatsModel.fromJsonStr(String str) =>
      LedgerStatsModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory LedgerStatsModel.fromJson(Map<String, dynamic> json) =>
      _$LedgerStatsModelFromJson(json);

  @JsonKey(defaultValue: 0)
  final double income;

  @JsonKey(defaultValue: 0)
  final double expenses;

  @JsonKey(name: 'incomeBreeder', defaultValue: 0)
  final double incomeByBreeder;

  @JsonKey(name: 'expensesBreeder', defaultValue: 0)
  final double expensesByBreeder;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$LedgerStatsModelToJson(this);
}
