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
  static const lightBackground = Color(
    0xFFF5F7FA,
  ); // Very light gray with a hint of blue
  static const lightCard = Color(0xFFFFFFFE); // Near-white for cards
  static const lightTextPrimary = Color(
    0xFF1E272E,
  ); // Dark gray for primary text
  static const lightTextSecondary = Color(
    0xFF718096,
  ); // Medium gray for secondary text
  static const lightHighlight = Color(
    0xFF6B46C1,
  ); // Purple accent for charts/buttons
  static const lightPositive = Color(
    0xFF4CAF50,
  ); // Green for positive indicators
  static const lightNegative = Color(0xFFF44336); // Red for negative indicators
  static const lightBorder = Color(0xFFE2E8F0); // Subtle light border

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: lightHighlight, // Purple for buttons and charts
    onPrimary: Colors.white, // Text on primary
    secondary: lightHighlight, // Secondary accent
    onSecondary: Colors.white, // Text on secondary
    background: lightBackground, // Main background
    onBackground: lightTextPrimary, // Text on background
    surface: lightCard, // Card surface
    onSurface: lightTextPrimary, // Text on surface
    error: lightNegative, // Error color
    onError: Colors.white, // Text on error
    outline: lightBorder, // Outline color
    shadow: Colors.black12, // Very subtle shadows
    surfaceVariant: lightCard, // Variant surface
    onSurfaceVariant: lightTextSecondary, // Text on variant surface
    inverseSurface: lightTextPrimary, // Inverse surface
    onInverseSurface: lightBackground, // Text on inverse surface
    inversePrimary: lightHighlight, // Inverse primary
  );
}
