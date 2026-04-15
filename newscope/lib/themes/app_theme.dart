import 'package:flutter/material.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.studioBlue,
      primary: AppColors.studioBlue,
      secondary: AppColors.broadcastRed,
      surface: AppColors.paperWhite,
      brightness: Brightness.light,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.ivory,
      textTheme: TextTheme(
        displayLarge: AppTextStyles.masthead,
        headlineMedium: AppTextStyles.pageTitle,
        titleLarge: AppTextStyles.sectionTitle,
        titleMedium: AppTextStyles.headline,
        bodyLarge: AppTextStyles.body,
        bodyMedium: AppTextStyles.body,
        labelLarge: AppTextStyles.button,
      ),
      dividerColor: AppColors.softGray,
      cardTheme: CardTheme(
        elevation: 0,
        color: AppColors.paperWhite,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: const BorderSide(color: AppColors.softGray),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.studioBlue,
        foregroundColor: AppColors.paperWhite,
        centerTitle: false,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.broadcastRed,
          foregroundColor: AppColors.paperWhite,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: AppTextStyles.button,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.studioBlue,
          side: const BorderSide(color: AppColors.studioBlue),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: AppTextStyles.button,
        ),
      ),
    );
  }
}
