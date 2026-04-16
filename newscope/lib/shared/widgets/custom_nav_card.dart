import 'package:flutter/material.dart';
import 'package:newscope/data/models/dashboard_destination.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class CustomNavCard extends StatelessWidget {
  const CustomNavCard({
    super.key,
    required this.destination,
    required this.onTap,
  });

  final DashboardDestination destination;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Ink(
          decoration: BoxDecoration(
            color: AppColors.paperWhite,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: AppColors.borderGray),
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadow,
                blurRadius: 18,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.broadcastRed,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.studioBlue.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(
                        destination.icon,
                        color: AppColors.studioBlue,
                        size: 28,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      destination.scheduleLabel,
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.broadcastRed,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Text(destination.title, style: AppTextStyles.headline),
                const SizedBox(height: 10),
                Text(
                  destination.summary,
                  style: AppTextStyles.body.copyWith(
                    fontSize: 15,
                    color: AppColors.steelGray,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      'Open Page',
                      style: AppTextStyles.bodyStrong.copyWith(fontSize: 15),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.midnightBlue,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: const Icon(
                        Icons.arrow_forward_outlined,
                        size: 16,
                        color: AppColors.paperWhite,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
