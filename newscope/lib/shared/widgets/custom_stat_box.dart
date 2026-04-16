import 'package:flutter/material.dart';
import 'package:newscope/data/models/program_metric.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class CustomStatBox extends StatelessWidget {
  const CustomStatBox({super.key, required this.metric});

  final ProgramMetric metric;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.paperWhite,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderGray),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(width: 44, height: 4, color: AppColors.broadcastRed),
          const SizedBox(height: 14),
          Text(metric.label, style: AppTextStyles.caption),
          const SizedBox(height: 10),
          Text(
            metric.value,
            style: AppTextStyles.pageTitle.copyWith(
              fontSize: 26,
              color: AppColors.broadcastRed,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            metric.caption,
            style: AppTextStyles.body.copyWith(
              fontSize: 15,
              color: AppColors.steelGray,
            ),
          ),
        ],
      ),
    );
  }
}
