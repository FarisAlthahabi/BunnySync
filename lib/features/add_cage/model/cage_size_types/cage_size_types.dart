import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';

enum CageSizeTypes implements DropDownItemModel {
  business2X3,
  index3X5,
  large4x7;

  @override
  int get id => index;

  @override
  String get displayName {
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
    // Regular expression to match any card above and any extra spaces
    final regex = RegExp(r'\s*Bussiness Card\s*');
    final regex2 = RegExp(r'\s*Index Card\s*');
    final regex3 = RegExp(r'\s*Large Card\s*');

    // Replace the matched pattern with an empty string
    String result = value
        .replaceAll(regex, '')
        .replaceAll(regex2, '')
        .replaceAll(regex3, '');

    // Remove any spaces around "x"
    result = result.replaceAll(RegExp(r'\s*x\s*'), 'x');

    switch (result) {
      case '2x3':
        return CageSizeTypes.business2X3;
      case '3x5':
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
        return '2x3';
      case CageSizeTypes.index3X5:
        return '3x5';
      case CageSizeTypes.large4x7:
        return '4x7';
      default:
        throw Exception('Cage size type is not supported');
    }
  }
}
