import 'package:flutter/material.dart';
import 'app_colors.dart';

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.darkScaffold,
  primaryColor: AppColors.darkPrimary,
  colorScheme: ColorScheme.dark(
    primary: AppColors.darkPrimary,
    background: AppColors.darkBackground,
    error: AppColors.error,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: AppColors.darkText),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.darkPrimary,
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.darkPrimary,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ),
);
