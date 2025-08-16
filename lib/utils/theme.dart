import 'package:flutter/material.dart';

class AppColors {
  static const Color olive = Color(0xFF878E76);
  static const Color primary = Color(0xFFDF3821);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color teal = Color(0xFF0C7C59);
}

final ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.white,

  fontFamily: 'Roboto',

  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.white,
    secondary: AppColors.teal,
    onSecondary: AppColors.white,
    background: AppColors.olive,
    onBackground: AppColors.black,
    surface: AppColors.white,
    onSurface: AppColors.black,
    error: Colors.red,
    onError: AppColors.white,
  ),

  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: AppColors.white),
    titleTextStyle: TextStyle(
      color: AppColors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),

  textTheme: TextTheme(
    bodyLarge: TextStyle(color: AppColors.black, fontSize: 16),
    bodyMedium: TextStyle(color: AppColors.black, fontSize: 14),
    titleLarge: TextStyle(
      color: AppColors.primary,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
    labelLarge: TextStyle(color: AppColors.teal),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: TextStyle(fontWeight: FontWeight.bold),
    ),
  ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.teal,
    foregroundColor: AppColors.white,
  ),

  cardColor: AppColors.olive,
);
