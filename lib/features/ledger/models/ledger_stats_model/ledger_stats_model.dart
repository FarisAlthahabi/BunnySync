import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ledger_stats_model.g.dart';

@JsonSerializable()
@immutable
class LedgerStatsModel {
  const LedgerStatsModel({
    required this.income,
    required this.expenses,
    required this.incomeByBreeder,
    required this.expensesByBreeder,
  });

  factory LedgerStatsModel.fromJsonStr(String str) =>
      LedgerStatsModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory LedgerStatsModel.fromJson(Map<String, dynamic> json) =>
      _$LedgerStatsModelFromJson(json);

  final double income;

  final double expenses;

  @JsonKey(name: 'incomeBreeder')
  final double incomeByBreeder;

  @JsonKey(name: 'expensesBreeder')
  final double expensesByBreeder;

   String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$LedgerStatsModelToJson(this);
}
