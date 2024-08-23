import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/widgets/radio_selector_widget.dart';

enum BreedTimeTypes implements RadioSelectorItemModel {
  future,
  already;

  @override
  dynamic get value => this;

  @override
  String get displayName {
    switch (this) {
      case BreedTimeTypes.future:
        return 'future'.i18n;
      case BreedTimeTypes.already:
        return 'already'.i18n;
    }
  }

  static BreedTimeTypes fromJson(String json) {
    return values.byName(json.toLowerCase());
  }

  static String toJson(BreedTimeTypes breedTimeType) {
    return breedTimeType.name;
  }
}
