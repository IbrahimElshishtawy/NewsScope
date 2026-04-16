import 'package:flutter/material.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class ScoreBox extends StatelessWidget {
  const ScoreBox({
    super.key,
    required this.label,
    required this.value,
    required this.caption,
  });

  final String label;
  final String value;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: const Color(0xFF0E2440),
        border: Border.all(color: AppColors.paperWhite.withValues(alpha: 0.10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyles.caption.copyWith(color: AppColors.softGray),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: AppTextStyles.pageTitle.copyWith(
              color: AppColors.paperWhite,
              fontSize: 28,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            caption,
            style: AppTextStyles.body.copyWith(
              color: AppColors.softGray,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
