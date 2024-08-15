import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';

enum RabbitTypes implements DropDownItemModel {
  breeder,
  litter;

  @override
  int get id {
    switch (this) {
      case RabbitTypes.breeder:
        return 1;
      case RabbitTypes.litter:
        return 2;
    }
  }

  @override
  String get name {
    switch (this) {
      case RabbitTypes.breeder:
        return 'breeder'.i18n;
      case RabbitTypes.litter:
        return 'litter'.i18n;
    }
  }

  bool get isBreeder => this == RabbitTypes.breeder;

  bool get isLitter => this == RabbitTypes.litter;

  static RabbitTypes fromJson(String json) {
    return values.byName(json.toLowerCase());
  }
}
