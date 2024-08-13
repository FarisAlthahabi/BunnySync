import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';

enum AilmentStatusTypes implements DropDownItemModel {
  active,
  suspended,
  cured;

  @override
  int get id {
    switch (this) {
      case AilmentStatusTypes.active:
        return 1;
      case AilmentStatusTypes.suspended:
        return 2;
      case AilmentStatusTypes.cured:
        return 3;
    }
  }

  @override
  String get name {
    switch (this) {
      case AilmentStatusTypes.active:
        return 'active'.i18n;
      case AilmentStatusTypes.suspended:
        return 'suspended'.i18n;
      case AilmentStatusTypes.cured:
        return 'cured'.i18n;
    }
  }

  static AilmentStatusTypes fromJson(String value) {
    switch (value.toLowerCase()) {
      case 'active':
        return AilmentStatusTypes.active;
      case 'suspended':
        return AilmentStatusTypes.suspended;
      case 'cured':
        return AilmentStatusTypes.cured;
      default:
        throw Exception('Unknown AilmentStatusTypes value: $value');
    }
  }
}
