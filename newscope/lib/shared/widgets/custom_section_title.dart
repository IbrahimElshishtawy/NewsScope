import 'package:flutter/material.dart';
import 'package:newscope/app/widgets/custom_3d_section_header.dart';
import 'package:newscope/themes/app_colors.dart';

class CustomSectionTitle extends StatelessWidget {
  const CustomSectionTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.eyebrow,
  });

  final String title;
  final String? subtitle;
  final String? eyebrow;

  @override
  Widget build(BuildContext context) {
    return Custom3dSectionHeader(
      title: title,
      subtitle: subtitle,
      eyebrow: eyebrow,
      foregroundColor: AppColors.midnightBlue,
      secondaryColor: AppColors.steelGray,
    );
  }
}
