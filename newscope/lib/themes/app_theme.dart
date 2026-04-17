import 'package:flutter/material.dart';
import 'package:newscope/app/theme/app_depth_tokens.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get lightTheme {
    final colorScheme =
        ColorScheme.fromSeed(
          seedColor: AppColors.darkNavyBlue,
          brightness: Brightness.light,
        ).copyWith(
          primary: AppColors.darkNavyBlue,
          onPrimary: AppColors.paperWhite,
          secondary: AppColors.strongRed,
          onSecondary: AppColors.paperWhite,
          surface: AppColors.paperWhite,
          onSurface: AppColors.charcoal,
          outline: AppColors.borderGray,
          shadow: AppColors.shadow,
          surfaceTint: Colors.transparent,
        );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: const Color(0xFF071527),
      textTheme: TextTheme(
        displayLarge: AppTextStyles.masthead,
        headlineLarge: AppTextStyles.pageTitle,
        headlineMedium: AppTextStyles.headline,
        titleLarge: AppTextStyles.sectionTitle,
        bodyLarge: AppTextStyles.body,
        bodyMedium: AppTextStyles.body,
        bodySmall: AppTextStyles.caption,
        labelMedium: AppTextStyles.ticker,
        labelLarge: AppTextStyles.button,
      ),
      dividerColor: AppColors.softGray,
      iconTheme: const IconThemeData(color: AppColors.midnightBlue),
      cardTheme: CardThemeData(
        elevation: 0,
        color: const Color(0xFFF5F7FB),
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDepthTokens.radiusMd),
          side: const BorderSide(color: AppColors.borderGray),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.paperWhite,
        centerTitle: false,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: AppTextStyles.sectionTitle.copyWith(
          color: AppColors.paperWhite,
        ),
        toolbarTextStyle: AppTextStyles.caption.copyWith(
          color: AppColors.softGray,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.broadcastRed,
          foregroundColor: AppColors.paperWhite,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDepthTokens.radiusSm),
          ),
          textStyle: AppTextStyles.button,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.broadcastRed,
          textStyle: AppTextStyles.button.copyWith(
            color: AppColors.broadcastRed,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.studioBlue,
          side: const BorderSide(color: AppColors.studioBlue),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDepthTokens.radiusSm),
          ),
          textStyle: AppTextStyles.button,
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.midnightBlue.withValues(alpha: 0.06),
        side: const BorderSide(color: AppColors.borderGray),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDepthTokens.radiusXl),
        ),
        labelStyle: AppTextStyles.caption,
        selectedColor: AppColors.broadcastRed,
        secondarySelectedColor: AppColors.broadcastRed,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFF6F8FB),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDepthTokens.radiusSm),
          borderSide: const BorderSide(color: AppColors.borderGray),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDepthTokens.radiusSm),
          borderSide: const BorderSide(color: AppColors.borderGray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDepthTokens.radiusSm),
          borderSide: const BorderSide(
            color: AppColors.broadcastRed,
            width: 1.4,
          ),
        ),
        labelStyle: AppTextStyles.caption,
        hintStyle: AppTextStyles.body.copyWith(color: AppColors.newsroomGray),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: AppColors.studioBlue,
        textColor: AppColors.charcoal,
        titleTextStyle: AppTextStyles.bodyStrong,
        subtitleTextStyle: AppTextStyles.caption,
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.borderGray,
        thickness: 1,
        space: 1,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.midnightBlue,
        contentTextStyle: AppTextStyles.body.copyWith(
          color: AppColors.paperWhite,
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
