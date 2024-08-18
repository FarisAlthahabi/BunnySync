import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';

enum TaskTypes implements DropDownItemModel {
  breeder,
  litter,
  general;

  @override
  int get id {
    switch (this) {
      case TaskTypes.breeder:
        return 1;
      case TaskTypes.litter:
        return 2;
      case TaskTypes.general:
        return 3;
    }
  }

  @override
  String get displayName {
    switch (this) {
      case TaskTypes.breeder:
        return 'breeder'.i18n;
      case TaskTypes.litter:
        return 'litter'.i18n;
      case TaskTypes.general:
        return 'general'.i18n;
    }
  }

  bool get isBreeder => this == TaskTypes.breeder;

  bool get isLitter => this == TaskTypes.litter;

  bool get isGeneral => this == TaskTypes.general;

  static TaskTypes fromJson(String value) {
    try {
      return values.byName(value.toLowerCase());
    } catch (e) {
      return TaskTypes.general;
    }
  }
}
