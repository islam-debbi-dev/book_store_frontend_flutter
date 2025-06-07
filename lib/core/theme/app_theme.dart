import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor =
      Color.fromARGB(255, 70, 51, 22); // Example green
  static const Color secondaryColor =
      Color.fromARGB(255, 128, 121, 86); // Example lighter green
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
