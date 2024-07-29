// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'app_theme_extension.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  const AppThemeExtension({
    required this.femaleColor,
    required this.googleColor,
    required this.indicatorInfoColor,
    required this.maleColor,
    required this.plusColor,
  });

  final Color femaleColor;
  final Color googleColor;
  final Color indicatorInfoColor;
  final Color maleColor;
  final Color plusColor;

  static final AppThemeExtension light = AppThemeExtension(
    femaleColor: _$AppThemeExtension.femaleColor[0],
    googleColor: _$AppThemeExtension.googleColor[0],
    indicatorInfoColor: _$AppThemeExtension.indicatorInfoColor[0],
    maleColor: _$AppThemeExtension.maleColor[0],
    plusColor: _$AppThemeExtension.plusColor[0],
  );

  static final AppThemeExtension dark = AppThemeExtension(
    femaleColor: _$AppThemeExtension.femaleColor[1],
    googleColor: _$AppThemeExtension.googleColor[1],
    indicatorInfoColor: _$AppThemeExtension.indicatorInfoColor[1],
    maleColor: _$AppThemeExtension.maleColor[1],
    plusColor: _$AppThemeExtension.plusColor[1],
  );

  static final themes = [
    light,
    dark,
  ];

  @override
  AppThemeExtension copyWith({
    Color? femaleColor,
    Color? googleColor,
    Color? indicatorInfoColor,
    Color? maleColor,
    Color? plusColor,
  }) {
    return AppThemeExtension(
      femaleColor: femaleColor ?? this.femaleColor,
      googleColor: googleColor ?? this.googleColor,
      indicatorInfoColor: indicatorInfoColor ?? this.indicatorInfoColor,
      maleColor: maleColor ?? this.maleColor,
      plusColor: plusColor ?? this.plusColor,
    );
  }

  @override
  AppThemeExtension lerp(
      covariant ThemeExtension<AppThemeExtension>? other, double t) {
    if (other is! AppThemeExtension) return this as AppThemeExtension;
    return AppThemeExtension(
      femaleColor: Color.lerp(femaleColor, other.femaleColor, t)!,
      googleColor: Color.lerp(googleColor, other.googleColor, t)!,
      indicatorInfoColor:
          Color.lerp(indicatorInfoColor, other.indicatorInfoColor, t)!,
      maleColor: Color.lerp(maleColor, other.maleColor, t)!,
      plusColor: Color.lerp(plusColor, other.plusColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppThemeExtension &&
            const DeepCollectionEquality()
                .equals(femaleColor, other.femaleColor) &&
            const DeepCollectionEquality()
                .equals(googleColor, other.googleColor) &&
            const DeepCollectionEquality()
                .equals(indicatorInfoColor, other.indicatorInfoColor) &&
            const DeepCollectionEquality().equals(maleColor, other.maleColor) &&
            const DeepCollectionEquality().equals(plusColor, other.plusColor));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(femaleColor),
      const DeepCollectionEquality().hash(googleColor),
      const DeepCollectionEquality().hash(indicatorInfoColor),
      const DeepCollectionEquality().hash(maleColor),
      const DeepCollectionEquality().hash(plusColor),
    );
  }
}

extension AppThemeExtensionBuildContextProps on BuildContext {
  AppThemeExtension get appThemeExtension =>
      Theme.of(this).extension<AppThemeExtension>()!;
  Color get femaleColor => appThemeExtension.femaleColor;
  Color get googleColor => appThemeExtension.googleColor;
  Color get indicatorInfoColor => appThemeExtension.indicatorInfoColor;
  Color get maleColor => appThemeExtension.maleColor;
  Color get plusColor => appThemeExtension.plusColor;
}
