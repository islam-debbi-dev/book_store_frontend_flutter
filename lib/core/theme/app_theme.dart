import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF244B2C); // Example green
  static const Color secondaryColor =
      Color(0xFF4CAF50); // Example lighter green
  // Add more custom colors as needed
}

final ThemeData appTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.secondaryColor,
    primary: AppColors.primaryColor,
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primaryColor,
    foregroundColor: Colors.white,
  ),
  // Add more theme customizations as needed
);
