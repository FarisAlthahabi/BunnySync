// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'app_theme_extension.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  const AppThemeExtension({
    required this.examViewBackgroundColor,
    required this.freeBackground,
    required this.freeForeground,
    required this.glowEffect,
    required this.pointsCounterBackground,
    required this.pointsCounterForeground,
    required this.testTileSubTitleColor,
  });

  final Color examViewBackgroundColor;
  final Color freeBackground;
  final Color freeForeground;
  final Color glowEffect;
  final Color pointsCounterBackground;
  final Color pointsCounterForeground;
  final Color testTileSubTitleColor;

  static final AppThemeExtension light = AppThemeExtension(
    examViewBackgroundColor: _$AppThemeExtension.examViewBackgroundColor[0],
    freeBackground: _$AppThemeExtension.freeBackground[0],
    freeForeground: _$AppThemeExtension.freeForeground[0],
    glowEffect: _$AppThemeExtension.glowEffect[0],
    pointsCounterBackground: _$AppThemeExtension.pointsCounterBackground[0],
    pointsCounterForeground: _$AppThemeExtension.pointsCounterForeground[0],
    testTileSubTitleColor: _$AppThemeExtension.testTileSubTitleColor[0],
  );

  static final AppThemeExtension dark = AppThemeExtension(
    examViewBackgroundColor: _$AppThemeExtension.examViewBackgroundColor[1],
    freeBackground: _$AppThemeExtension.freeBackground[1],
    freeForeground: _$AppThemeExtension.freeForeground[1],
    glowEffect: _$AppThemeExtension.glowEffect[1],
    pointsCounterBackground: _$AppThemeExtension.pointsCounterBackground[1],
    pointsCounterForeground: _$AppThemeExtension.pointsCounterForeground[1],
    testTileSubTitleColor: _$AppThemeExtension.testTileSubTitleColor[1],
  );

  static final themes = [
    light,
    dark,
  ];

  @override
  AppThemeExtension copyWith({
    Color? examViewBackgroundColor,
    Color? freeBackground,
    Color? freeForeground,
    Color? glowEffect,
    Color? pointsCounterBackground,
    Color? pointsCounterForeground,
    Color? testTileSubTitleColor,
  }) {
    return AppThemeExtension(
      examViewBackgroundColor:
          examViewBackgroundColor ?? this.examViewBackgroundColor,
      freeBackground: freeBackground ?? this.freeBackground,
      freeForeground: freeForeground ?? this.freeForeground,
      glowEffect: glowEffect ?? this.glowEffect,
      pointsCounterBackground:
          pointsCounterBackground ?? this.pointsCounterBackground,
      pointsCounterForeground:
          pointsCounterForeground ?? this.pointsCounterForeground,
      testTileSubTitleColor:
          testTileSubTitleColor ?? this.testTileSubTitleColor,
    );
  }

  @override
  AppThemeExtension lerp(
      covariant ThemeExtension<AppThemeExtension>? other, double t) {
    if (other is! AppThemeExtension) return this as AppThemeExtension;
    return AppThemeExtension(
      examViewBackgroundColor: Color.lerp(
          examViewBackgroundColor, other.examViewBackgroundColor, t)!,
      freeBackground: Color.lerp(freeBackground, other.freeBackground, t)!,
      freeForeground: Color.lerp(freeForeground, other.freeForeground, t)!,
      glowEffect: Color.lerp(glowEffect, other.glowEffect, t)!,
      pointsCounterBackground: Color.lerp(
          pointsCounterBackground, other.pointsCounterBackground, t)!,
      pointsCounterForeground: Color.lerp(
          pointsCounterForeground, other.pointsCounterForeground, t)!,
      testTileSubTitleColor:
          Color.lerp(testTileSubTitleColor, other.testTileSubTitleColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppThemeExtension &&
            const DeepCollectionEquality().equals(
                examViewBackgroundColor, other.examViewBackgroundColor) &&
            const DeepCollectionEquality()
                .equals(freeBackground, other.freeBackground) &&
            const DeepCollectionEquality()
                .equals(freeForeground, other.freeForeground) &&
            const DeepCollectionEquality()
                .equals(glowEffect, other.glowEffect) &&
            const DeepCollectionEquality().equals(
                pointsCounterBackground, other.pointsCounterBackground) &&
            const DeepCollectionEquality().equals(
                pointsCounterForeground, other.pointsCounterForeground) &&
            const DeepCollectionEquality()
                .equals(testTileSubTitleColor, other.testTileSubTitleColor));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(examViewBackgroundColor),
      const DeepCollectionEquality().hash(freeBackground),
      const DeepCollectionEquality().hash(freeForeground),
      const DeepCollectionEquality().hash(glowEffect),
      const DeepCollectionEquality().hash(pointsCounterBackground),
      const DeepCollectionEquality().hash(pointsCounterForeground),
      const DeepCollectionEquality().hash(testTileSubTitleColor),
    );
  }
}

extension AppThemeExtensionBuildContextProps on BuildContext {
  AppThemeExtension get appThemeExtension =>
      Theme.of(this).extension<AppThemeExtension>()!;
  Color get examViewBackgroundColor =>
      appThemeExtension.examViewBackgroundColor;
  Color get freeBackground => appThemeExtension.freeBackground;
  Color get freeForeground => appThemeExtension.freeForeground;
  Color get glowEffect => appThemeExtension.glowEffect;
  Color get pointsCounterBackground =>
      appThemeExtension.pointsCounterBackground;
  Color get pointsCounterForeground =>
      appThemeExtension.pointsCounterForeground;
  Color get testTileSubTitleColor => appThemeExtension.testTileSubTitleColor;
}
