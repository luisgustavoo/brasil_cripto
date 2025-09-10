import 'package:flutter/material.dart';

abstract final class AppColors {
  // Dark Theme
  static const darkBackground = Color(0xFF0D1117);
  static const darkCard = Color(0xFF161B22);
  static const darkTextPrimary = Color(0xFFC9D1D9);
  static const darkTextSecondary = Color(0xFF8B949E);
  static const darkPositive = Color(0xFF39D353);
  static const darkNegative = Color(0xFFF85149);
  static const darkHighlight = Color(0xFF238636);

  // Light Theme
  static const lightBackground = Color(0xFFF5F5F5);
  static const lightCard = Color(0xFFFFFFFF);
  static const lightTextPrimary = Color(0xFF101010);
  static const lightTextSecondary = Color(0xFF4D4D4D);
  static const lightPositive = Color(0xFF27AE60);
  static const lightNegative = Color(0xFFE74C3C);
  static const lightHighlight = Color(0xFF3498DB);

  // ColorSchemes
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
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: darkHighlight,
    onPrimary: Colors.white,
    secondary: darkHighlight,
    onSecondary: Colors.white,
    surface: darkCard,
    onSurface: darkTextPrimary,
    error: darkNegative,
    onError: darkTextPrimary,
  );
}
