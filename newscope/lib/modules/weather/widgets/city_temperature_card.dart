import 'package:flutter/material.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class CityTemperatureCard extends StatelessWidget {
  const CityTemperatureCard({
    super.key,
    required this.city,
    required this.temperature,
    required this.range,
    required this.condition,
    required this.icon,
  });

  final String city;
  final String temperature;
  final String range;
  final String condition;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: AppColors.paperWhite,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: AppColors.midnightBlue.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: AppColors.midnightBlue),
              ),
              const SizedBox(width: 12),
              Expanded(child: Text(city, style: AppTextStyles.bodyStrong)),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            temperature,
            style: AppTextStyles.pageTitle.copyWith(
              color: AppColors.broadcastRed,
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 6),
          Text(condition, style: AppTextStyles.body),
          const SizedBox(height: 8),
          Text(
            range,
            style: AppTextStyles.caption.copyWith(color: AppColors.steelGray),
          ),
        ],
      ),
    );
  }
}
