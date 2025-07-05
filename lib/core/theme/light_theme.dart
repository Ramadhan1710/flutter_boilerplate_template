import 'package:flutter/material.dart';
import 'app_colors.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.lightScaffold,
  primaryColor: AppColors.lightPrimary,
  colorScheme: ColorScheme.light(
    primary: AppColors.lightPrimary,
    background: AppColors.lightBackground,
    error: AppColors.error,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: AppColors.lightText),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.lightPrimary,
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.lightPrimary,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ),
);
