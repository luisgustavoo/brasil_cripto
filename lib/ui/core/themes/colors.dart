import 'package:flutter/material.dart';

abstract final class AppColors {
  // Dark Theme
  static const darkBackground = Color(0xFF212536);
  static const darkCard = Color(0xFF171C2C);
  static const darkTextPrimary = Color(0xFFFFFFFF);
  static const darkTextSecondary = Color(0xFF5D606A);
  static const darkHighlight = Color(0xFF66C952);
  static const darkPositive = Color(0xFF4CAF50);
  static const darkNegative = Color(0xFFF44336);

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.darkHighlight,
    onPrimary: AppColors.darkBackground,
    secondary: AppColors.darkHighlight,
    onSecondary: AppColors.darkBackground,
    surface: AppColors.darkCard,
    onSurface: AppColors.darkTextPrimary,
    error: AppColors.darkNegative,
    onError: AppColors.darkBackground,
    surfaceContainerHighest: AppColors.darkCard,
    onSurfaceVariant: AppColors.darkTextSecondary,
    outline: AppColors.darkTextSecondary,
    shadow: Colors.black54,
    inverseSurface: AppColors.darkTextPrimary,
    onInverseSurface: AppColors.darkBackground,
    inversePrimary: AppColors.darkHighlight,
  );

  // Light Theme
  static const lightBackground = Color(0xFFF5F7FA);
  static const lightCard = Color(0xFFFFFFFE);
  static const lightTextPrimary = Color(0xFF1E272E);
  static const lightTextSecondary = Color(0xFF718096);

  static const lightHighlight = Color(0xFF66C952);
  static const lightPositive = Color(0xFF4CAF50);
  static const lightNegative = Color(0xFFF44336);
  static const lightBorder = Color(0xFFE2E8F0);

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: lightHighlight,
    onPrimary: Colors.white,
    secondary: lightHighlight,
    onSecondary: Colors.white,
    surface: lightCard,
    onSurface: lightTextPrimary,
    error: lightNegative,
    onError: Colors.white,
    outline: lightBorder,
    shadow: Colors.black12,
    surfaceContainerHighest: lightCard,
    onSurfaceVariant: lightTextSecondary,
    inverseSurface: lightTextPrimary,
    onInverseSurface: lightBackground,
    inversePrimary: lightHighlight,
  );
}
