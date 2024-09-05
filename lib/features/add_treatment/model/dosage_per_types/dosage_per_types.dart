import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';

enum DosagePerTypes implements DropDownItemModel {
  lbs,
  oz,
  kg,
  grams;

  @override
  int get id {
    return index;
  }

  @override
  String get displayName {
    switch (this) {
      case DosagePerTypes.lbs:
        return 'lbs'.i18n;
      case DosagePerTypes.oz:
        return 'oz'.i18n;
      case DosagePerTypes.kg:
        return 'kg'.i18n;
      case DosagePerTypes.grams:
        return 'grams'.i18n;
    }
  }

  static DosagePerTypes fromJson(String value) {
    switch (value.toLowerCase()) {
      case 'lbs':
        return DosagePerTypes.lbs;
      case 'oz':
        return DosagePerTypes.oz;
      case 'kg':
        return DosagePerTypes.kg;
      case 'grams':
        return DosagePerTypes.grams;
      default:
        throw 'Unknown DosagePerTypes value: $value';
    }
  }
}
