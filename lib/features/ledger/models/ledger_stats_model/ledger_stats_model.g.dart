// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ledger_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LedgerStatsModel _$LedgerStatsModelFromJson(Map<String, dynamic> json) =>
    LedgerStatsModel(
      income: (json['income'] as num?)?.toDouble() ?? 0,
      expenses: (json['expenses'] as num?)?.toDouble() ?? 0,
      incomeByBreeder: (json['incomeBreeder'] as num?)?.toDouble() ?? 0,
      expensesByBreeder: (json['expensesBreeder'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$LedgerStatsModelToJson(LedgerStatsModel instance) =>
    <String, dynamic>{
      'income': instance.income,
      'expenses': instance.expenses,
      'incomeBreeder': instance.incomeByBreeder,
      'expensesBreeder': instance.expensesByBreeder,
    };
