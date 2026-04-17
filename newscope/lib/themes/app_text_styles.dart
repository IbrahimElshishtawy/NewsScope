import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newscope/themes/app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();

  static TextStyle get masthead => GoogleFonts.notoNaskhArabic(
    fontSize: 34,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: 0.1,
    color: AppColors.paperWhite,
  );

  static TextStyle get pageTitle => GoogleFonts.notoNaskhArabic(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    height: 1.28,
    letterSpacing: 0,
    color: AppColors.midnightBlue,
  );

  static TextStyle get headline => GoogleFonts.notoNaskhArabic(
    fontSize: 23,
    fontWeight: FontWeight.w700,
    height: 1.35,
    color: AppColors.midnightBlue,
  );

  static TextStyle get sectionTitle =>
      headline.copyWith(fontSize: 21, letterSpacing: 0.15);

  static TextStyle get body => GoogleFonts.cairo(
    fontSize: 17,
    fontWeight: FontWeight.w400,
    height: 1.6,
    color: AppColors.charcoal,
  );

  static TextStyle get bodyStrong =>
      body.copyWith(fontWeight: FontWeight.w600, color: AppColors.midnightBlue);

  static TextStyle get ticker => GoogleFonts.cairo(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    height: 1.25,
    letterSpacing: 0.25,
    color: AppColors.paperWhite,
  );

  static TextStyle get caption => GoogleFonts.cairo(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    height: 1.3,
    letterSpacing: 0.15,
    color: AppColors.steelGray,
  );

  static TextStyle get meta => caption;

  static TextStyle get button => GoogleFonts.cairo(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: 0.1,
    color: AppColors.paperWhite,
  );
}
