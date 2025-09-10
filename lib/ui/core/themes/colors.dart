import 'package:flutter/material.dart';

abstract final class AppColors {
  // Primárias
  static const black1 = Color(0xFF101010);
  static const white1 = Color(0xFFFFFFFF);

  // Neutras / Cinzas
  static const grey1 = Color(0xFFF5F5F5);
  static const grey2 = Color(0xFF7D7D7D);
  static const grey3 = Color(0xFFB0B0B0);

  // Transparências
  static const whiteTransparent = Color(0x4DFFFFFF); // 30% de opacidade
  static const blackTransparent = Color(0x4D000000);

  // Cores de status
  static const red1 = Color(0xFFE74C3C); // Erro / Negativo
  static const green1 = Color(0xFF27AE60); // Sucesso / Positivo
  static const yellow1 = Color(0xFFF1C40F); // Avisos / Alertas

  // ColorScheme para tema claro
  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.black1,
    onPrimary: AppColors.white1,
    secondary: AppColors.green1,
    onSecondary: AppColors.white1,
    surface: AppColors.white1,
    onSurface: AppColors.black1,
    error: AppColors.red1,
    onError: AppColors.white1,
  );

  // ColorScheme para tema escuro
  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.white1,
    onPrimary: AppColors.black1,
    secondary: AppColors.green1,
    onSecondary: AppColors.black1,
    surface: AppColors.black1,
    onSurface: AppColors.white1,
    error: AppColors.red1,
    onError: AppColors.black1,
  );
}
