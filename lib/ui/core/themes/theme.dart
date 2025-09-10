import 'package:brasil_cripto/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';

abstract final class AppTheme {
  // TextTheme unificado para light e dark
  static const _textTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w500,
      color: AppColors.black1, // para light, override no dark se necessário
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: AppColors.black1,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.black1,
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: AppColors.black1,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.black1,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.grey3,
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColors.grey3,
    ),
    labelLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: AppColors.grey3,
    ),
  );

  // InputDecorationTheme unificado
  static const _inputDecorationTheme = InputDecorationTheme(
    hintStyle: TextStyle(
      color: AppColors.grey3,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
  );

  // Tema claro
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: AppColors.lightColorScheme,
    scaffoldBackgroundColor: AppColors.lightColorScheme.surface,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightColorScheme.primary,
      foregroundColor: AppColors.lightColorScheme.onPrimary,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.green1,
      foregroundColor: AppColors.white1,
    ),
    textTheme: _textTheme.apply(
      bodyColor: AppColors.black1,
      displayColor: AppColors.black1,
    ),
    inputDecorationTheme: _inputDecorationTheme,
  );

  // Tema escuro
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: AppColors.darkColorScheme,
    scaffoldBackgroundColor: AppColors.darkColorScheme.surface,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkColorScheme.primary,
      foregroundColor: AppColors.darkColorScheme.onPrimary,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.green1,
      foregroundColor: AppColors.white1,
    ),
    textTheme: _textTheme.apply(
      bodyColor: AppColors.white1,
      displayColor: AppColors.white1,
    ),
    inputDecorationTheme: _inputDecorationTheme,
  );
}
