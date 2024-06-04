import 'package:flutter/foundation.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @singleton
  Future<bool> disablePrintOnRelease() async {
    if (kReleaseMode) {
      debugPrint = (String? message, {int? wrapWidth}) {};
    }

    return true;
  }

  @singleton
  double translations() {
    Translations.recordMissingKeys = false;
    Translations.recordMissingTranslations = false;

    Translations.missingTranslationCallback = (key, locale) {};
    Translations.missingKeyCallback = (key, locale) {};

    return 0.0;
  }
}
