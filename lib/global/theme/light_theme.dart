import 'package:bunny_sync/global/theme/components/colors.dart';
import 'package:bunny_sync/global/theme/theme_extensions/app_theme_extension/app_theme_extension.dart';
import 'package:bunny_sync/global/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = ThemeData(
  fontFamily: GoogleFonts.cairo().fontFamily,
  textTheme: TextTheme(
    headlineMedium: TextStyle(
      color: AppColors.mainColor,
      fontWeight: FontWeight.w700,
      fontSize: 20.sp,
    ),
    titleLarge: TextStyle(
      color: AppColors.purpleDarkShade,
      height: 1.26,
      fontWeight: FontWeight.w600,
      fontSize: 20.sp,
    ),
    titleMedium: TextStyle(
      color: AppColors.purpleDarkShade,
      height: 1.4,
      fontSize: 16.sp,
    ),
    titleSmall: TextStyle(
      color: AppColors.purpleDarkShade,
      fontWeight: FontWeight.w500,
      height: 1.37,
      fontSize: 14.sp,
    ),
    labelLarge: TextStyle(
      fontSize: 14.sp,
      height: 1.48,
      fontWeight: FontWeight.w300,
      color: AppColors.greyShade3,
    ),
    labelMedium: TextStyle(
      fontSize: 16.sp,
      height: 1.4,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      color: Colors.white,
      height: 1.25,
      fontSize: 14.sp,
    ),
    bodyMedium: TextStyle(
      color: AppColors.greyShade4,
      height: 1.5,
      fontSize: 14.sp,
    ),
    bodySmall: TextStyle(
      color: AppColors.greyShade4,
      height: 1.48,
      fontSize: 12.sp,
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    splashRadius: 2,
    fillColor: WidgetStateProperty.resolveWith(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.mainColor;
        }
        return Colors.white;
      },
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(2),
    ),
    side: const BorderSide(
      color: AppColors.greyShade2,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    toolbarTextStyle: TextStyle(
      fontFamily: GoogleFonts.cairo().fontFamily,
      height: 1.26,
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
    ),
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ),
    titleTextStyle: TextStyle(
      fontFamily: GoogleFonts.cairo().fontFamily,
      height: 1.26,
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
    ),
  ),
  tabBarTheme: TabBarTheme(
    labelColor: AppColors.mainColor,
    indicatorColor: AppColors.mainColor,
    indicatorSize: TabBarIndicatorSize.label,
    unselectedLabelColor: AppColors.greyShade4,
    labelStyle: TextStyle(
      fontFamily: GoogleFonts.cairo().fontFamily,
      fontSize: 14.sp,
      height: 1.4,
    ),
    unselectedLabelStyle: TextStyle(
      fontFamily: GoogleFonts.cairo().fontFamily,
      fontSize: 14.sp,
      height: 1.4,
    ),
  ),
  inputDecorationTheme: _inputDecorationTheme,
  dropdownMenuTheme: DropdownMenuThemeData(
    inputDecorationTheme: _inputDecorationTheme,
    textStyle: TextStyle(
      color: AppColors.purpleDarkShade,
      height: 1.4,
      fontSize: 16.sp,
    ),
    menuStyle: const MenuStyle(
      backgroundColor: WidgetStatePropertyAll(Colors.white),
      elevation: WidgetStatePropertyAll(2),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppConstants.radius),
          ),
          side: BorderSide(color: AppColors.greyShade),
        ),
      ),
    ),
  ),
  colorScheme: ColorScheme(
    primary: AppColors.mainColor,
    primaryContainer: AppColors.mainColorShade,
    secondary: AppColors.orangeShade,
    onSecondary: Colors.white,
    onPrimary: Colors.white,
    brightness: Brightness.light,
    tertiary: AppColors.purpleDarkShade,
    onTertiary: Colors.white,
    tertiaryContainer: AppColors.greyShade3,
    surface: Colors.white,
    onSurface: AppColors.greyShade,
    surfaceContainerHighest: AppColors.greyShade2,
    onSurfaceVariant: AppColors.greyShade4,
    surfaceTint: AppColors.greyShade2,
    error: AppColors.redShade,
    onError: Colors.white,
    shadow: AppColors.shadow,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      disabledBackgroundColor: AppColors.greyShade,
      disabledForegroundColor: Colors.white,
      backgroundColor: AppColors.mainColor,
      foregroundColor: Colors.white,
      textStyle: TextStyle(
        fontFamily: GoogleFonts.cairo().fontFamily,
        fontWeight: FontWeight.w700,
        height: 1.15,
      ),
      shape: RoundedRectangleBorder(borderRadius: AppConstants.borderRadius10),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: AppColors.backgroundColor,
      foregroundColor: AppColors.blueShade,
      textStyle: TextStyle(
        fontFamily: GoogleFonts.cairo().fontFamily,
        fontSize: 16.sp,
        color: AppColors.blueShade,
        fontWeight: FontWeight.w600,
        height: 1.15,
      ),
      shape: RoundedRectangleBorder(borderRadius: AppConstants.borderRadius10),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.radius),
      ),
      backgroundColor: Colors.white,
      foregroundColor: AppColors.orangeShade,
      side: const BorderSide(color: AppColors.orangeShade),
      textStyle: TextStyle(fontFamily: GoogleFonts.cairo().fontFamily),
    ),
  ),
  extensions: [
    AppThemeExtension.light,
  ],
);

const _inputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: Colors.white,
  isDense: true,
  contentPadding: AppConstants.textFieldContentPadding,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(AppConstants.radius)),
    borderSide: BorderSide(color: AppColors.greyShade),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(AppConstants.radius)),
    borderSide: BorderSide(color: AppColors.greyShade),
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(AppConstants.radius)),
    borderSide: BorderSide(color: AppColors.greyShade),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(AppConstants.radius)),
    borderSide: BorderSide(color: AppColors.greyShade),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(AppConstants.radius)),
    borderSide: BorderSide(width: 1.2, color: AppColors.redShade),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(AppConstants.radius)),
    borderSide: BorderSide(width: 1.2, color: AppColors.mainColor),
  ),
  hintStyle: TextStyle(color: AppColors.greyShade2, height: 1.48),
  errorStyle: TextStyle(color: AppColors.redShade),
);
