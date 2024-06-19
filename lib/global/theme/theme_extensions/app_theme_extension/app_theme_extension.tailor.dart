// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'app_theme_extension.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  const AppThemeExtension({
    required this.googleColor,
  });

  final Color googleColor;

  static final AppThemeExtension light = AppThemeExtension(
    googleColor: _$AppThemeExtension.googleColor[0],
  );

  static final AppThemeExtension dark = AppThemeExtension(
    googleColor: _$AppThemeExtension.googleColor[1],
  );

  static final themes = [
    light,
    dark,
  ];

  @override
  AppThemeExtension copyWith({
    Color? googleColor,
  }) {
    return AppThemeExtension(
      googleColor: googleColor ?? this.googleColor,
    );
  }

  @override
  AppThemeExtension lerp(
      covariant ThemeExtension<AppThemeExtension>? other, double t) {
    if (other is! AppThemeExtension) return this as AppThemeExtension;
    return AppThemeExtension(
      googleColor: Color.lerp(googleColor, other.googleColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppThemeExtension &&
            const DeepCollectionEquality()
                .equals(googleColor, other.googleColor));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(googleColor),
    );
  }
}

extension AppThemeExtensionBuildContextProps on BuildContext {
  AppThemeExtension get appThemeExtension =>
      Theme.of(this).extension<AppThemeExtension>()!;
  Color get googleColor => appThemeExtension.googleColor;
}
