import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/widgets/radio_selector_widget.dart';

enum TaskStatusTypes implements RadioSelectorItemModel{
  archive,
  unarchive;

  @override
  dynamic get value => this;

  @override
  String get displayName {
    switch (this) {
      case TaskStatusTypes.archive:
        return 'archive'.i18n;
      case TaskStatusTypes.unarchive:
        return 'unarchive'.i18n;
    }
  }
}
