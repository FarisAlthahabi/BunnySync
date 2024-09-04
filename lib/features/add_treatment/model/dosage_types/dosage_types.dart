import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';

enum DosageTypes implements DropDownItemModel {
  ml,
  litter,
  oz;

  @override
  int get id {
    return index;
  }

  @override
  String get displayName {
    switch (this) {
      case DosageTypes.ml:
        return 'ml'.i18n;
      case DosageTypes.litter:
        return 'litter'.i18n;
      case DosageTypes.oz:
        return 'oz'.i18n;
    }
  }

  static DosageTypes fromJson(String value) {
    switch (value.toLowerCase()) {
      case 'ml':
        return DosageTypes.ml;
      case 'litter':
        return DosageTypes.litter;
      case 'oz':
        return DosageTypes.oz;
      default:
        throw 'Unknown DosageTypes value: $value';
    }
  }
}
