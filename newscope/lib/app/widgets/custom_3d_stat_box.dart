import 'package:flutter/material.dart';
import 'package:newscope/app/theme/app_3d_styles.dart';
import 'package:newscope/app/widgets/custom_3d_badge.dart';
import 'package:newscope/app/widgets/custom_3d_card.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class Custom3dStatBox extends StatelessWidget {
  const Custom3dStatBox({
    super.key,
    required this.label,
    required this.value,
    required this.caption,
    this.icon,
    this.tone = App3dTone.surface,
  });

  final String label;
  final String value;
  final String caption;
  final IconData? icon;
  final App3dTone tone;

  @override
  Widget build(BuildContext context) {
    final isDark = tone != App3dTone.surface;
    final foreground = isDark ? AppColors.paperWhite : AppColors.midnightBlue;
    final secondary = isDark ? AppColors.softGray : AppColors.steelGray;

    return SizedBox(
      width: 240,
      child: Custom3dCard(
        tone: tone,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Custom3dBadge(
                  label: label,
                  icon: icon,
                  backgroundColor: isDark
                      ? Colors.white.withValues(alpha: 0.12)
                      : AppColors.midnightBlue.withValues(alpha: 0.08),
                  foregroundColor: foreground,
                ),
                const Spacer(),
                Container(
                  width: 48,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.broadcastRed,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Text(
              value,
              style: AppTextStyles.pageTitle.copyWith(
                color: tone == App3dTone.accent
                    ? AppColors.paperWhite
                    : foreground,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              caption,
              style: AppTextStyles.body.copyWith(
                color: secondary,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
