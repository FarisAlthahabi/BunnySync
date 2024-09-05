import 'package:bunny_sync/features/ledger/models/ledger_stats_model/ledger_stats_model.dart';
import 'package:bunny_sync/global/gen/assets.gen.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme_extensions/app_theme_extension/app_theme_extension.dart';
import 'package:bunny_sync/global/widgets/radio_selector_widget.dart';
import 'package:flutter/material.dart';

enum LedgerTypes implements RadioSelectorItemModel {
  income,
  expenses,
  incomePerBreeder,
  expensesPerBreeder;

  @override
  String get displayName {
    switch (this) {
      case LedgerTypes.income:
        return 'income'.i18n;
      case LedgerTypes.expenses:
        return 'expenses'.i18n;
      case LedgerTypes.incomePerBreeder:
        return 'incomeBreeder'.i18n;
      case LedgerTypes.expensesPerBreeder:
        return 'expensesBreeder'.i18n;
    }
  }

  @override
  dynamic get value => this;

  String get icon {
    switch (this) {
      case LedgerTypes.income:
        return Assets.icons.dollarCircle.path;
      case LedgerTypes.expenses:
        return Assets.icons.coins.path;
      case LedgerTypes.incomePerBreeder:
        return Assets.icons.money.path;
      case LedgerTypes.expensesPerBreeder:
        return Assets.icons.corpInterest.path;
    }
  }

  int get textMaxLines {
    switch (this) {
      case LedgerTypes.income:
        return 1;
      case LedgerTypes.expenses:
        return 1;
      case LedgerTypes.incomePerBreeder:
        return 2;
      case LedgerTypes.expensesPerBreeder:
        return 2;
    }
  }

  String get title {
    switch (this) {
      case LedgerTypes.income:
        return 'income'.i18n;
      case LedgerTypes.expenses:
        return 'expenses'.i18n;
      case LedgerTypes.incomePerBreeder:
        return 'income_per_breeder'.i18n;
      case LedgerTypes.expensesPerBreeder:
        return 'expenses_per_breeder'.i18n;
    }
  }

  Color color(BuildContext context) {
    switch (this) {
      case LedgerTypes.income:
        return context.appThemeExtension.incomeColor;
      case LedgerTypes.expenses:
        return context.appThemeExtension.expensesColor;
      case LedgerTypes.incomePerBreeder:
        return context.appThemeExtension.incomePerBreederColor;
      case LedgerTypes.expensesPerBreeder:
        return context.appThemeExtension.expensesPerBreederColor;
    }
  }

  Color iconColor(BuildContext context) {
    switch (this) {
      case LedgerTypes.income:
        return context.appThemeExtension.incomeIconColor;
      case LedgerTypes.expenses:
        return context.appThemeExtension.expensesIconColor;
      case LedgerTypes.incomePerBreeder:
        return context.appThemeExtension.incomePerBreederIconColor;
      case LedgerTypes.expensesPerBreeder:
        return context.appThemeExtension.expensesPerBreederIconColor;
    }
  }

  double getLedgerTypeValue(LedgerStatsModel ledgerStats) {
    switch (this) {
      case LedgerTypes.income:
        return ledgerStats.income;
      case LedgerTypes.expenses:
        return ledgerStats.expenses;
      case LedgerTypes.incomePerBreeder:
        return ledgerStats.incomeByBreeder;
      case LedgerTypes.expensesPerBreeder:
        return ledgerStats.expensesByBreeder;
    }
  }

  static LedgerTypes fromJson(String type) {
    if (type == 'income') {
      return LedgerTypes.income;
    } else if (type == 'expenses' || type == 'expense') {
      return LedgerTypes.expenses;
    } else if (type == 'incomePerBreeder') {
      return LedgerTypes.incomePerBreeder;
    } else if (type == 'expensesPerBreeder') {
      return LedgerTypes.expensesPerBreeder;
    } else {
      throw 'Unknown type: $type';
    }
  }
}
