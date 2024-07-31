// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'app_theme_extension.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  const AppThemeExtension({
    required this.expensesColor,
    required this.expensesIconColor,
    required this.expensesPerBreederColor,
    required this.expensesPerBreederIconColor,
    required this.femaleColor,
    required this.googleColor,
    required this.incomeColor,
    required this.incomeIconColor,
    required this.incomePerBreederColor,
    required this.incomePerBreederIconColor,
    required this.indicatorInfoColor,
    required this.maleColor,
    required this.plusColor,
  });

  final Color expensesColor;
  final Color expensesIconColor;
  final Color expensesPerBreederColor;
  final Color expensesPerBreederIconColor;
  final Color femaleColor;
  final Color googleColor;
  final Color incomeColor;
  final Color incomeIconColor;
  final Color incomePerBreederColor;
  final Color incomePerBreederIconColor;
  final Color indicatorInfoColor;
  final Color maleColor;
  final Color plusColor;

  static final AppThemeExtension light = AppThemeExtension(
    expensesColor: _$AppThemeExtension.expensesColor[0],
    expensesIconColor: _$AppThemeExtension.expensesIconColor[0],
    expensesPerBreederColor: _$AppThemeExtension.expensesPerBreederColor[0],
    expensesPerBreederIconColor:
        _$AppThemeExtension.expensesPerBreederIconColor[0],
    femaleColor: _$AppThemeExtension.femaleColor[0],
    googleColor: _$AppThemeExtension.googleColor[0],
    incomeColor: _$AppThemeExtension.incomeColor[0],
    incomeIconColor: _$AppThemeExtension.incomeIconColor[0],
    incomePerBreederColor: _$AppThemeExtension.incomePerBreederColor[0],
    incomePerBreederIconColor: _$AppThemeExtension.incomePerBreederIconColor[0],
    indicatorInfoColor: _$AppThemeExtension.indicatorInfoColor[0],
    maleColor: _$AppThemeExtension.maleColor[0],
    plusColor: _$AppThemeExtension.plusColor[0],
  );

  static final AppThemeExtension dark = AppThemeExtension(
    expensesColor: _$AppThemeExtension.expensesColor[1],
    expensesIconColor: _$AppThemeExtension.expensesIconColor[1],
    expensesPerBreederColor: _$AppThemeExtension.expensesPerBreederColor[1],
    expensesPerBreederIconColor:
        _$AppThemeExtension.expensesPerBreederIconColor[1],
    femaleColor: _$AppThemeExtension.femaleColor[1],
    googleColor: _$AppThemeExtension.googleColor[1],
    incomeColor: _$AppThemeExtension.incomeColor[1],
    incomeIconColor: _$AppThemeExtension.incomeIconColor[1],
    incomePerBreederColor: _$AppThemeExtension.incomePerBreederColor[1],
    incomePerBreederIconColor: _$AppThemeExtension.incomePerBreederIconColor[1],
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
    Color? expensesColor,
    Color? expensesIconColor,
    Color? expensesPerBreederColor,
    Color? expensesPerBreederIconColor,
    Color? femaleColor,
    Color? googleColor,
    Color? incomeColor,
    Color? incomeIconColor,
    Color? incomePerBreederColor,
    Color? incomePerBreederIconColor,
    Color? indicatorInfoColor,
    Color? maleColor,
    Color? plusColor,
  }) {
    return AppThemeExtension(
      expensesColor: expensesColor ?? this.expensesColor,
      expensesIconColor: expensesIconColor ?? this.expensesIconColor,
      expensesPerBreederColor:
          expensesPerBreederColor ?? this.expensesPerBreederColor,
      expensesPerBreederIconColor:
          expensesPerBreederIconColor ?? this.expensesPerBreederIconColor,
      femaleColor: femaleColor ?? this.femaleColor,
      googleColor: googleColor ?? this.googleColor,
      incomeColor: incomeColor ?? this.incomeColor,
      incomeIconColor: incomeIconColor ?? this.incomeIconColor,
      incomePerBreederColor:
          incomePerBreederColor ?? this.incomePerBreederColor,
      incomePerBreederIconColor:
          incomePerBreederIconColor ?? this.incomePerBreederIconColor,
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
      expensesColor: Color.lerp(expensesColor, other.expensesColor, t)!,
      expensesIconColor:
          Color.lerp(expensesIconColor, other.expensesIconColor, t)!,
      expensesPerBreederColor: Color.lerp(
          expensesPerBreederColor, other.expensesPerBreederColor, t)!,
      expensesPerBreederIconColor: Color.lerp(
          expensesPerBreederIconColor, other.expensesPerBreederIconColor, t)!,
      femaleColor: Color.lerp(femaleColor, other.femaleColor, t)!,
      googleColor: Color.lerp(googleColor, other.googleColor, t)!,
      incomeColor: Color.lerp(incomeColor, other.incomeColor, t)!,
      incomeIconColor: Color.lerp(incomeIconColor, other.incomeIconColor, t)!,
      incomePerBreederColor:
          Color.lerp(incomePerBreederColor, other.incomePerBreederColor, t)!,
      incomePerBreederIconColor: Color.lerp(
          incomePerBreederIconColor, other.incomePerBreederIconColor, t)!,
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
                .equals(expensesColor, other.expensesColor) &&
            const DeepCollectionEquality()
                .equals(expensesIconColor, other.expensesIconColor) &&
            const DeepCollectionEquality().equals(
                expensesPerBreederColor, other.expensesPerBreederColor) &&
            const DeepCollectionEquality().equals(expensesPerBreederIconColor,
                other.expensesPerBreederIconColor) &&
            const DeepCollectionEquality()
                .equals(femaleColor, other.femaleColor) &&
            const DeepCollectionEquality()
                .equals(googleColor, other.googleColor) &&
            const DeepCollectionEquality()
                .equals(incomeColor, other.incomeColor) &&
            const DeepCollectionEquality()
                .equals(incomeIconColor, other.incomeIconColor) &&
            const DeepCollectionEquality()
                .equals(incomePerBreederColor, other.incomePerBreederColor) &&
            const DeepCollectionEquality().equals(
                incomePerBreederIconColor, other.incomePerBreederIconColor) &&
            const DeepCollectionEquality()
                .equals(indicatorInfoColor, other.indicatorInfoColor) &&
            const DeepCollectionEquality().equals(maleColor, other.maleColor) &&
            const DeepCollectionEquality().equals(plusColor, other.plusColor));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(expensesColor),
      const DeepCollectionEquality().hash(expensesIconColor),
      const DeepCollectionEquality().hash(expensesPerBreederColor),
      const DeepCollectionEquality().hash(expensesPerBreederIconColor),
      const DeepCollectionEquality().hash(femaleColor),
      const DeepCollectionEquality().hash(googleColor),
      const DeepCollectionEquality().hash(incomeColor),
      const DeepCollectionEquality().hash(incomeIconColor),
      const DeepCollectionEquality().hash(incomePerBreederColor),
      const DeepCollectionEquality().hash(incomePerBreederIconColor),
      const DeepCollectionEquality().hash(indicatorInfoColor),
      const DeepCollectionEquality().hash(maleColor),
      const DeepCollectionEquality().hash(plusColor),
    );
  }
}

extension AppThemeExtensionBuildContextProps on BuildContext {
  AppThemeExtension get appThemeExtension =>
      Theme.of(this).extension<AppThemeExtension>()!;
  Color get expensesColor => appThemeExtension.expensesColor;
  Color get expensesIconColor => appThemeExtension.expensesIconColor;
  Color get expensesPerBreederColor =>
      appThemeExtension.expensesPerBreederColor;
  Color get expensesPerBreederIconColor =>
      appThemeExtension.expensesPerBreederIconColor;
  Color get femaleColor => appThemeExtension.femaleColor;
  Color get googleColor => appThemeExtension.googleColor;
  Color get incomeColor => appThemeExtension.incomeColor;
  Color get incomeIconColor => appThemeExtension.incomeIconColor;
  Color get incomePerBreederColor => appThemeExtension.incomePerBreederColor;
  Color get incomePerBreederIconColor =>
      appThemeExtension.incomePerBreederIconColor;
  Color get indicatorInfoColor => appThemeExtension.indicatorInfoColor;
  Color get maleColor => appThemeExtension.maleColor;
  Color get plusColor => appThemeExtension.plusColor;
}
