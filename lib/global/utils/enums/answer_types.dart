import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/widgets/radio_selector_widget.dart';

enum AnswerTypes implements RadioSelectorItemModel {
  yes,
  no;

  @override
  dynamic get value => this;

  @override
  String get displayName {
    switch (this) {
      case AnswerTypes.yes:
        return 'yes'.i18n;
      case AnswerTypes.no:
        return 'no'.i18n;
    }
  }

  static AnswerTypes fromJson(int value) {
    if (value == 0) {
      return AnswerTypes.no;
    } else if (value == 1) {
      return AnswerTypes.yes;
    } else {
      throw Exception('Answer type is not supported');
    }
  }
}
