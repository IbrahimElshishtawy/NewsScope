import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newscope/themes/app_colors.dart';

class AppTextStyles {
  static TextStyle get masthead => GoogleFonts.libreBaskerville(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    height: 1.2,
    color: AppColors.paperWhite,
    letterSpacing: 0.6,
  );

  static TextStyle get pageTitle => GoogleFonts.libreBaskerville(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    height: 1.25,
    color: AppColors.midnightBlue,
  );

  static TextStyle get sectionTitle => GoogleFonts.libreBaskerville(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 1.3,
    color: AppColors.midnightBlue,
  );

  static TextStyle get headline => GoogleFonts.libreBaskerville(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    height: 1.35,
    color: AppColors.midnightBlue,
  );

  static TextStyle get body => GoogleFonts.sourceSans3(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.6,
    color: AppColors.charcoal,
  );

  static TextStyle get bodyStrong => GoogleFonts.sourceSans3(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
    color: AppColors.charcoal,
  );

  static TextStyle get meta => GoogleFonts.sourceSans3(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.8,
    color: AppColors.steelGray,
  );

  static TextStyle get button => GoogleFonts.sourceSans3(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.4,
  );
}
