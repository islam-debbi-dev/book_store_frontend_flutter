import 'package:flutter/material.dart';
import 'app_theme.dart';

final ThemeData appThemeLight = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primaryColor,
  colorScheme: ColorScheme.fromSwatch(brightness: Brightness.light).copyWith(
    secondary: AppColors.secondaryColor,
    primary: AppColors.primaryColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.grey.shade300,
      foregroundColor: Colors.black,
    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.grey.shade300,
    textTheme: ButtonTextTheme.primary,
  ),
  shadowColor: Colors.black.withOpacity(0.9),
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.primaryColor),
    bodyMedium: TextStyle(color: AppColors.primaryColor),
    bodySmall: TextStyle(color: AppColors.primaryColor),
    displayLarge: TextStyle(color: AppColors.primaryColor),
    displayMedium: TextStyle(color: AppColors.primaryColor),
    displaySmall: TextStyle(color: AppColors.primaryColor),
    headlineLarge: TextStyle(color: AppColors.primaryColor),
    headlineMedium: TextStyle(color: AppColors.primaryColor),
    headlineSmall: TextStyle(color: AppColors.primaryColor),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primaryColor,
    foregroundColor: Colors.white,
  ),
  // Add more light theme customizations as needed
);
