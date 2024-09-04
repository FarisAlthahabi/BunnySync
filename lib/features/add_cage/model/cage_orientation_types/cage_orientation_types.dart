import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';

enum CageOrientationTypes implements DropDownItemModel {
  horizontal,
  vertical;

  @override
  int get id => index;

  @override
  String get displayName {
    switch (this) {
      case CageOrientationTypes.horizontal:
        return 'horizontal'.i18n;
      case CageOrientationTypes.vertical:
        return 'vertical'.i18n;
    }
  }

  static CageOrientationTypes fromJson(String value) {
    return values.byName(value.toLowerCase());
  }

  static String cageToJson(CageOrientationTypes value) {
    switch (value) {
      case CageOrientationTypes.horizontal:
        return 'horizontal';
      case CageOrientationTypes.vertical:
        return 'vertical';
      default:
        throw 'Cage orientation type is not supported';
    }
  }
}
