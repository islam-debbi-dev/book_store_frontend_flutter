import 'package:flutter/material.dart';
import 'app_theme.dart';

final ThemeData appThemeDark = ThemeData(
  brightness: Brightness.dark,
  dialogBackgroundColor: const Color.fromARGB(255, 37, 35, 35),
  primaryColor: AppColors.primaryColor,
  colorScheme: ColorScheme.fromSwatch(brightness: Brightness.dark).copyWith(
    secondary: AppColors.secondaryColor,
    primary: AppColors.primaryColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.grey.shade800,
      foregroundColor: Colors.white,
    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.grey.shade800,
    textTheme: ButtonTextTheme.primary,
  ),

  shadowColor: Colors.white.withOpacity(0.5),
  // background color
  scaffoldBackgroundColor: const Color.fromARGB(255, 27, 27, 27),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white),
    bodySmall: TextStyle(color: Colors.white),
    displayLarge: TextStyle(color: Colors.white),
    displayMedium: TextStyle(color: Colors.white),
    displaySmall: TextStyle(color: Colors.white),
    headlineLarge: TextStyle(color: Colors.white),
    headlineMedium: TextStyle(color: Colors.white),
    headlineSmall: TextStyle(color: Colors.white),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.secondaryColor,
    foregroundColor: Colors.white,
  ),
  // Add more dark theme customizations as needed
);
