import 'package:flutter/material.dart';
import 'package:newscope/app/widgets/custom_3d_badge.dart';
import 'package:newscope/app/widgets/custom_3d_card.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class Custom3dNavTile extends StatelessWidget {
  const Custom3dNavTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.schedule,
    required this.icon,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final String schedule;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Custom3dCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.broadcastRed.withValues(alpha: 0.9),
                      AppColors.midnightBlue.withValues(alpha: 0.9),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
                child: Icon(icon, color: AppColors.paperWhite),
              ),
              const Spacer(),
              Custom3dBadge(
                label: schedule,
                backgroundColor: AppColors.midnightBlue.withValues(alpha: 0.08),
                foregroundColor: AppColors.broadcastRed,
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(title, style: AppTextStyles.headline),
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: AppTextStyles.body.copyWith(
              color: AppColors.steelGray,
              fontSize: 15,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Text(
                'فتح الصفحة',
                style: AppTextStyles.bodyStrong.copyWith(
                  color: AppColors.midnightBlue,
                ),
              ),
              const Spacer(),
              Container(
                width: 34,
                height: 34,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.midnightBlue,
                ),
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  size: 18,
                  color: AppColors.paperWhite,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
