import 'package:flutter/material.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (eyebrow != null) ...[
          Text(
            eyebrow!.toUpperCase(),
            style: AppTextStyles.caption.copyWith(
              color: AppColors.broadcastRed,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 6),
        ],
        Text(title, style: AppTextStyles.sectionTitle),
        const SizedBox(height: 6),
        Container(width: 72, height: 3, color: AppColors.broadcastRed),
        if (subtitle != null) ...[
          const SizedBox(height: 10),
          Text(
            subtitle!,
            style: AppTextStyles.body.copyWith(color: AppColors.steelGray),
          ),
        ],
      ],
    );
  }
}
