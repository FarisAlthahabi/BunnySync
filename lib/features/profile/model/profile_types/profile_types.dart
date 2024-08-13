import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';

enum ProfileTypes implements DropDownItemModel {
  existingCustomer,
  otherPerson,
  google,
  facebook,
  socialMedia,
  article,
  advertisment,
  convention,
  sale,
  other;

  @override
  int get id {
    switch (this) {
      case ProfileTypes.existingCustomer:
        return 1;
      case ProfileTypes.otherPerson:
        return 2;
      case ProfileTypes.google:
        return 3;
      case ProfileTypes.facebook:
        return 4;
      case ProfileTypes.socialMedia:
        return 5;
      case ProfileTypes.article:
        return 6;
      case ProfileTypes.advertisment:
        return 7;
      case ProfileTypes.convention:
        return 8;
      case ProfileTypes.sale:
        return 9;
      case ProfileTypes.other:
        return 10;
    }
  }

  @override
  String get name {
    switch (this) {
      case ProfileTypes.existingCustomer:
        return 'existing_customer'.i18n;
      case ProfileTypes.otherPerson:
        return 'other_person'.i18n;
      case ProfileTypes.google:
        return 'google'.i18n;
      case ProfileTypes.facebook:
        return 'facebook'.i18n;
      case ProfileTypes.socialMedia:
        return 'social_media'.i18n;
      case ProfileTypes.article:
        return 'article'.i18n;
      case ProfileTypes.advertisment:
        return 'advertisment'.i18n;
      case ProfileTypes.convention:
        return 'convention'.i18n;
      case ProfileTypes.sale:
        return 'sale'.i18n;
      case ProfileTypes.other:
        return 'other'.i18n;
    }
  }

  static ProfileTypes fromJson(String value) {
    switch (value.toLowerCase().replaceAll(' ', '_')) {
      case 'existing_customer':
        return ProfileTypes.existingCustomer;
      case 'other_person':
        return ProfileTypes.otherPerson;
      case 'google':
        return ProfileTypes.google;
      case 'facebook':
        return ProfileTypes.facebook;
      case 'social_media':
        return ProfileTypes.socialMedia;
      case 'article':
        return ProfileTypes.article;
      case 'advertisment':
        return ProfileTypes.advertisment;
      case 'convention':
        return ProfileTypes.convention;
      case 'sale':
        return ProfileTypes.sale;
      case 'other':
        return ProfileTypes.other;
      default:
        throw Exception('Unknown ProfileTypes value: $value');
    }
  }
}
