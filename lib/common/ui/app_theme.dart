import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: false,
    appBarTheme: const AppBarTheme(
      color: AppColors.white,
      surfaceTintColor: AppColors.transparent,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: AppColors.white,
      surfaceTintColor: AppColors.transparent,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.transparent,
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.transparent,
    ),
    cardTheme: const CardTheme(
      color: AppColors.white,
      surfaceTintColor: AppColors.transparent,
      elevation: 0,
    ),
    fontFamily: 'Pretendard',
    textTheme: _lightTextTheme,
  );

  static ThemeData get darkTheme => ThemeData(
      useMaterial3: false,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.black,
        surfaceTintColor: AppColors.transparent,
      ),
      bottomAppBarTheme: const BottomAppBarTheme(
        color: AppColors.black,
        surfaceTintColor: AppColors.transparent,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.black,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.black,
        surfaceTintColor: AppColors.transparent,
      ),
      dialogTheme: const DialogTheme(
        backgroundColor: AppColors.black,
        surfaceTintColor: AppColors.transparent,
      ),
      cardTheme: const CardTheme(
        color: AppColors.black,
        surfaceTintColor: AppColors.transparent,
        elevation: 0,
      ),
      fontFamily: 'Pretendard',
      textTheme: _darkTextTheme,
  );

  static TextTheme get _lightTextTheme => const TextTheme(
    headlineLarge: TextStyle(
      color: AppColors.black,
      height: 40/34,
      fontSize: 34,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.2,
    ),
    headlineMedium: TextStyle(
      color: AppColors.black,
      height: 34/29,
      fontSize: 29,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.2,
    ),
    headlineSmall: TextStyle(
      color: AppColors.black,
      height: 28/25,
      fontSize: 25,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.2,
    ),
    titleLarge: TextStyle(
      color: AppColors.black,
      height: 30/23,
      fontSize: 23,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.2,
    ),
    titleMedium: TextStyle(
      color: AppColors.black,
      height: 22/17,
      fontSize: 17,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.2,
    ),
    titleSmall: TextStyle(
      color: AppColors.black,
      height: 20/15,
      fontSize: 15,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.2,
    ),
    bodyLarge: TextStyle(
      color: AppColors.black,
      height: 21/15,
      fontSize: 15,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.2,
    ),
    bodyMedium: TextStyle(
      color: AppColors.black,
      height: 20/14,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.2,
    ),
    bodySmall: TextStyle(
      color: AppColors.black,
      height: 18/13,
      fontSize: 13,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.2,
    ),
    labelLarge: TextStyle(
      color: AppColors.black,
      height: 16/12,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.2,
    ),
    labelMedium: TextStyle(
      color: AppColors.black,
      height: 13/11,
      fontSize: 11,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.2,
    ),
    labelSmall: TextStyle(
      color: AppColors.black,
      height: 10/10,
      fontSize: 10,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.2,
    ),
  );

  static TextTheme get _darkTextTheme => const TextTheme(
    headlineLarge: TextStyle(
      color: AppColors.white,
      height: 40/34,
      fontSize: 34,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.2,
    ),
    headlineMedium: TextStyle(
      color: AppColors.white,
      height: 34/29,
      fontSize: 29,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.2,
    ),
    headlineSmall: TextStyle(
      color: AppColors.white,
      height: 28/25,
      fontSize: 25,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.2,
    ),
    titleLarge: TextStyle(
      color: AppColors.white,
      height: 30/23,
      fontSize: 23,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.2,
    ),
    titleMedium: TextStyle(
      color: AppColors.white,
      height: 22/17,
      fontSize: 17,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.2,
    ),
    titleSmall: TextStyle(
      color: AppColors.white,
      height: 20/15,
      fontSize: 15,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.2,
    ),
    bodyLarge: TextStyle(
      color: AppColors.white,
      height: 21/15,
      fontSize: 15,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.2,
    ),
    bodyMedium: TextStyle(
      color: AppColors.white,
      height: 20/14,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.2,
    ),
    bodySmall: TextStyle(
      color: AppColors.white,
      height: 18/13,
      fontSize: 13,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.2,
    ),
    labelLarge: TextStyle(
      color: AppColors.white,
      height: 16/12,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.2,
    ),
    labelMedium: TextStyle(
      color: AppColors.white,
      height: 13/11,
      fontSize: 11,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.2,
    ),
    labelSmall: TextStyle(
      color: AppColors.white,
      height: 10/10,
      fontSize: 10,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.2,
    ),
  );

}