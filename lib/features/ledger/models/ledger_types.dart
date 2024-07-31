import 'package:bunny_sync/global/gen/assets.gen.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme_extensions/app_theme_extension/app_theme_extension.dart';
import 'package:flutter/material.dart';

enum LedgerTypes {
  income,
  expenses,
  incomePerBreeder,
  expensesPerBreeder;

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
}
