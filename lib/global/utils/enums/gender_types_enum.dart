import 'package:bunny_sync/global/gen/assets.gen.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme_extensions/app_theme_extension/app_theme_extension.dart';
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

  Color color(BuildContext context) {
    switch (this) {
      case GenderTypes.male:
        return context.appThemeExtension.maleColor;
      case GenderTypes.female:
        return context.appThemeExtension.femaleColor;
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

  bool get isMale => this == GenderTypes.male;

  bool get isFemale => this == GenderTypes.female;
}
