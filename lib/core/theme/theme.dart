import 'package:flutter/material.dart';
import 'package:foody/core/constants/colors.dart';
import 'package:foody/core/constants/radius.dart';

class AppTheme {
  static ThemeData light(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: AppColors.orange100,
      fontFamily: "SofiaPro",
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontWeight: FontWeight.w500),
        bodyMedium: TextStyle(fontWeight: FontWeight.w500),
      ).apply(
        bodyColor: AppColors.dark100,
        displayColor: AppColors.dark100,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppRadius.border12),
          ),
          borderSide: const BorderSide(color: AppColors.gray50, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppRadius.border12),
          ),
          borderSide: const BorderSide(color: AppColors.gray50, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppRadius.border12),
          ),
          borderSide: const BorderSide(color: AppColors.orange50, width: 1.0),
        ),
      ),
    );
  }
}
