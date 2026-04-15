import 'package:flutter/material.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class CustomSectionTitle extends StatelessWidget {
  const CustomSectionTitle({super.key, required this.title, this.subtitle});

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.sectionTitle),
        const SizedBox(height: 6),
        Container(width: 72, height: 3, color: AppColors.broadcastRed),
        if (subtitle != null) ...[
          const SizedBox(height: 10),
          Text(subtitle!, style: AppTextStyles.body),
        ],
      ],
    );
  }
}
