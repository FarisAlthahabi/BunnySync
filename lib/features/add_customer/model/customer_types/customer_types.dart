import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';

enum CustomerTypes implements DropDownItemModel {
  lead,
  vendor,
  customer;

  @override
  int get id {
    return index;
  }

  @override
  String get name {
    switch (this) {
      case CustomerTypes.lead:
        return 'lead'.i18n;
      case CustomerTypes.vendor:
        return 'vendor'.i18n;
      case CustomerTypes.customer:
        return 'customer'.i18n;
    }
  }

  static CustomerTypes fromJson(String value) {
    switch (value.toLowerCase()) {
      case 'lead':
        return CustomerTypes.lead;
      case 'vendor':
        return CustomerTypes.vendor;
      case 'customer':
        return CustomerTypes.customer;
      default:
        throw Exception('Unknown CustomerTypes value: $value');
    }
  }
}
