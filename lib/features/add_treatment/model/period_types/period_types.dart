import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';

enum PeriodTypes implements DropDownItemModel {
  days,
  weeks,
  months,
  years;

  @override
  int get id {
    return index;
  }

  @override
  String get name {
    switch (this) {
      case PeriodTypes.days:
        return 'days'.i18n;
      case PeriodTypes.weeks:
        return 'weeks'.i18n;
      case PeriodTypes.months:
        return 'months'.i18n;
      case PeriodTypes.years:
        return 'years'.i18n;
    }
  }

  static PeriodTypes fromJson(String value) {
    switch (value.toLowerCase()) {
      case 'days':
        return PeriodTypes.days;
      case 'weeks':
        return PeriodTypes.weeks;
      case 'months':
        return PeriodTypes.months;
      case 'years':
        return PeriodTypes.years;
      default:
        throw Exception('Unknown ScheduleTypes value: $value');
    }
  }
}
