import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';

enum CageSizeTypes implements DropDownItemModel {
  business2X3,
  index3X5,
  large4x7;

  @override
  int get id => index;

  @override
  String get name {
    switch (this) {
      case CageSizeTypes.business2X3:
        return 'business_2X3'.i18n;
      case CageSizeTypes.index3X5:
        return 'index_3X5'.i18n;
      case CageSizeTypes.large4x7:
        return 'large_4x7'.i18n;
    }
  }

  static CageSizeTypes fromJson(String value) {
    switch (value) {
      case '2X3':
        return CageSizeTypes.business2X3;
      case '3X5':
        return CageSizeTypes.index3X5;
      case '4x7':
        return CageSizeTypes.large4x7;
      default:
        throw Exception('Cage size type is not supported');
    }
  }

  static String cageToJson(CageSizeTypes value) {
    switch (value) {
      case CageSizeTypes.business2X3:
        return '2X3';
      case CageSizeTypes.index3X5:
        return '3X5';
      case CageSizeTypes.large4x7:
        return '4x7';
      default:
        throw Exception('Cage size type is not supported');
    }
  }
}
