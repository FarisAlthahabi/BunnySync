import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/widgets/radio_selector_widget.dart';

enum StatusTypes implements RadioSelectorItemModel{
  archive,
  active;

  @override
  dynamic get value => this;

  @override
  String get displayName {
    switch (this) {
      case StatusTypes.archive:
        return 'archive'.i18n;
      case StatusTypes.active:
        return 'active'.i18n;
    }
  }

  static String nameToJson(StatusTypes statusType){
    switch (statusType) {
      case StatusTypes.archive:
        return 'archive';
      case StatusTypes.active:
        return 'unarchive';
    }
  }
}
