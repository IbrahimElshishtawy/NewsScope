import 'package:flutter/material.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class CustomWeatherCard extends StatelessWidget {
  const CustomWeatherCard({
    super.key,
    required this.label,
    required this.value,
    required this.details,
    required this.icon,
  });

  final String label;
  final String value;
  final String details;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
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
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            decoration: const BoxDecoration(
              color: AppColors.midnightBlue,
              borderRadius: BorderRadius.vertical(top: Radius.circular(19)),
            ),
            child: Row(
              children: [
                Icon(icon, color: AppColors.paperWhite),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    label,
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.paperWhite,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: AppTextStyles.pageTitle.copyWith(
                    fontSize: 26,
                    color: AppColors.broadcastRed,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  details,
                  style: AppTextStyles.body.copyWith(
                    fontSize: 15,
                    color: AppColors.steelGray,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
