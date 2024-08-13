import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/widgets/radio_selector_widget.dart';

enum LedgerTypes implements RadioSelectorItemModel {
  income,
  expense;

  @override
  String get displayName {
    switch (this) {
      case LedgerTypes.income:
        return 'income'.i18n;
      case LedgerTypes.expense:
        return 'expense'.i18n;
    }
  }

  @override
  dynamic get value => this;
}
