import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';

enum RecurringPeriodsTypes implements DropDownItemModel {
  once,
  everyWeek,
  every2Weeks,
  everyMonth;

  @override
  int get id {
    switch (this) {
      case RecurringPeriodsTypes.once:
        return 1;
      case RecurringPeriodsTypes.everyWeek:
        return 2;
      case RecurringPeriodsTypes.every2Weeks:
        return 3;
      case RecurringPeriodsTypes.everyMonth:
        return 4;
    }
  }

  @override
  String get name {
    switch (this) {
      case RecurringPeriodsTypes.once:
        return 'once'.i18n;
      case RecurringPeriodsTypes.everyWeek:
        return 'every_week'.i18n;
      case RecurringPeriodsTypes.every2Weeks:
        return 'every_2_weeks'.i18n;
      case RecurringPeriodsTypes.everyMonth:
        return 'every_month'.i18n;
    }
  }
}
