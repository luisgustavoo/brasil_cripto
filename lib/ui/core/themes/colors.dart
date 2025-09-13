import 'package:flutter/material.dart';

abstract final class AppColors {
  // Dark Theme
  static const darkBackground = Color(
    0xFF0D0D0D,
  ); // Deep dark background from chart
  static const darkCard = Color(0xFF1A1A1A); // Slightly lighter card background
  static const darkTextPrimary = Color(
    0xFFFFF8E1,
  ); // Off-white text for primary content
  static const darkTextSecondary = Color(
    0xFFE0E0E0,
  ); // Lighter gray for secondary text
  static const darkHighlight = Color(
    0xFFFFD600,
  ); // Yellow highlight matching chart line
  static const darkPositive = Color(
    0xFF39D353,
  ); // Green for positive indicators
  static const darkNegative = Color(0xFFF85149); // Red for negative indicators

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.darkHighlight, // Yellow for buttons and highlights
    onPrimary: AppColors.darkBackground, // Text on primary (dark background)
    secondary: AppColors.darkHighlight, // Secondary accent
    onSecondary: AppColors.darkBackground, // Text on secondary
    background: AppColors.darkBackground, // Main background
    onBackground: AppColors.darkTextPrimary, // Text on background
    surface: AppColors.darkCard, // Card surface
    onSurface: AppColors.darkTextPrimary, // Text on surface
    error: AppColors.darkNegative, // Error color
    onError: AppColors.darkBackground, // Text on error
    surfaceVariant: AppColors.darkCard, // Variant surface
    onSurfaceVariant: AppColors.darkTextSecondary, // Text on variant surface
    outline: AppColors.darkTextSecondary, // Outline color
    shadow: Colors.black, // Shadows
    inverseSurface: AppColors.darkTextPrimary, // Inverse surface
    onInverseSurface: AppColors.darkBackground, // Text on inverse surface
    inversePrimary: AppColors.darkHighlight, // Inverse primary
  );

  // Light Theme
  static const lightBackground = Color(
    0xFFF9FAFF,
  ); // Light background with subtle lilac
  static const lightCard = Color(0xFFEFF0FB); // Light card with lilac tint
  static const lightTextPrimary = Color(
    0xFF1F1F1F,
  ); // Dark text for primary content
  static const lightTextSecondary = Color(
    0xFF6B6B80,
  ); // Gray for secondary text
  static const lightHighlight = Color(
    0xFF6C63FF,
  ); // Purple highlight for charts/buttons
  static const lightPositive = Color(
    0xFF39D353,
  ); // Green for positive indicators
  static const lightNegative = Color(0xFFF85149); // Red for negative indicators
  static const lightBorder = Color(0xFFDDE0F7); // Subtle border color

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
    shadow: Colors.black12, // Subtle shadows
    surfaceVariant: lightCard, // Variant surface
    onSurfaceVariant: lightTextSecondary, // Text on variant surface
    inverseSurface: lightTextPrimary, // Inverse surface
    onInverseSurface: lightBackground, // Text on inverse surface
    inversePrimary: lightHighlight, // Inverse primary
  );
}
