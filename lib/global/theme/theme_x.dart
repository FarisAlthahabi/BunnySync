import 'package:flutter/material.dart';

extension ThemeX on BuildContext {
  TextStyle? get textThemeDs => Theme.of(this).textTheme.displaySmall;
  TextStyle? get textThemeDm => Theme.of(this).textTheme.displayMedium;
  TextStyle? get textThemeDl => Theme.of(this).textTheme.displayLarge;

  TextTheme get ts => Theme.of(this).textTheme;

  TextButtonThemeData get textButtonTheme => Theme.of(this).textButtonTheme;

  ColorScheme get cs => Theme.of(this).colorScheme;
}
