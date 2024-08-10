import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';

enum AilmentTypes implements DropDownItemModel {
  active,
  suspended,
  cured;

  @override
  int get id {
    switch (this) {
      case AilmentTypes.active:
        return 1;
      case AilmentTypes.suspended:
        return 2;
      case AilmentTypes.cured:
        return 3;
    }
  }

  @override
  String get name {
    switch (this) {
      case AilmentTypes.active:
        return 'active'.i18n;
      case AilmentTypes.suspended:
        return 'suspended'.i18n;
      case AilmentTypes.cured:
        return 'cured'.i18n;
    }
  }
}
