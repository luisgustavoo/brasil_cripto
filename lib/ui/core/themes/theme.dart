import 'package:flutter/material.dart';
import 'colors.dart';

abstract final class AppTheme {
  static final _textTheme = TextTheme(
    headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
    headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
    bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
    bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    bodySmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    labelSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
    labelLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
  );

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: AppColors.lightColorScheme,
    scaffoldBackgroundColor: AppColors.lightBackground,
    cardColor: AppColors.lightCard,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightHighlight,
      foregroundColor: Colors.white,
    ),
    textTheme: _textTheme.apply(
      bodyColor: AppColors.lightTextPrimary,
      displayColor: AppColors.lightTextPrimary,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.lightHighlight,
      foregroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightHighlight,
        foregroundColor: Colors.white,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: AppColors.darkColorScheme,
    scaffoldBackgroundColor: AppColors.darkBackground,
    cardColor: AppColors.darkCard,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkHighlight,
      foregroundColor: Colors.white,
    ),
    textTheme: _textTheme.apply(
      bodyColor: AppColors.darkTextPrimary,
      displayColor: AppColors.darkTextPrimary,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.darkHighlight,
      foregroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkHighlight,
        foregroundColor: Colors.white,
      ),
    ),
  );
}





  // // Light Theme
  // static final _elevatedButtonLightTheme = ElevatedButtonThemeData(
  //   style: ElevatedButton.styleFrom(
  //     backgroundColor: AppColors.lightColorScheme.primary, // cor do botão
  //     foregroundColor: AppColors.lightColorScheme.onPrimary, // cor do texto
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  //   ),
  // );

  // // Dark Theme
  // static final _elevatedButtonDarkTheme = ElevatedButtonThemeData(
  //   style: ElevatedButton.styleFrom(
  //     backgroundColor: AppColors.darkColorScheme.primary,
  //     foregroundColor: AppColors.darkColorScheme.onPrimary,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  //   ),
  // );