import 'package:bunny_sync/global/gen/assets.gen.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/widgets/radio_selector_widget.dart';
import 'package:flutter/material.dart';

enum GenderTypes implements RadioSelectorItemModel {
  male,
  female;

  @override
  dynamic get value => this;

  @override
  String get displayName {
    switch (this) {
      case GenderTypes.male:
        return 'buck'.i18n;
      case GenderTypes.female:
        return 'doe'.i18n;
    }
  }

  Widget get genderIcon {
    switch (this) {
      case GenderTypes.male:
        return Assets.icons.buck.svg();
      case GenderTypes.female:
        return Assets.icons.doe.svg();
    }
  }

  static GenderTypes fromJson(String value) {
    if (GenderTypes.male.name == value) {
      return GenderTypes.male;
    } else if (GenderTypes.female.name == value) {
      return GenderTypes.female;
    } else {
      throw Exception('Gender type is not supported');
    }
  }
}
