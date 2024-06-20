import 'package:bunny_sync/global/theme/components/app_colors.dart';
import 'package:bunny_sync/global/theme/theme_extensions/app_theme_extension/app_theme_extension.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = ThemeData(
  fontFamily: GoogleFonts.manrope().fontFamily,
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontFamily: GoogleFonts.lexend().fontFamily,
      color: AppColors.darkBlue,
      fontWeight: FontWeight.w700,
      height: 1.48,
      fontSize: 32,
    ),
    headlineMedium: TextStyle(
      fontFamily: GoogleFonts.lexend().fontFamily,
      color: AppColors.darkBlue,
      fontWeight: FontWeight.w700,
      height: 1.36,
      fontSize: 24,
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
    labelLarge: const TextStyle(
      fontSize: 14,
      height: 1.22,
      color: AppColors.greyShade,
    ),
    labelMedium: TextStyle(
      fontSize: 16.sp,
      height: 1.4,
      color: Colors.white,
    ),
    bodyLarge: const TextStyle(
      color: AppColors.darkBlue,
      height: 1.26,
      fontSize: 16,
    ),
    bodyMedium: const TextStyle(
      color: AppColors.darkBlue,
      height: 1.22,
      fontSize: 14,
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
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ),
    titleTextStyle: TextStyle(
      fontFamily: GoogleFonts.lexend().fontFamily,
      height: 1.28,
      fontSize: 18,
      color: AppColors.darkBlue,
      fontWeight: FontWeight.w700,
    ),
  ),
  tabBarTheme: TabBarTheme(
    labelColor: AppColors.mainColor,
    indicatorColor: AppColors.mainColor,
    indicatorSize: TabBarIndicatorSize.label,
    unselectedLabelColor: AppColors.greyShade4,
    labelStyle: TextStyle(
      fontFamily: GoogleFonts.manrope().fontFamily,
      fontSize: 14.sp,
      height: 1.4,
    ),
    unselectedLabelStyle: TextStyle(
      fontFamily: GoogleFonts.manrope().fontFamily,
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
            Radius.circular(AppConstants.value12),
          ),
          side: BorderSide(color: AppColors.greyShade),
        ),
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      disabledBackgroundColor: AppColors.greyShade,
      disabledForegroundColor: Colors.white,
      backgroundColor: AppColors.mainColor,
      foregroundColor: Colors.white,
      fixedSize: const Size.fromHeight(44),
      textStyle: TextStyle(
        fontFamily: GoogleFonts.manrope().fontFamily,
        fontSize: 16,
      ),
      shape: RoundedRectangleBorder(borderRadius: AppConstants.borderRadius12),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: AppColors.backgroundColor,
      foregroundColor: AppColors.mainColorShade,
      textStyle: TextStyle(
        fontFamily: GoogleFonts.manrope().fontFamily,
        fontSize: 14,
        color: AppColors.mainColorShade,
        height: 1.22,
      ),
      shape: RoundedRectangleBorder(borderRadius: AppConstants.borderRadius10),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: AppConstants.borderRadius12,
      ),
      backgroundColor: Colors.white,
      foregroundColor: AppColors.orangeShade,
      side: const BorderSide(color: AppColors.orangeShade),
      textStyle: TextStyle(fontFamily: GoogleFonts.manrope().fontFamily),
    ),
  ),
  listTileTheme: ListTileThemeData(
    tileColor: AppColors.lightPurple,
    contentPadding: AppConstants.paddingH16V10,
    titleTextStyle: const TextStyle(
      color: AppColors.darkBlue,
      height: 1.26,
      fontSize: 16,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppConstants.value8),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: AppColors.mainColor,
    unselectedItemColor: AppColors.greyShade7,
    selectedIconTheme: IconThemeData(color: AppColors.mainColor),
    unselectedIconTheme: IconThemeData(color: AppColors.greyShade7),
    selectedLabelStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w700,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w700,
    ),
    showSelectedLabels: true,
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
  ),
  colorScheme: ColorScheme(
    primary: AppColors.mainColor,
    primaryContainer: AppColors.mainColorShade,
    secondary: AppColors.orangeShade,
    onSecondary: Colors.white,
    onPrimary: Colors.white,
    brightness: Brightness.light,
    tertiary: AppColors.darkBlue,
    onTertiary: Colors.white,
    tertiaryContainer: AppColors.greyShade3,
    surface: Colors.white,
    onSurface: AppColors.greyShade,
    surfaceContainerHighest: AppColors.greyShade7,
    onSurfaceVariant: AppColors.greyShade4,
    onTertiaryFixedVariant: AppColors.greyShade6,
    surfaceTint: AppColors.lightPurple,
    onInverseSurface: AppColors.lightGrey,
    error: AppColors.redShade,
    onError: Colors.white,
    shadow: AppColors.shadow,
  ),
  extensions: [
    AppThemeExtension.light,
  ],
);

const _inputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: Colors.white,
  contentPadding: AppConstants.textFieldContentPadding,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(AppConstants.value12)),
    borderSide: BorderSide(color: AppColors.greyShade),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(AppConstants.value12)),
    borderSide: BorderSide(color: AppColors.greyShade),
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(AppConstants.value12)),
    borderSide: BorderSide(color: AppColors.greyShade),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(AppConstants.value12)),
    borderSide: BorderSide(width: 1.2, color: AppColors.mainColor),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(AppConstants.value12)),
    borderSide: BorderSide(width: 1.2, color: AppColors.redShade),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(AppConstants.value12)),
    borderSide: BorderSide(width: 1.2, color: AppColors.mainColor),
  ),
  hintStyle: TextStyle(
    fontSize: 16,
    color: AppColors.greyShade2,
  ),
  errorStyle: TextStyle(color: AppColors.redShade),
);
